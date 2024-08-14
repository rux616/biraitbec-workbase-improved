# Copyright 2024 Dan Cassidy

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY# without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# SPDX-License-Identifier: GPL-3.0-or-later


# --------------------------------------------------------------------------------------------------
# this script contains useful classes in support of the WBI project
# --------------------------------------------------------------------------------------------------


class FO4Version : System.IComparable, System.IEquatable[Object] {
    [System.Version] $Version
    [long] $SteamBuildID

    FO4Version() {
        $this.Init(@{})
    }

    FO4Version([hashtable]$Properties) {
        $this.Init($Properties)
    }

    FO4Version([System.Version] $version, [long] $steamBuildID) {
        $this.Init(@{Version = $version; SteamBuildID = $steamBuildID })
    }

    FO4Version([string] $version, [long] $steamBuildID) {
        $this.Init(@{Version = [System.Version] $version; SteamBuildID = $steamBuildID })
    }

    FO4Version([string] $version_string) {
        # in case the version string is in the format of "Fallout 4 vX.Y.Z.W-abcd", this extracts the version part
        $version_string = $version_string -split ' ' | Select-Object -Last 1
        # get rid of the 'v' prefix if its there
        $version_string = $version_string -replace 'v', ''
        # split the version and build ID
        $version_list = $version_string -split '-'
        # initialize the object
        $this.Init(@{Version = [System.Version] $version_list[0]; SteamBuildID = [long] $version_list[1] })
    }

    # shared initialization function
    [void] Init([hashtable]$Properties) {
        foreach ($Property in $Properties.Keys) {
            $this.$Property = $Properties.$Property
        }
    }

    [string] ToString() {
        return "$($this.Version)-$($this.SteamBuildID)"
    }

    [string] ToString([bool] $long) {
        if ($long) {
            return "Version: $($this.Version), Build ID: $($this.SteamBuildID)"
        }
        else {
            return $this.ToString()
        }
    }

    [int] CompareTo([object] $obj) {
        if ($null -eq $obj) { return 1 }
        if ($obj -isnot [FO4Version]) { throw "Object must be of type $($this.GetType().Name)" }

        $other = [FO4Version] $obj

        $version_comparison = $this.Version.CompareTo($other.Version)
        if ($version_comparison -eq 0) {
            return $this.SteamBuildID.CompareTo($other.SteamBuildID)
        }
        else {
            return $version_comparison
        }
    }

    [bool] Equals([object] $obj) {
        if ($null -eq $obj) { return $false }
        if ($obj -isnot [FO4Version]) { return $false }

        $other = [FO4Version] $obj

        return $this.Version.Equals($other.Version) -and $this.SteamBuildID.Equals($other.SteamBuildID)
    }
}
