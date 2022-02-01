#!/usr/bin/env bash

# Copyright 2022 Dan Cassidy

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# SPDX-License-Identifier: GPL-3.0-or-later


[[ $# -lt 1 ]] && { printf 'need file(s) to run on\n'; exit 1; }

set -e
for file in "${@}"; do
    # set up file variables
    input_file="${file}"
    temp_file="$(mktemp -p . "${input_file}.XXXXXXXXXX.tmp")"
    output_file="${input_file%%.*}.nexusbbcode"
    cp "${input_file}" "${temp_file}"

    # convert '...\n===' headers to '[size=5][b]...[/b][/size]'
    perl -0777pi -e 's{(.*)\n={3,}+}{[size=5][b]${1}[/b][/size]}g' "${temp_file}"
    # convert '...\n---' headers to '[size=4][b][u]...:[/u][/b][/size]'
    perl -0777pi -e 's{(.*)\n-{3,}+}{[size=4][b][u]${1}:[/u][/b][/size]}g' "${temp_file}"
    # remove anchor links
    sed -Ei 's|\[([^]]*)]\(#[^)]*\)|\1|g' "${temp_file}"
    # remove any remaining '(TOC)' lines and an extra newline
    perl -0777pi -e 's{\n\(TOC\)\n}{}g' "${temp_file}"
    # remove '<details><summary>...</summary>' and '</details>' and extra newline on each
    perl -0777pi -e 's{\n<details>.*?</summary>\n}{}g; s{\n</details>\n}{}g' "${temp_file}"
    # convert '**...**' and '__...__' to '[b]...[/b]'
    perl -pi -e 'no warnings qw(experimental::vlb) ; s{(?<=^|\W)\*\*(.+?)\*\*(?=\W)}{[b]${1}[/b]}g ; s{(?<=^|\W)__(.+?)__(?=\W)}{[b]${1}[/b]}g' "${temp_file}"
    # convert '*...*' and '_..._' to '[i]...[/i]'
    perl -pi -e 'no warnings qw(experimental::vlb) ; s{(?<=^|\W)\*(.+?)\*(?=\W)}{[u]${1}[/u]}g ; s{(?<=^|\W)_(.+?)_(?=\W)}{[u]${1}[/u]}g' "${temp_file}"
    # convert markdown URLs to BBCode URLs
    sed -Ei 's|\[([^]]*)]\(([^)]*)\)|[url=\2]\1[/url]|g' "${temp_file}"
    # convert '`...`' to '[font=Courier New][color=#rrggbb]...[/color][/font]'
    sed -Ei 's|`([^`]*)`|[font=Courier New][color=#b2b2b2]\1[/color][/font]|g' "${temp_file}"
    # convert indented code to '    [font=Courier New][color=#rrggbb]...[/color][/font]'
    perl -pi -e 's{^[ ]{4,}+(?!-|\* )(.*)$}{    [font=Courier New][color=#b2b2b2]${1}[/color][/font]}g' "${temp_file}"

    # if the contents of the temp and output files don't match, overwrite the output file with the temp file
    if [[ $(sha512sum "${output_file}" | cut -d ' ' -f 1) != $(sha512sum "${temp_file}" | cut -d ' ' -f 1) ]]; then
        mv "${temp_file}" "${output_file}"
    else
        rm "${temp_file}"
    fi
done
