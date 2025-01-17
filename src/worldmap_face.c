#include "global.h"

#include "face.h"
#include "hardware.h"

struct WMFaceWrapper {
    /* 00 */ s16 unk_00; // x?
    /* 02 */ s16 unk_02; // y?
    /* 04 */ struct FaceProc* faceProc;
    /* 08 */ u16 faceId;
    /* 0A */ s8 unk_0a; // possibly "fade direction" (+1 for fade in, -1 for fade out?)
};

struct WMFaceHolderProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct WMFaceWrapper faceWrapper[2];
};

struct WMFaceCtrlProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 unk_2a; // some index into an array, functionality appears to be unused
    /* 2C */ struct WMFaceHolderProc* faceHolderProc;
    /* 30 */ s8 increment;
    /* 31 */ u8 blendAmt;
    /* 32 */ u8 unk_32; // unreferenced
    /* 33 */ u8 unk_33; // initialized to 0 and unused
    /* 34 */ u8 unk_34; // initialized to 0 and unused
};

//! FE8U = 0x080B820C
void WorldMapFaceHolder_Init(struct WMFaceHolderProc* proc) {
    int i;

    for (i = 0; i < 2; i++) {
        proc->faceWrapper[i].faceProc = NULL;
        proc->faceWrapper[i].unk_0a = 0;
        proc->faceWrapper[i].unk_02 = 0;
        proc->faceWrapper[i].unk_00 = 0;
        proc->faceWrapper[i].faceId |= 0xFFFF;
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_WorldMapFaceHolder[] = {
    PROC_MARK(8),
    PROC_CALL(WorldMapFaceHolder_Init),
    PROC_BLOCK,

    PROC_END,
};

//! FE8U = 0x080B823C
void WMFaceCtrl_Init(struct WMFaceCtrlProc* proc) {
    proc->unk_2a = 0;
    proc->faceHolderProc = Proc_Start(gProcScr_WorldMapFaceHolder, proc);
    proc->increment = 0;
    proc->blendAmt = 0;
    proc->unk_33 = 0;
    proc->unk_34 = 0;

    return;
}

//! FE8U = 0x080B826C
int sub_80B826C(int xIn, int *xOut) {
    int a = xIn - 0x30;
    int b;

    if (a < 0)
        b = xIn - 0x29;
    else
        b = a;

    xIn = b;
    xIn = xIn >> 3;
    *xOut = xIn * 8 - a;

    return xIn;
}

//! FE8U = 0x080B828C
int GetWMFaceBg(void) {
    return (gGMData.state.bits.state_3) ? BG_2 : BG_1;
}

//! FE8U = 0x080B82A8
int GetWMFaceVramOffset(void) {
    return (gGMData.state.bits.state_3) ? 0x5000 : 0x1800;
}

//! FE8U = 0x080B82C8
void sub_80B82C8(int bg, u32 offset, int xIn, int yIn, u8 isFlippedMaybe) {
    int bgX;
    u16* r0;
    int x;
    int y;
    int y_;

    x = sub_80B826C(xIn, &bgX);
    y = yIn / 8;
    y_ = (y * 8) - yIn;

    r0 = BG_GetMapBuffer(bg) + y * 0x20 + x;

    sub_8006738(
        r0,
        (offset >> 5) + 0x4000,
        isFlippedMaybe
    );

    BG_EnableSyncByMask(1 << (bg));

    BG_SetPosition(bg, bgX, y_);

    return;
}

//! FE8U = 0x080B8350
void HandleWMFaceFade(struct WMFaceCtrlProc* proc) {
    int i;

    SetSpecialColorEffectsParameters(1, proc->blendAmt >> 1, 0x10 - (proc->blendAmt >> 1), 0);

    proc->blendAmt += proc->increment;

    if (proc->blendAmt == 0) {
        for (i = 0; i < 2; i++) {
            if ((proc->faceHolderProc->faceWrapper[i].faceProc != NULL) && ((proc->faceHolderProc->faceWrapper[i].unk_0a == -1))) {
                EndFaceById(i);

                proc->faceHolderProc->faceWrapper[i].unk_0a = 0;
                proc->faceHolderProc->faceWrapper[i].faceProc = NULL;
            }
        }

        proc->increment = 0;
    }

    if (proc->blendAmt == 0x20) {
        for (i = 0; i < 2; i++) {
            struct FaceProc* faceProc = proc->faceHolderProc->faceWrapper[i].faceProc;

            if (faceProc != NULL && (proc->faceHolderProc->faceWrapper[i].unk_0a == 1)) {
                SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) & ~(FACE_DISP_BLEND));
                proc->faceHolderProc->faceWrapper[i].unk_0a = 0;
            }
        }

        proc->increment = 0;
    }

    return;
}

