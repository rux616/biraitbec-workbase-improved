#!/usr/bin/env python3

# Copyright 2024 Dan Cassidy

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


from argparse import ArgumentParser  # built-in
from enum import IntEnum, IntFlag  # built-in
from functools import partial  # built-in
from io import BufferedIOBase  # built-in
from textwrap import indent  # built-in
from typing import Annotated  # built-in

import dataclasses_struct as dcs  # PyPI: dataclasses-struct

indent = partial(indent, prefix="    ")


def str_int_flags(cls):
    """
    Decorate an IntFlag class to have a `__str__` method that returns the names and values of the
    flags set, including a bit mask for any invalid flags that are not defined in the class.
    """

    def __str__(self) -> str:
        set_flags: list[str] = []
        value = self
        for flag in cls:
            if self & flag:
                set_flags.append(f"{flag.name} ({flag.value:#x})")
        for flag in cls:
            if self & flag:
                value = value & ~flag
        if value:
            set_flags.append(f"Invalid ({value:#b})")
        if set_flags:
            return "\n".join(set_flags)
        else:
            return "(None)"

    cls.__str__ = __str__
    return cls


def str_int_enum(cls):
    """
    Decorate an IntEnum class to have a `__str__` method that returns the name and value of the
    enum.
    """

    def __str__(self) -> str:
        return f"{self.name} ({self.value})"

    cls.__str__ = __str__
    return cls


@str_int_flags
class DDSHeaderFlags(IntFlag):  # size: 4 bytes
    """
    Flags to indicate which members contain valid data.

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-header)

    Size: 4 bytes
    """

    DDSD_CAPS: dcs.U32 = 0x1
    DDSD_HEIGHT: dcs.U32 = 0x2
    DDSD_WIDTH: dcs.U32 = 0x4
    DDSD_PITCH: dcs.U32 = 0x8
    DDSD_PIXELFORMAT: dcs.U32 = 0x1000
    DDSD_MIPMAPCOUNT: dcs.U32 = 0x20000
    DDSD_LINEARSIZE: dcs.U32 = 0x80000
    DDSD_DEPTH: dcs.U32 = 0x800000


@str_int_flags
class DDSHeaderCaps(IntFlag):  # size: 4 bytes
    """
    Specifies the complexity of the surfaces stored.

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-header)

    Size: 4 bytes
    """

    DDSCAPS_COMPLEX: dcs.U32 = 0x8
    DDSCAPS_MIPMAP: dcs.U32 = 0x400000
    DDSCAPS_TEXTURE: dcs.U32 = 0x1000


@str_int_flags
class DDSHeaderCaps2(IntFlag):  # size: 4 bytes
    """
    Additional detail about the surfaces stored.

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-header)

    Size: 4 bytes
    """

    DDSCAPS2_CUBEMAP: dcs.U32 = 0x200
    DDSCAPS2_CUBEMAP_POSITIVEX: dcs.U32 = 0x400
    DDSCAPS2_CUBEMAP_NEGATIVEX: dcs.U32 = 0x800
    DDSCAPS2_CUBEMAP_POSITIVEY: dcs.U32 = 0x1000
    DDSCAPS2_CUBEMAP_NEGATIVEY: dcs.U32 = 0x2000
    DDSCAPS2_CUBEMAP_POSITIVEZ: dcs.U32 = 0x4000
    DDSCAPS2_CUBEMAP_NEGATIVEZ: dcs.U32 = 0x8000
    DDSCAPS2_VOLUME: dcs.U32 = 0x200000


@str_int_flags
class DDSPixelFormatFlags(IntFlag):  # size: 4 bytes
    """
    Values which indicate what type of data is in the surface.

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-pixelformat)

    Size: 4 bytes
    """

    DDPF_ALPHAPIXELS: dcs.U32 = 0x1
    DDPF_ALPHA: dcs.U32 = 0x2
    DDPF_FOURCC: dcs.U32 = 0x4
    DDPF_RGB: dcs.U32 = 0x40
    DDPF_YUV: dcs.U32 = 0x200
    DDPF_LUMINANCE: dcs.U32 = 0x20000


