#ifndef GUARD_RNG_H
#define GUARD_RNG_H

// rng.c
// ??? NextRN(???);
void InitRN(s32 unk1);
// ??? LoadRNState(???);
// ??? StoreRNState(???);
// ??? NextRN_100(???);
// ??? NextRN_N(???);
// ??? Roll1RN(???);
// ??? Roll2RN(???);
void SetLCGRNValue(s32 Seed);
unsigned AdvanceGetLCGRNValue(void);

#endif
