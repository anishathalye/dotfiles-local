# Dotfiles (local) [![Build Status](https://github.com/anishathalye/dotfiles-local/actions/workflows/ci.yml/badge.svg)](https://github.com/anishathalye/dotfiles-local/actions/workflows/ci.yml)

After cloning this repo, run `install` to automatically set up the development
environment. Note that the install script is idempotent - running it multiple
times has no effect.

Dotfiles uses [Dotbot][dotbot] for installation.

This repository contains machine-specific configuration to accompany my
[dotfiles][dotfiles]. The actual contents of this repository probably will not
be useful to anyone but me, but others may be interested in seeing how these
files are organized.

Configuration for specific computers (or groups of computers) is maintained in
separate branches in this repo.

Branch Hierarchy
----------------

```mermaid
graph LR
    master([master]):::active
    mac([mac]):::active
    cursor([cursor]):::active
    handshake([handshake]):::inactive
    openai([openai]):::inactive
    linux([linux]):::active
    a_srvr([a-srvr]):::active
    cursor_linux([cursor-linux]):::active
    gpu([gpu]):::inactive
    zero([zero]):::inactive
    linux_main([linux-main]):::inactive
    google_android([google-android]):::inactive
    xai_linux([xai-linux]):::active
    athena([athena]):::active
    openai_cirrascale([openai-cirrascale]):::inactive
    csail([csail]):::inactive
    telemetry([telemetry]):::inactive
    dropbox([dropbox]):::inactive
    old([old]):::inactive

    master --> mac
    master --> linux
    master --> xai_linux
    master --> athena
    master --> openai_cirrascale
    master --> csail
    master --> telemetry
    master --> dropbox

    mac --> cursor
    mac --> handshake
    mac --> openai

    linux --> a_srvr
    linux --> cursor_linux
    linux --> gpu
    linux --> zero
    linux --> linux_main
    linux --> google_android

    classDef active fill:#cfe2f3,stroke:#3d6fa5,color:#1a1a1a;
    classDef inactive fill:#e8e8e8,stroke:#999999,color:#777777;
```

License
-------

Copyright (c) Anish Athalye. Released under the MIT License. See
[LICENSE.md][license] for details.

[dotbot]: https://github.com/anishathalye/dotbot
[dotfiles]: https://github.com/anishathalye/dotfiles
[license]: LICENSE.md
