/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-KBRD.aml, Wed May  7 14:33:37 2025
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000F1 (241)
 *     Revision         0x02
 *     Checksum         0x11
 *     OEM ID           "T460s"
 *     OEM Table ID     "KBRD"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "T460s", "KBRD", 0x00000000)
{
    External (_SB_.PCI0.LPC_.KBD_, DeviceObj)

    Scope (_SB.PCI0.LPC.KBD)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x04)
                {
                    "RM,oem-id", 
                    "LENOVO", 
                    "RM,oem-table-id", 
                    "T460"
                })
            }

            Name (RMCF, Package (0x02)
            {
                "Keyboard", 
                Package (0x04)
                {
                    "Swap command and option", 
                    ">n", 
                    "Custom PS2 Map", 
                    Package (0x02)
                    {
                        Package (0x00){}, 
                        "e037=64"
                    }
                }
            })
        }
    }
}