@str_int_enum
class DXGIFormat(IntEnum):  # size: 4 bytes
    # class DXGIFormat(RelaxedIntEnum):  # size: 4 bytes
    """
    Resource data formats, including fully-typed and typeless formats. A list of modifiers at the
    bottom of the reference page more fully describes each format type.

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format)

    Size: 4 bytes
    """

    DXGI_FORMAT_UNKNOWN: dcs.U32 = 0
    DXGI_FORMAT_R32G32B32A32_TYPELESS: dcs.U32 = 1
    DXGI_FORMAT_R32G32B32A32_FLOAT: dcs.U32 = 2
    DXGI_FORMAT_R32G32B32A32_UINT: dcs.U32 = 3
    DXGI_FORMAT_R32G32B32A32_SINT: dcs.U32 = 4
    DXGI_FORMAT_R32G32B32_TYPELESS: dcs.U32 = 5
    DXGI_FORMAT_R32G32B32_FLOAT: dcs.U32 = 6
    DXGI_FORMAT_R32G32B32_UINT: dcs.U32 = 7
    DXGI_FORMAT_R32G32B32_SINT: dcs.U32 = 8
    DXGI_FORMAT_R16G16B16A16_TYPELESS: dcs.U32 = 9
    DXGI_FORMAT_R16G16B16A16_FLOAT: dcs.U32 = 10
    DXGI_FORMAT_R16G16B16A16_UNORM: dcs.U32 = 11
    DXGI_FORMAT_R16G16B16A16_UINT: dcs.U32 = 12
    DXGI_FORMAT_R16G16B16A16_SNORM: dcs.U32 = 13
    DXGI_FORMAT_R16G16B16A16_SINT: dcs.U32 = 14
    DXGI_FORMAT_R32G32_TYPELESS: dcs.U32 = 15
    DXGI_FORMAT_R32G32_FLOAT: dcs.U32 = 16
    DXGI_FORMAT_R32G32_UINT: dcs.U32 = 17
    DXGI_FORMAT_R32G32_SINT: dcs.U32 = 18
    DXGI_FORMAT_R32G8X24_TYPELESS: dcs.U32 = 19
    DXGI_FORMAT_D32_FLOAT_S8X24_UINT: dcs.U32 = 20
    DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS: dcs.U32 = 21
    DXGI_FORMAT_X32_TYPELESS_G8X24_UINT: dcs.U32 = 22
    DXGI_FORMAT_R10G10B10A2_TYPELESS: dcs.U32 = 23
    DXGI_FORMAT_R10G10B10A2_UNORM: dcs.U32 = 24
    DXGI_FORMAT_R10G10B10A2_UINT: dcs.U32 = 25
    DXGI_FORMAT_R11G11B10_FLOAT: dcs.U32 = 26
    DXGI_FORMAT_R8G8B8A8_TYPELESS: dcs.U32 = 27
    DXGI_FORMAT_R8G8B8A8_UNORM: dcs.U32 = 28
    DXGI_FORMAT_R8G8B8A8_UNORM_SRGB: dcs.U32 = 29
    DXGI_FORMAT_R8G8B8A8_UINT: dcs.U32 = 30
    DXGI_FORMAT_R8G8B8A8_SNORM: dcs.U32 = 31
    DXGI_FORMAT_R8G8B8A8_SINT: dcs.U32 = 32
    DXGI_FORMAT_R16G16_TYPELESS: dcs.U32 = 33
    DXGI_FORMAT_R16G16_FLOAT: dcs.U32 = 34
    DXGI_FORMAT_R16G16_UNORM: dcs.U32 = 35
    DXGI_FORMAT_R16G16_UINT: dcs.U32 = 36
    DXGI_FORMAT_R16G16_SNORM: dcs.U32 = 37
    DXGI_FORMAT_R16G16_SINT: dcs.U32 = 38
    DXGI_FORMAT_R32_TYPELESS: dcs.U32 = 39
    DXGI_FORMAT_D32_FLOAT: dcs.U32 = 40
    DXGI_FORMAT_R32_FLOAT: dcs.U32 = 41
    DXGI_FORMAT_R32_UINT: dcs.U32 = 42
    DXGI_FORMAT_R32_SINT: dcs.U32 = 43
    DXGI_FORMAT_R24G8_TYPELESS: dcs.U32 = 44
    DXGI_FORMAT_D24_UNORM_S8_UINT: dcs.U32 = 45
    DXGI_FORMAT_R24_UNORM_X8_TYPELESS: dcs.U32 = 46
    DXGI_FORMAT_X24_TYPELESS_G8_UINT: dcs.U32 = 47
    DXGI_FORMAT_R8G8_TYPELESS: dcs.U32 = 48
    DXGI_FORMAT_R8G8_UNORM: dcs.U32 = 49
    DXGI_FORMAT_R8G8_UINT: dcs.U32 = 50
    DXGI_FORMAT_R8G8_SNORM: dcs.U32 = 51
    DXGI_FORMAT_R8G8_SINT: dcs.U32 = 52
    DXGI_FORMAT_R16_TYPELESS: dcs.U32 = 53
    DXGI_FORMAT_R16_FLOAT: dcs.U32 = 54
    DXGI_FORMAT_D16_UNORM: dcs.U32 = 55
    DXGI_FORMAT_R16_UNORM: dcs.U32 = 56
    DXGI_FORMAT_R16_UINT: dcs.U32 = 57
    DXGI_FORMAT_R16_SNORM: dcs.U32 = 58
    DXGI_FORMAT_R16_SINT: dcs.U32 = 59
    DXGI_FORMAT_R8_TYPELESS: dcs.U32 = 60
    DXGI_FORMAT_R8_UNORM: dcs.U32 = 61
    DXGI_FORMAT_R8_UINT: dcs.U32 = 62
    DXGI_FORMAT_R8_SNORM: dcs.U32 = 63
    DXGI_FORMAT_R8_SINT: dcs.U32 = 64
    DXGI_FORMAT_A8_UNORM: dcs.U32 = 65
    DXGI_FORMAT_R1_UNORM: dcs.U32 = 66
    DXGI_FORMAT_R9G9B9E5_SHAREDEXP: dcs.U32 = 67
    DXGI_FORMAT_R8G8_B8G8_UNORM: dcs.U32 = 68
    DXGI_FORMAT_G8R8_G8B8_UNORM: dcs.U32 = 69
    DXGI_FORMAT_BC1_TYPELESS: dcs.U32 = 70
    DXGI_FORMAT_BC1_UNORM: dcs.U32 = 71
    DXGI_FORMAT_BC1_UNORM_SRGB: dcs.U32 = 72
    DXGI_FORMAT_BC2_TYPELESS: dcs.U32 = 73
    DXGI_FORMAT_BC2_UNORM: dcs.U32 = 74
    DXGI_FORMAT_BC2_UNORM_SRGB: dcs.U32 = 75
    DXGI_FORMAT_BC3_TYPELESS: dcs.U32 = 76
    DXGI_FORMAT_BC3_UNORM: dcs.U32 = 77
    DXGI_FORMAT_BC3_UNORM_SRGB: dcs.U32 = 78
    DXGI_FORMAT_BC4_TYPELESS: dcs.U32 = 79
    DXGI_FORMAT_BC4_UNORM: dcs.U32 = 80
    DXGI_FORMAT_BC4_SNORM: dcs.U32 = 81
    DXGI_FORMAT_BC5_TYPELESS: dcs.U32 = 82
    DXGI_FORMAT_BC5_UNORM: dcs.U32 = 83
    DXGI_FORMAT_BC5_SNORM: dcs.U32 = 84
    DXGI_FORMAT_B5G6R5_UNORM: dcs.U32 = 85
    DXGI_FORMAT_B5G5R5A1_UNORM: dcs.U32 = 86
    DXGI_FORMAT_B8G8R8A8_UNORM: dcs.U32 = 87
    DXGI_FORMAT_B8G8R8X8_UNORM: dcs.U32 = 88
    DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM: dcs.U32 = 89
    DXGI_FORMAT_B8G8R8A8_TYPELESS: dcs.U32 = 90
    DXGI_FORMAT_B8G8R8A8_UNORM_SRGB: dcs.U32 = 91
    DXGI_FORMAT_B8G8R8X8_TYPELESS: dcs.U32 = 92
    DXGI_FORMAT_B8G8R8X8_UNORM_SRGB: dcs.U32 = 93
    DXGI_FORMAT_BC6H_TYPELESS: dcs.U32 = 94
    DXGI_FORMAT_BC6H_UF16: dcs.U32 = 95
    DXGI_FORMAT_BC6H_SF16: dcs.U32 = 96
    DXGI_FORMAT_BC7_TYPELESS: dcs.U32 = 97
    DXGI_FORMAT_BC7_UNORM: dcs.U32 = 98
    DXGI_FORMAT_BC7_UNORM_SRGB: dcs.U32 = 99
    DXGI_FORMAT_AYUV: dcs.U32 = 100
    DXGI_FORMAT_Y410: dcs.U32 = 101
    DXGI_FORMAT_Y416: dcs.U32 = 102
    DXGI_FORMAT_NV12: dcs.U32 = 103
    DXGI_FORMAT_P010: dcs.U32 = 104
    DXGI_FORMAT_P016: dcs.U32 = 105
    DXGI_FORMAT_420_OPAQUE: dcs.U32 = 106
    DXGI_FORMAT_YUY2: dcs.U32 = 107
    DXGI_FORMAT_Y210: dcs.U32 = 108
    DXGI_FORMAT_Y216: dcs.U32 = 109
    DXGI_FORMAT_NV11: dcs.U32 = 110
    DXGI_FORMAT_AI44: dcs.U32 = 111
    DXGI_FORMAT_IA44: dcs.U32 = 112
    DXGI_FORMAT_P8: dcs.U32 = 113
    DXGI_FORMAT_A8P8: dcs.U32 = 114
    DXGI_FORMAT_B4G4R4A4_UNORM: dcs.U32 = 115
    DXGI_FORMAT_P208: dcs.U32 = 130
    DXGI_FORMAT_V208: dcs.U32 = 131
    DXGI_FORMAT_V408: dcs.U32 = 132
    DXGI_FORMAT_SAMPLER_FEEDBACK_MIN_MIP_OPAQUE: dcs.U32
    DXGI_FORMAT_SAMPLER_FEEDBACK_MIP_REGION_USED_OPAQUE: dcs.U32
    DXGI_FORMAT_FORCE_UINT: dcs.U32 = 0xFFFFFFFF


