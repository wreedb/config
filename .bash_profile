#!/bin/sh
# -*- mode: bash; -*- vim:ft=bash

pgrep ssh-agent && true || ssh-agent -a "${XDG_RUNTIME_DIR}/ssh-agent.socket"
ssh-add >/dev/null 2>&1
