    .section .data

	.global gUnknown_088AFBD8
gUnknown_088AFBD8:  @ 0x088AFBD8
	.incbin "baserom.gba", 0x8AFBD8, 0xA20

	.global gAffinityBonuses
gAffinityBonuses:  @ 0x088B05F8
	.incbin "baserom.gba", 0x8B05F8, 0x298

	.global gChapterDataTable
gChapterDataTable:  @ 0x088B0890
	.incbin "baserom.gba", 0x8B0890, 0x60

	.global gUnknown_088B08F0
gUnknown_088B08F0:  @ 0x088B08F0
	.incbin "baserom.gba", 0x8B08F0, 0x2D4C

	.global gChapterDataAssetTable
gChapterDataAssetTable:  @ 0x088B363C
@ replacing .incbin "baserom.gba", 0x008b363c, 0x3b0
.4byte 0
.4byte gUnknown_081609BC + 0x383d0
.4byte gUnknown_081609BC + 0x4e234
.4byte gUnknown_081609BC + 0x4ace0
.4byte gUnknown_081609BC + 0x56d38
.4byte gUnknown_0859D478 + 0x20
.4byte gUnknown_08A1E0D8 + 0x20
.4byte gUnknown_089E857C + 0xc0
.4byte gUnknown_081609BC + 0x56c14
.4byte gUnknown_08A1E0D8 + 0x2c
.4byte gUnknown_089E857C + 0x220
.4byte gUnknown_081609BC + 0x56a80
.4byte gUnknown_08A1E0D8 + 0x88
.4byte gUnknown_089E857C + 0x3b8
.4byte gUnknown_081609BC + 0x31158
.4byte gUnknown_081609BC + 0x4e0f4
.4byte gUnknown_081609BC + 0x49784
.4byte gUnknown_081609BC + 0x56918
.4byte gUnknown_0859D478 + 0xf0
.4byte gUnknown_08A1E0D8 + 0x11c
.4byte gUnknown_089E857C + 0x4bc
.4byte gUnknown_081609BC + 0x567a0
.4byte gUnknown_08A1E0D8 + 0x1d4
.4byte gUnknown_089E857C + 0x5a4
.4byte gUnknown_081609BC + 0x2aee0
.4byte gUnknown_081609BC + 0x4dfb4
.4byte gUnknown_081609BC + 0x48310
.4byte gUnknown_081609BC + 0x565bc
.4byte gUnknown_0859D478 + 0x280
.4byte gUnknown_08A1E0D8 + 0x2d4
.4byte gUnknown_089E857C + 0x790
.4byte gUnknown_081609BC + 0x56400
.4byte gUnknown_08A1E0D8 + 0x260
.4byte gUnknown_089E857C + 0x6d8
.4byte gUnknown_081609BC + 0x56050
.4byte gUnknown_08A1E0D8 + 0x318
.4byte gUnknown_089E857C + 0x848
.4byte gUnknown_081609BC + 0x55d5c
.4byte gUnknown_08A1E0D8 + 0x33c
.4byte gUnknown_089E857C + 0x8f4
.4byte gUnknown_081609BC + 0x55ac4
.4byte gUnknown_08A1E0D8 + 0x378
.4byte gUnknown_089E857C + 0xa68
.4byte gUnknown_081609BC + 0x55800
.4byte gUnknown_08A1E0D8 + 0x3f4
.4byte gUnknown_089E857C + 0xbc4
.4byte gUnknown_081609BC + 0x24798
.4byte gUnknown_081609BC + 0x4de74
.4byte gUnknown_081609BC + 0x46cb8
.4byte gUnknown_081609BC + 0x55470
.4byte gUnknown_08A1E0D8 + 0x43c
.4byte gUnknown_089E857C + 0xd34
.4byte gUnknown_081609BC + 0x4dd34
.4byte gUnknown_081609BC + 0x550e0
.4byte gUnknown_08A1E0D8 + 0x4e0
.4byte gUnknown_089E857C + 0xf6c
.4byte gUnknown_081609BC + 0x4dbf4
.4byte gUnknown_081609BC + 0x54e90
.4byte gUnknown_08A1E0D8 + 0x51c
.4byte gUnknown_089E857C + 0x106c
.4byte gUnknown_081609BC + 0x20cfc
.4byte gUnknown_081609BC + 0x4dab4
.4byte gUnknown_081609BC + 0x45c48
.4byte gUnknown_081609BC + 0x54bd0
.4byte gUnknown_08A1E0D8 + 0x6c0
.4byte gUnknown_089E857C + 0x1234
.4byte gUnknown_081609BC + 0x1a038
.4byte gUnknown_081609BC + 0x4d974
.4byte gUnknown_081609BC + 0x44bf8
.4byte gUnknown_081609BC + 0x54910
.4byte gUnknown_08A1E0D8 + 0x788
.4byte gUnknown_089E857C + 0x1484
.4byte gUnknown_081609BC + 0x4d834
.4byte gUnknown_081609BC + 0x54628
.4byte gUnknown_08A1E0D8 + 0x7d8
.4byte gUnknown_089E857C + 0x159c
.4byte gUnknown_081609BC + 0x4d6f4
.4byte gUnknown_081609BC + 0x54310
.4byte gUnknown_08A1E0D8 + 0x860
.4byte gUnknown_089E857C + 0x1738
.4byte gUnknown_081609BC + 0x14cf8
.4byte gUnknown_081609BC + 0x4d5b4
.4byte gUnknown_081609BC + 0x43b54
.4byte gUnknown_081609BC + 0x53f58
.4byte gUnknown_0859D478 + 0x388
.4byte gUnknown_08A1E0D8 + 0x89c
.4byte gUnknown_089E857C + 0x182c
.4byte gUnknown_081609BC + 0x4d474
.4byte gUnknown_081609BC + 0x53c90
.4byte gUnknown_08A1E0D8 + 0x8b8
.4byte gUnknown_089E857C + 0x198c
.4byte gUnknown_081609BC + 0x4d334
.4byte gUnknown_081609BC + 0x53898
.4byte gUnknown_08A1E0D8 + 0x918
.4byte gUnknown_089E857C + 0x1ab0
.4byte gUnknown_081609BC + 0x103ec
.4byte gUnknown_081609BC + 0x4d1f4
.4byte gUnknown_081609BC + 0x42ca4
.4byte gUnknown_081609BC + 0x534c0
.4byte gUnknown_08A1E0D8 + 0x930
.4byte gUnknown_089E857C + 0x1bbc
.4byte gUnknown_081609BC + 0x5314c
.4byte gUnknown_08A1E0D8 + 0x96c
.4byte gUnknown_089E857C + 0x1c44
.4byte gUnknown_081609BC + 0x4d0b4
.4byte gUnknown_081609BC + 0x52eb4
.4byte gUnknown_08A1E0D8 + 0x994
.4byte gUnknown_089E857C + 0x1dcc
.4byte gUnknown_081609BC + 0x9398
.4byte gUnknown_081609BC + 0x4cf74
.4byte gUnknown_081609BC + 0x41604
.4byte gUnknown_081609BC + 0x52bf8
.4byte gUnknown_08A1E0D8 + 0xa18
.4byte gUnknown_089E857C + 0x1f2c
.4byte gUnknown_081609BC + 0x4ce34
.4byte gUnknown_081609BC + 0x5289c
.4byte gUnknown_08A1E0D8 + 0xd9c
.4byte gUnknown_089E857C + 0x2150
.4byte gUnknown_081609BC + 0x525fc
.4byte gUnknown_08A1E0D8 + 0xdf0
.4byte gUnknown_089E857C + 0x22d4
.4byte gUnknown_081609BC + 0x55c0
.4byte gUnknown_081609BC + 0x4ccf4
.4byte gUnknown_081609BC + 0x40a84
.4byte gUnknown_081609BC + 0x52208
.4byte gUnknown_0859D478 + 0x200
.4byte gUnknown_08A1E0D8 + 0xe80
.4byte gUnknown_089E857C + 0x2550
.4byte gUnknown_089E857C + 0x2774
.4byte gUnknown_089E857C + 0x28b0
.4byte gUnknown_089E857C + 0x2a4c
.4byte gUnknown_089E857C + 0x2b40
.4byte gUnknown_089E857C + 0x2ca0
.4byte gUnknown_089E857C + 0x2dc4
.4byte gUnknown_089E857C + 0x2ed0
.4byte gUnknown_089E857C + 0x2f58
.4byte gUnknown_081609BC
.4byte gUnknown_081609BC + 0x4cbb4
.4byte gUnknown_081609BC + 0x3fb58
.4byte gUnknown_081609BC + 0x520a4
.4byte gUnknown_08A1E0D8 + 0x101c
.4byte gUnknown_089E857C + 0x2ff8
.4byte gUnknown_081609BC + 0x51f30
.4byte gUnknown_08A1E0D8 + 0x1028
.4byte gUnknown_089E857C + 0x3098
.4byte gUnknown_081609BC + 0x51d30
.4byte gUnknown_08A1E0D8 + 0x1038
.4byte gUnknown_089E857C + 0x312c
.4byte gUnknown_081609BC + 0x51b1c
.4byte gUnknown_08A1E0D8 + 0x1050
.4byte gUnknown_089E857C + 0x31b4
.4byte gUnknown_081609BC + 0x51944
.4byte gUnknown_08A1E0D8 + 0x1060
.4byte gUnknown_089E857C + 0x3260
.4byte gUnknown_081609BC + 0x517b0
.4byte gUnknown_08A1E0D8 + 0x1134
.4byte gUnknown_089E857C + 0x3318
.4byte gUnknown_081609BC + 0x51584
.4byte gUnknown_08A1E0D8 + 0x126c
.4byte gUnknown_089E857C + 0x3400
.4byte gUnknown_081609BC + 0x51314
.4byte gUnknown_08A1E0D8 + 0x12b8
.4byte gUnknown_089E857C + 0x3494
.4byte gUnknown_081609BC + 0x4ca74
.4byte gUnknown_081609BC + 0x510d0
.4byte gUnknown_08A1E0D8 + 0x12ec
.4byte gUnknown_089E857C + 0x3564
.4byte gUnknown_081609BC + 0x50e64
.4byte gUnknown_08A1E0D8 + 0x1310
.4byte gUnknown_089E857C + 0x3604
.4byte gUnknown_081609BC + 0x50c04
.4byte gUnknown_08A1E0D8 + 0x1364
.4byte gUnknown_089E857C + 0x3728
.4byte gUnknown_081609BC + 0x50a04
.4byte gUnknown_08A1E0D8 + 0x14e8
.4byte gUnknown_089E857C + 0x37e0
.4byte gUnknown_081609BC + 0x507dc
.4byte gUnknown_08A1E0D8 + 0x15ec
.4byte gUnknown_089E857C + 0x38b0
.4byte gUnknown_081609BC + 0x505d0
.4byte gUnknown_08A1E0D8 + 0x1644
.4byte gUnknown_089E857C + 0x3998
.4byte gUnknown_081609BC + 0x50384
.4byte gUnknown_08A1E0D8 + 0x168c
.4byte gUnknown_089E857C + 0x3abc
.4byte gUnknown_081609BC + 0x4c934
.4byte gUnknown_081609BC + 0x501d4
.4byte gUnknown_08A1E0D8 + 0x1758
.4byte gUnknown_089E857C + 0x3c64
.4byte gUnknown_081609BC + 0x4ff84
.4byte gUnknown_08A1E0D8 + 0x1818
.4byte gUnknown_089E857C + 0x3d1c
.4byte gUnknown_081609BC + 0x4fd5c
.4byte gUnknown_08A1E0D8 + 0x1840
.4byte gUnknown_089E857C + 0x3db0
.4byte gUnknown_081609BC + 0x4fd50
.4byte gUnknown_08A1E0D8 + 0x1858
.4byte gUnknown_089E857C + 0x3e38
.4byte gUnknown_081609BC + 0x4fa10
.4byte gUnknown_08A1E0D8 + 0x1864
.4byte gUnknown_089E857C + 0x3ec0
.4byte gUnknown_081609BC + 0x4f908
.4byte gUnknown_081609BC + 0x4f8b4
.4byte gUnknown_089E857C + 0x402c
.4byte gUnknown_081609BC + 0x4f880
.4byte gUnknown_089E857C + 0x40f0
.4byte gUnknown_081609BC + 0x4c7f4
.4byte gUnknown_081609BC + 0x4f650
.4byte gUnknown_08A1E0D8 + 0x490
.4byte gUnknown_089E857C + 0xe84
.4byte gUnknown_081609BC + 0x4f53c
.4byte gUnknown_0859D478 + 0xa8
.4byte gUnknown_08A1E0D8 + 0xd50
.4byte gUnknown_089E857C + 0x2040
.4byte gUnknown_081609BC + 0x4f3f4
.4byte gUnknown_081609BC + 0x4f2b8
.4byte gUnknown_081609BC + 0x4f18c
.4byte gUnknown_081609BC + 0x4f070
.4byte gUnknown_08A1E0D8 + 0x1998
.4byte gUnknown_081609BC + 0x4efc4
.4byte gUnknown_081609BC + 0x4eef0
.4byte gUnknown_081609BC + 0x4edf4
.4byte gUnknown_081609BC + 0x4ec48
.4byte gUnknown_08A1E0D8 + 0x19b8
.4byte gUnknown_081609BC + 0x4eb60
.4byte gUnknown_08A1E0D8 + 0x19d8
.4byte gUnknown_081609BC + 0x4ea78
.4byte gUnknown_08A1E0D8 + 0x1a04
.4byte gUnknown_081609BC + 0x4e964
.4byte gUnknown_081609BC + 0x4e864
.4byte gUnknown_081609BC + 0x4c6b4
.4byte gUnknown_081609BC + 0x4e764
.4byte gUnknown_081609BC + 0x4e630
.4byte gUnknown_081609BC + 0x4e530
.4byte gUnknown_081609BC + 0x4c574
.4byte gUnknown_081609BC + 0x4e374

	.global gUnknown_088B39EC