@str_int_enum
class DDSHeaderDXT10ResourceDimension(IntEnum):  # size: 4 bytes
    """
    Identifies the type of resource. The following values for this member are a subset of the values
    in the `D3D10_RESOURCE_DIMENSION`[1] or `D3D11_RESOURCE_DIMENSION`[2] enumeration.

    [1] https://learn.microsoft.com/en-us/windows/desktop/api/d3d10/ne-d3d10-d3d10_resource_dimension
    [2] https://learn.microsoft.com/en-us/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_dimension

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-header-dxt10)

    Size: 4 bytes
    """

    DDS_DIMENSION_TEXTURE1D: dcs.U32 = 2
    DDS_DIMENSION_TEXTURE2D: dcs.U32 = 3
    DDS_DIMENSION_TEXTURE3D: dcs.U32 = 4


@str_int_flags
class DDSHeaderDXT10MiscFlag(IntFlag):  # size: 4 bytes
    """
    Identifies other, less common options for resources. The following value for this member is a
    subset of the values in the `D3D10_RESOURCE_MISC_FLAG`[1] or `D3D11_RESOURCE_MISC_FLAG`[2]
    enumeration

    [1] https://learn.microsoft.com/en-us/windows/desktop/api/d3d10/ne-d3d10-d3d10_resource_misc_flag
    [2] https://learn.microsoft.com/en-us/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-header-dxt10)

    Size: 4 bytes
    """

    DDS_RESOURCE_MISC_TEXTURECUBE: dcs.U32 = 0x4