//! FE8U = 0x080B843C
void sub_80B843C(struct WMFaceCtrlProc* proc) {
    int i;
    int iVar10;
    struct WMFaceHolderProc* internalProc = proc->faceHolderProc;
    int bgMaybe = GetWMFaceBg();

    for (i = 0; i < 2; i++) {
        iVar10 = 0;

        if (internalProc->faceWrapper[i].faceProc != NULL) {
            struct FaceProc* faceProc = internalProc->faceWrapper[i].faceProc;
            int x = internalProc->faceWrapper[i].unk_00;
            u16* yptrUnsigned = &internalProc->faceWrapper[i].unk_02;

            if (((*yptrUnsigned & 0x800) != 0) && ((*yptrUnsigned & 0xff) < 0x10)) {
                if ((*yptrUnsigned & 0x100) != 0) {
                    faceProc->xPos = x + (((0x10 - (*yptrUnsigned & 0xff)) * 0x20 * (0x10 - (*yptrUnsigned & 0xff))) / 256);
                    iVar10 = 1;
                }

                if ((*yptrUnsigned & 0x200) != 0) {
                    faceProc->xPos = x - (((0x10 - (*yptrUnsigned & 0xff)) * 0x20 * (0x10 - (*yptrUnsigned & 0xff))) / 256);
                    iVar10 = 1;
                }

                (*yptrUnsigned)++;

                if ((*yptrUnsigned & 0xff) > 0xf) {
                    iVar10 = 2;

                    SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) &~ 0x4000);
                    *yptrUnsigned &= ~0x800;
                }
            }

            if (((*yptrUnsigned & 0x1000) != 0) && ((*yptrUnsigned & 0xff) < 0x10)) {
                if ((*yptrUnsigned & 0xff) == 0) {
                    SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) | 0x4000);
                }

                if ((*yptrUnsigned & 0x100) != 0) {
                    faceProc->xPos = ({ x - 0x20; }) + (((0x10 - (*yptrUnsigned & 0xff)) * 0x20 * (0x10 - (*yptrUnsigned & 0xff))) / 256);
                    iVar10 = 1;
                }

                if ((*yptrUnsigned & 0x200) != 0) {
                    faceProc->xPos = ({ x + 0x20; }) - (((0x10 - (*yptrUnsigned & 0xff)) * 0x20 * (0x10 - (*yptrUnsigned & 0xff))) / 256);
                    iVar10 = 1;
                }

                (*yptrUnsigned)++;

                if ((*yptrUnsigned & 0xff) > 0xf) {
                    iVar10 = 2;
                }
            }

            switch (iVar10) {
                case 1:
                    BG_Fill(BG_GetMapBuffer(bgMaybe), 0);
                    sub_80B82C8(
                        GetWMFaceBg(),
                        GetWMFaceVramOffset(),
                        faceProc->xPos,
                        0x1c,
                        (*yptrUnsigned >> 10) & 1
                    );
                    BG_EnableSyncByMask(1 << (bgMaybe));

                    break;

                case 2:
                    BG_Fill(BG_GetMapBuffer(bgMaybe), 0);
                    BG_EnableSyncByMask(1 << (bgMaybe));

                    break;
            }
        }
    }

    return;
}

//! FE8U = 0x080B8630
void WMFaceCtrl_Loop(struct WMFaceCtrlProc* proc) {
    u8 gUnknown_08205F28[] = {
        0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1, 1, 1, 1, 1, 1, 2, 2,
        2, 2, 2, 2, 3, 3, 3, 3, 3,
        3, 3, 3, 3, 3, 2, 2, 2, 2,
        2, 2, 1, 1, 1, 1, 1, 1, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0,

        -1,
    };

    proc->unk_2a++;

    if (gUnknown_08205F28[proc->unk_2a] == 0xFF) {
        proc->unk_2a = 0;
    }

    sub_80B843C(proc);

    if (proc->increment != 0) {
        HandleWMFaceFade(proc);
    }

    return;
}

//! FE8U = 0x080B867C
void nullsub_57(void) {
    return;
}

struct ProcCmd CONST_DATA gProcScr_WorldMapFaceCtrl[] = {
    PROC_MARK(8),
    PROC_SET_END_CB(nullsub_57),

    PROC_CALL(WMFaceCtrl_Init),
    PROC_REPEAT(WMFaceCtrl_Loop),

    PROC_END,
};

//! FE8U = 0x080B8680
ProcPtr StartWMFaceCtrl(ProcPtr parent) {
    return Proc_Start(gProcScr_WorldMapFaceCtrl, parent);
}

//! FE8U = 0x080B8694
void EndWMFaceCtrl(void) {
    Proc_EndEach(gProcScr_WorldMapFaceCtrl);
    return;
}

//! FE8U = 0x080B86A4
int GetWMFaceBlendAmt(void) {
    struct WMFaceCtrlProc* proc;

    Proc_Find(gProcScr_WorldMapFaceCtrl);

    proc = Proc_Find(gProcScr_WorldMapFaceCtrl);

    if (proc) {
        return proc->blendAmt >> 1;
    } else {
        return 0x10;
    }
}

