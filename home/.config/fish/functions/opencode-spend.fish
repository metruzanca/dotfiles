function opencode-spend --description 'Show total opencode spend and tokens for a project folder'
    set -l target .
    if test (count $argv) -ge 1
        set target $argv[1]
    end

    # Resolve the argument relative to the current directory.
    if not string match -q '/*' -- "$target"
        set target "$PWD/$target"
    end
    set -l folder (path normalize "$target")

    if not test -d "$folder"
        echo "opencode-spend: no such directory: $target" >&2
        return 1
    end

    # opencode keys projects by git worktree; fall back to the folder itself.
    set -l worktree (command git -C "$folder" rev-parse --show-toplevel 2>/dev/null)
    if test -z "$worktree"
        set worktree "$folder"
    end
    set worktree (path normalize "$worktree")

    if not command -q node
        echo "opencode-spend: node is required to read the opencode database" >&2
        return 1
    end

    set -l candidates "$HOME/.local/share/opencode" "$HOME/Library/Application Support/opencode"
    if set -q XDG_DATA_HOME; and test -n "$XDG_DATA_HOME"
        set -p candidates "$XDG_DATA_HOME/opencode"
    end

    set -l data_dir ""
    for dir in $candidates
        if test -d "$dir"
            set data_dir "$dir"
            break
        end
    end

    if test -z "$data_dir"
        echo "opencode-spend: opencode data directory not found" >&2
        return 1
    end

    set -l db ""
    for name in opencode-stable.db opencode.db
        if test -f "$data_dir/$name"
            set db "$data_dir/$name"
            break
        end
    end

    if test -z "$db"
        echo "opencode-spend: no opencode database in $data_dir" >&2
        return 1
    end

    set -l js '
import { DatabaseSync } from "node:sqlite";

const db = new DatabaseSync(process.env.OPENCODE_DB, { readOnly: true });
const folder = process.env.OPENCODE_FOLDER;
const worktree = process.env.OPENCODE_WORKTREE;

const projects = db.prepare("SELECT id, worktree FROM project").all();
const exact = projects.filter((p) => p.worktree === worktree || p.worktree === folder);
const matched = exact.length
  ? exact
  : projects.filter((p) => {
      const roots = [worktree, folder];
      return roots.some((root) => {
        if (root === "/") return true;
        return p.worktree === root ||
          p.worktree.startsWith(root + "/") ||
          root.startsWith(p.worktree + "/");
      });
    });

if (matched.length === 0) {
  console.log("No opencode project found for " + folder);
  process.exit(0);
}

const ids = matched.map((p) => p.id);
const placeholders = ids.map(() => "?").join(",");
const row = db.prepare(
  "SELECT COUNT(*) AS sessions, " +
  "COALESCE(SUM(cost), 0) AS cost, " +
  "COALESCE(SUM(tokens_input), 0) AS tokens_input, " +
  "COALESCE(SUM(tokens_output), 0) AS tokens_output, " +
  "COALESCE(SUM(tokens_reasoning), 0) AS tokens_reasoning, " +
  "COALESCE(SUM(tokens_cache_read), 0) AS tokens_cache_read, " +
  "COALESCE(SUM(tokens_cache_write), 0) AS tokens_cache_write " +
  "FROM session WHERE project_id IN (" + placeholders + ")"
).get(...ids);

if (!row.sessions) {
  console.log("No opencode sessions found for " + folder);
  process.exit(0);
}

console.log("Project:  " + matched.map((p) => p.worktree).join(", "));
console.log("Sessions: " + row.sessions);
console.log("Cost:     $" + row.cost.toFixed(4));
console.log("Tokens:   in=" + row.tokens_input +
  " out=" + row.tokens_output +
  " reasoning=" + row.tokens_reasoning +
  " cache_read=" + row.tokens_cache_read +
  " cache_write=" + row.tokens_cache_write);
'

    OPENCODE_DB="$db" OPENCODE_FOLDER="$folder" OPENCODE_WORKTREE="$worktree" node --input-type=module -e $js
end