gUnknown_088B39EC:  @ 0x088B39EC
@ replacing .incbin "baserom.gba", 0x008b39ec, 0xec
.4byte 0
.4byte gUnknown_08A3974C + 0x1c
.4byte gUnknown_08A3974C + 0x5c0
.4byte gUnknown_08A3974C + 0x5f8
.4byte gUnknown_08A3974C + 0x7d4
.4byte gUnknown_08A3974C + 0x970
.4byte gUnknown_08A3974C + 0x3144
.4byte gUnknown_08A3974C + 0xaa0
.4byte gUnknown_08A3974C + 0xd8c
.4byte gUnknown_08A3974C + 0xe78
.4byte gUnknown_08A3974C + 0xf64
.4byte gUnknown_08A3974C + 0xfe4
.4byte gUnknown_08A3974C + 0x1244
.4byte gUnknown_08A3974C + 0x1404
.4byte gUnknown_08A3974C + 0x1420
.4byte gUnknown_08A3974C + 0x1564
.4byte gUnknown_08A3974C + 0x1ddc
.4byte gUnknown_08A3974C + 0x1e48
.4byte gUnknown_08A3974C + 0x1fec
.4byte gUnknown_08A3974C + 0x219c
.4byte gUnknown_08A3974C + 0x2318
.4byte gUnknown_08A3974C + 0x2428
.4byte gUnknown_08A3974C + 0x260c
.4byte gUnknown_08A3974C + 0x314c
.4byte gUnknown_08A3974C + 0x170c
.4byte gUnknown_08A3974C + 0x1940
.4byte gUnknown_08A3974C + 0x1a8c
.4byte gUnknown_08A3974C + 0x1aa8
.4byte gUnknown_08A3974C + 0x1b90
.4byte gUnknown_08A3974C + 0x2628
.4byte gUnknown_08A3974C + 0x27dc
.4byte gUnknown_08A3974C + 0x2968
.4byte gUnknown_08A3974C + 0x2b14
.4byte gUnknown_08A3974C + 0x2c90
.4byte gUnknown_08A3974C + 0x2da0
.4byte gUnknown_08A3974C + 0x2f84
.4byte gUnknown_08A3974C + 0x3154
.4byte gUnknown_08A3974C + 0x1d18
.4byte gUnknown_08A3974C + 0x1d2c
.4byte gUnknown_08A3974C + 0x1d34
.4byte gUnknown_08A3974C + 0x1d3c
.4byte gUnknown_08A3974C + 0x1d44
.4byte gUnknown_08A3974C + 0x1d4c
.4byte gUnknown_08A3974C + 0x1d54
.4byte gUnknown_08A3974C + 0x1d5c
.4byte gUnknown_08A3974C + 0x1d74
.4byte gUnknown_08A3974C + 0x1d84
.4byte gUnknown_08A3974C + 0x1d8c
.4byte gUnknown_08A3974C + 0x1d94
.4byte gUnknown_08A3974C + 0x1d9c
.4byte gUnknown_08A3974C + 0x1da4
.4byte gUnknown_08A3974C + 0x1dac
.4byte gUnknown_08A3974C + 0x1db4
.4byte gUnknown_08A3974C + 0x1dbc
.4byte gUnknown_08A3974C + 0x1dc4
.4byte gUnknown_08A3974C + 0x3114
.4byte gUnknown_08A3974C + 0x1d10
.4byte gUnknown_08A3974C + 0x315c
.4byte gUnknown_08A3974C + 0x3284

	.global gUnknown_088B3AD8
gUnknown_088B3AD8:  @ 0x088B3AD8
	.incbin "baserom.gba", 0x8B3AD8, 0x1E47C

	.global gUnknown_088D1F54
gUnknown_088D1F54:  @ 0x088D1F54
	.incbin "baserom.gba", 0x8D1F54, 0x104

