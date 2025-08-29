# How I use Fish Shell

```bash
├── conf.d/
│   ├── ...
│   └── config.fish
├── functions/
├── config.fish # This file is gitignored
└── readme.md   # you are here
```

## Main config file

I got tired of having to be careful not to commit things that were appended to my fish config file, so I decided I'd move it from `$HOME/.config/fish/config.fish` to `$HOME/.config/fish/config.d/config.fish`. Turns out `conf.d` is loaded before the main config file anyways, so this changes basically nothing.

As a result now the default config file can remain as a local config file. Any tool that wants to append things can do so and I don't have to care.

At any time I can look at my local config and move some of those into a `conf.d` file.

## General practices

All my fish configs are written in such a way that I make no assumptions about what is installed. This is both so that each machine can be using all or none of my preferred apps and I still get access to my fish config. Before I use any command/app/tool, I check that it exists.

## conf.d directory

This directory contains specific tool/app configurations. This keeps my config file more specific to shell configurations.

Generally, if a tool appends a blob of code to my config file, that's a good candidate for something to go into a separate conf.d file. So another way of viewing files besides config.fish, is that they're all code-gen'd. Where as config.fish is code I've written.

## functions

Another great feature of fish, each file named after a command is a sort of lazy-evaluated script. All files here are only loaded when the function is called. So e.g. if I never uses `bass`, it'll never be evaluated.