@str_int_enum
class DDSHeaderDXT10MiscFlags2(IntEnum):  # size: 4 bytes
    """
    Contains additional metadata (formerly was reserved). The lower 3 bits indicate the alpha mode
    of the associated resource. The upper 29 bits are reserved and are typically 0.

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-header-dxt10)

    Size: 4 bytes
    """

    DDS_ALPHA_MODE_UNKNOWN: dcs.U32 = 0x0
    DDS_ALPHA_MODE_STRAIGHT: dcs.U32 = 0x1
    DDS_ALPHA_MODE_PREMULTIPLIED: dcs.U32 = 0x2
    DDS_ALPHA_MODE_OPAQUE: dcs.U32 = 0x3
    DDS_ALPHA_MODE_CUSTOM: dcs.U32 = 0x4


@dcs.dataclass()
class DDSPixelFormat:  # size: 32 bytes
    """
    Surface pixel format.

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-pixelformat)

    Size: 32 bytes
    """

    dw_size: dcs.U32  # should be 32
    dw_flags: dcs.U32  # DDSPixelFormatFlags
    # should be one of b"DXT1", b"DXT2", b"DXT3", b"DXT4", b"DXT5", b"DX10"
    dw_four_cc: Annotated[bytes, 4]
    dw_rgb_bit_count: dcs.U32
    dw_r_bit_mask: dcs.U32
    dw_g_bit_mask: dcs.U32
    dw_b_bit_mask: dcs.U32
    dw_a_bit_mask: dcs.U32

    def __str__(self) -> str:
        return "\n".join(
            [
                f"Size: {self.dw_size} bytes",
                "Flags:",
                indent(str(DDSPixelFormatFlags(self.dw_flags))),
                f"Four CC: {self.dw_four_cc}",
                f"RGB Bit Count: {self.dw_rgb_bit_count}",
                f"R Bit Mask: {self.dw_r_bit_mask:#010x}",
                f"G Bit Mask: {self.dw_g_bit_mask:#010x}",
                f"B Bit Mask: {self.dw_b_bit_mask:#010x}",
                f"A Bit Mask: {self.dw_a_bit_mask:#010x}",
            ]
        )