//! FE8U = 0x080B86CC
void sub_80B86CC(int faceSlot, int faceId, u16 config) {
    int bg;
    u32 offset;

    struct WMFaceCtrlProc* proc = Proc_Find(gProcScr_WorldMapFaceCtrl);

    struct WMFaceWrapper* pWrapper = proc->faceHolderProc->faceWrapper + faceSlot;

    if (gGMData.state.bits.state_3) {
        SetBlendTargetA(0, 0, 1, 0, 0);
        SetBlendTargetB(0, 1, 0, 1, 1);
    } else {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
    }

    bg = GetWMFaceBg();
    offset = GetWMFaceVramOffset();

    if (pWrapper->faceProc == NULL) {
        int x;
        int disp;
        struct FaceProc* faceProc;

        pWrapper->faceId = faceId;

        pWrapper->unk_00 = config & 0x00ff;
        pWrapper->unk_02 = (config & 0xff00) + 0x800;

        sub_80066FC(offset / CHR_SIZE, faceId);
        sub_800671C(4, faceId);

        BG_Fill(BG_GetMapBuffer(bg), 0);

        x = pWrapper->unk_00;

        if (config & 0x400) {
            disp = (FACE_DISP_BIT_14 | FACE_DISP_BLEND | FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(FACE_HLAYER_1) | FACE_DISP_FLIPPED);
        } else {
            disp = (FACE_DISP_BIT_14 | FACE_DISP_BLEND | FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(FACE_HLAYER_1));
        }

        if (config & 0x8000) {
            disp = disp | FACE_DISP_BIT_13;
        }

        faceProc = StartFace2(faceSlot, faceId, x, 28, disp);

        pWrapper->faceProc = faceProc;

        if ((config & 0x6000) == 0x6000) {
            faceProc->spriteLayer = 6;
        } else if (config & 0x4000) {
            faceProc->spriteLayer = 5;
        } else if (config & 0x2000) {
            faceProc->spriteLayer = 4;
        } else {
            faceProc->spriteLayer = 3;
        }

        SetFaceBlinkControlById(faceSlot, 5);

        pWrapper->unk_0a = +1;
        proc->increment = +2;

        if (proc->blendAmt == 0x20) {
            proc->blendAmt = 0;
            SetSpecialColorEffectsParameters(1, 0, 0x10, 0);
        }
    }

    return;
}

//! FE8U = 0x080B8844
void sub_80B8844(int faceSlot, u16 config) {
    int bg;
    u32 offset;

    struct WMFaceCtrlProc* proc = Proc_Find(gProcScr_WorldMapFaceCtrl);

    struct WMFaceWrapper* pWrapper = proc->faceHolderProc->faceWrapper + faceSlot;

    if (gGMData.state.bits.state_3) {
        SetBlendTargetA(0, 0, 1, 0, 0);
        SetBlendTargetB(0, 1, 0, 1, 1);
    } else {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
    }

    bg = GetWMFaceBg();
    offset = GetWMFaceVramOffset();

    if (pWrapper->faceProc != NULL && (pWrapper->unk_02 & 0x1000) == 0) {
        int tmp;

        sub_80066FC(offset / CHR_SIZE, (s16)pWrapper->faceId);
        sub_800671C(4, (s16)pWrapper->faceId);

        BG_Fill(BG_GetMapBuffer(bg), 0);

        tmp = 0xFFFFFF00 & (u16)pWrapper->unk_02;
        // Seems to be required to match...
        tmp &= (u16)pWrapper->unk_02;

        if (config & 0x300) {
            tmp &= 0x0000FCFF;
            tmp |= (config & 0x300);
        } else {
            tmp &= 0x0000FCFF;
        }

        tmp &= 0xff00;

        pWrapper->unk_02 = tmp + 0x1000;

        pWrapper->unk_0a = -1;
        proc->increment = -2;

        if (proc->blendAmt == 0) {
            proc->blendAmt = 0x20;
            SetSpecialColorEffectsParameters(1, 0x10, 0, 0);
        }
    }

    return;
}

//! FE8U = 0x080B895C
void sub_80B895C(void) {
    int i;

    struct WMFaceCtrlProc* proc = Proc_Find(gProcScr_WorldMapFaceCtrl);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    for (i = 0; i < 2; i++) {
        struct WMFaceWrapper* pWrapper = &proc->faceHolderProc->faceWrapper[i];

        struct FaceProc* faceProc = pWrapper->faceProc;

        if (faceProc != NULL && (pWrapper->unk_02 & 0x1000) == 0) {
            SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) | FACE_DISP_BIT_14);

            pWrapper->unk_02 &= ~0xff;
            pWrapper->unk_02 += 0x1000;

            pWrapper->unk_0a = -1;
            proc->increment = -2;

            if (proc->blendAmt == 0) {
                proc->blendAmt = 0x20;
                SetSpecialColorEffectsParameters(0, 0x10, 0, 0);
            }
        }
    }

    return;
}
