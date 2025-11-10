# SPDX-FileCopyrightText: 2025 Will Reed <wreed@disroot.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

playbook := "ansible.yml"


[group("check")]
check-dirs:
    ansible-playbook {{playbook}} --tags dirs --check

[group("check")]
check-config:
    ansible-playbook {{playbook}} --tags config --check

[group("ansible")]
dirs:
    ansible-playbook {{playbook}} --tags dirs

[group("ansible")]
config:
    ansible-playbook {{playbook}} --tags config

[group("git")]
log:
    git log

[group("git")]
commit:
    convco commit -i