@dcs.dataclass()
class DDSHeader:  # size: 124 bytes
    """
    Describes a DDS header.

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-header)

    Size: 124 bytes
    """

    dw_size: dcs.U32  # should be 124
    dw_flags: dcs.U32  # DDSHeaderFlags
    dw_height: dcs.U32
    dw_width: dcs.U32
    dw_pitch_or_linear_size: dcs.U32
    dw_depth: dcs.U32
    dw_mip_map_count: dcs.U32
    dw_reserved1: Annotated[bytes, 44]  # dcs.U32[11]
    dds_pixelformat: DDSPixelFormat
    dw_caps: dcs.U32  # DDSHeaderCaps
    dw_caps2: dcs.U32  # DDSHeaderCaps2
    dw_caps3: dcs.U32
    dw_caps4: dcs.U32
    dw_reserved2: dcs.U32

    def __str__(self) -> str:
        return "\n".join(
            [
                f"Size: {self.dw_size} bytes",
                "Flags:",
                indent(str(DDSHeaderFlags(self.dw_flags))),
                f"Height: {self.dw_height}",
                f"Width: {self.dw_width}",
                f"Pitch or Linear Size: {self.dw_pitch_or_linear_size}",
                f"Depth: {self.dw_depth}",
                f"Mip Map Count: {self.dw_mip_map_count}",
                f"Reserved1: Unused ({self.dw_reserved1.hex(':', 4)})",
                "Pixel Format:",
                indent(str(self.dds_pixelformat)),
                "Caps:",
                indent(str(DDSHeaderCaps(self.dw_caps))),
                "Caps2:",
                indent(str(DDSHeaderCaps2(self.dw_caps2))),
                f"Caps3: Unused ({self.dw_caps3:#x})",
                f"Caps4: Unused ({self.dw_caps4:#x})",
                f"Reserved2: Unused ({self.dw_reserved2:#x})",
            ]
        )


@dcs.dataclass()
class DDSHeaderDXT10:  # size: 20 bytes
    """
    DDS header extension to handle resource arrays, DXGI pixel formats that don't map to the legacy
    Microsoft DirectDraw pixel format structures, and additional metadata.

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-header-dxt10)

    Size: 20 bytes
    """

    dxgi_format: dcs.U32  # DXGIFormat
    resource_dimension: dcs.U32  # DDSHeaderDXT10ResourceDimension
    misc_flag: dcs.U32  # DDSHeaderDXT10MiscFlag
    array_size: dcs.U32
    misc_flags2: dcs.U32  # DDSHeaderDXT10MiscFlags2

    def __str__(self) -> str:
        # handle invalid values for the enums so that the program doesn't crash in the event of,
        # say, a corrupt file
        try:
            dxgi_format_str = str(DXGIFormat(self.dxgi_format))
        except ValueError:
            dxgi_format_str = f"Invalid ({self.dxgi_format})"
        try:
            resource_dimension_str = str(DDSHeaderDXT10ResourceDimension(self.resource_dimension))
        except ValueError:
            resource_dimension_str = f"Invalid ({self.resource_dimension})"
        try:
            misc_flags2_str = str(DDSHeaderDXT10MiscFlags2(self.misc_flags2))
        except ValueError:
            misc_flags2_str = f"Invalid ({self.misc_flags2})"

        return "\n".join(
            [
                f"DXGI Format: {dxgi_format_str}",
                f"Resource Dimension: {resource_dimension_str}",
                "Misc Flag:",
                indent(str(DDSHeaderDXT10MiscFlag(self.misc_flag))),
                f"Array Size: {self.array_size}",
                "Misc Flags2:",
                indent(misc_flags2_str),
            ]
        )


@dcs.dataclass()
class DDSFileHeader:  # size: 128 bytes or 148 bytes
    """
    Layout of the full header of a DDS file.

    [(reference)](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dx-graphics-dds-pguide)

    Size: 128 bytes or 148 bytes
    """

    dw_magic: Annotated[bytes, 4]  # should be b"DDS "
    dds_header: DDSHeader
    dds_header_dxt10: DDSHeaderDXT10

    def __str__(self) -> str:
        to_return: str = [
            f"Magic: {self.dw_magic}",
            "Header:",
            indent(str(self.dds_header)),
        ]
        if self.dds_header_dxt10 is not None:
            to_return.append("Header DXT10:")
            to_return.append(indent(str(self.dds_header_dxt10)))
        return "\n".join(to_return)

    @classmethod
    def from_stream(cls, input_stream: BufferedIOBase):
        input_stream.seek(0)
        dw_magic = input_stream.read(4)
        dds_header = DDSHeader.from_packed(input_stream.read(DDSHeader.__dataclass_struct__.size))
        # check if the header has the DXT10 extension before attempting to read that portion
        if (
            dds_header.dds_pixelformat.dw_flags & DDSPixelFormatFlags.DDPF_FOURCC
            and dds_header.dds_pixelformat.dw_four_cc == b"DX10"
        ):
            dds_header_dxt10 = DDSHeaderDXT10.from_packed(
                input_stream.read(DDSHeaderDXT10.__dataclass_struct__.size)
            )
        else:
            dds_header_dxt10 = None
        return cls(dw_magic, dds_header, dds_header_dxt10)


def main(dds_file: str) -> None:
    try:
        with open(dds_file, "rb") as f:
            dds_file_header = DDSFileHeader.from_stream(f)
    except FileNotFoundError:
        print(f"Error: File '{dds_file}' not found.")
    print(f"DDS File Header ({dds_file}):")
    print(indent(f"{dds_file_header}"))


if __name__ == "__main__":
    parser = ArgumentParser(description="Display the header of a DDS file.")
    parser.add_argument("filename", help="DDS file.")
    args = parser.parse_args()

    main(args.filename)
