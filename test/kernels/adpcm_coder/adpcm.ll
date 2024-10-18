; ModuleID = 'adpcm.bc'
source_filename = "adpcm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@stepsizeTable = internal unnamed_addr constant [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 16
@indexTable = internal unnamed_addr constant [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 16

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @adpcm_coder(i8* nocapture readonly %indata, i8* nocapture %outdata, i32 %len, %struct.adpcm_state* nocapture %state) local_unnamed_addr #0 {
entry:
  %valprev = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %state, i64 0, i32 0
  %0 = load i16, i16* %valprev, align 2, !tbaa !2
  %conv = sext i16 %0 to i32
  %index1 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %state, i64 0, i32 1
  %1 = load i8, i8* %index1, align 2, !tbaa !7
  %conv2 = sext i8 %1 to i32
  %cmp129 = icmp sgt i32 %len, 0
  br i1 %cmp129, label %for.body.preheader, label %if.end68

for.body.preheader:                               ; preds = %entry
  %idxprom = sext i8 %1 to i64
  %arrayidx = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %idxprom
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !8
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end62
  %bufferstep.0137 = phi i32 [ %lnot.ext, %if.end62 ], [ 1, %for.body.preheader ]
  %outputbuffer.0136 = phi i32 [ %outputbuffer.1, %if.end62 ], [ undef, %for.body.preheader ]
  %index.0135 = phi i32 [ %spec.store.select73, %if.end62 ], [ %conv2, %for.body.preheader ]
  %valpred.0134 = phi i32 [ %valpred.2, %if.end62 ], [ %conv, %for.body.preheader ]
  %step.0133 = phi i32 [ %12, %if.end62 ], [ %2, %for.body.preheader ]
  %len.addr.0132 = phi i32 [ %dec, %if.end62 ], [ %len, %for.body.preheader ]
  %inp.0131 = phi i8* [ %incdec.ptr, %if.end62 ], [ %indata, %for.body.preheader ]
  %outp.0130 = phi i8* [ %outp.1, %if.end62 ], [ %outdata, %for.body.preheader ]
  %incdec.ptr = getelementptr inbounds i8, i8* %inp.0131, i64 1
  %3 = load i8, i8* %inp.0131, align 1, !tbaa !10
  %conv4 = zext i8 %3 to i32
  %sub = sub nsw i32 %conv4, %valpred.0134
  %cmp5 = icmp slt i32 %sub, 0
  %4 = lshr i32 %sub, 28
  %5 = and i32 %4, 8
  %sub7 = sub nsw i32 0, %sub
  %spec.select = select i1 %cmp5, i32 %sub7, i32 %sub
  %shr = ashr i32 %step.0133, 3
  %cmp8 = icmp slt i32 %spec.select, %step.0133
  %delta.0 = select i1 %cmp8, i32 0, i32 4
  %sub11 = select i1 %cmp8, i32 0, i32 %step.0133
  %diff.1 = sub nsw i32 %spec.select, %sub11
  %vpdiff.0 = add nsw i32 %sub11, %shr
  %shr13 = ashr i32 %step.0133, 1
  %cmp14 = icmp slt i32 %diff.1, %shr13
  %or = or i32 %delta.0, 2
  %delta.1 = select i1 %cmp14, i32 %delta.0, i32 %or
  %sub17 = select i1 %cmp14, i32 0, i32 %shr13
  %diff.2 = sub nsw i32 %diff.1, %sub17
  %vpdiff.1 = add nsw i32 %vpdiff.0, %sub17
  %shr20 = ashr i32 %step.0133, 2
  %cmp21 = icmp slt i32 %diff.2, %shr20
  %not.cmp21 = xor i1 %cmp21, true
  %or24 = zext i1 %not.cmp21 to i32
  %add25 = select i1 %cmp21, i32 0, i32 %shr20
  %vpdiff.2 = add nsw i32 %vpdiff.1, %add25
  %6 = sub i32 0, %vpdiff.2
  %valpred.1.p = select i1 %cmp5, i32 %6, i32 %vpdiff.2
  %valpred.1 = add i32 %valpred.1.p, %valpred.0134
  %7 = icmp sgt i32 %valpred.1, -32768
  %spec.select128 = select i1 %7, i32 %valpred.1, i32 -32768
  %8 = icmp slt i32 %spec.select128, 32767
  %valpred.2 = select i1 %8, i32 %spec.select128, i32 32767
  %delta.2 = or i32 %delta.1, %5
  %or41 = or i32 %delta.2, %or24
  %idxprom42 = zext i32 %or41 to i64
  %arrayidx43 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %idxprom42
  %9 = load i32, i32* %arrayidx43, align 4, !tbaa !8
  %add44 = add nsw i32 %9, %index.0135
  %10 = icmp sgt i32 %add44, 0
  %spec.store.select = select i1 %10, i32 %add44, i32 0
  %11 = icmp slt i32 %spec.store.select, 88
  %spec.store.select73 = select i1 %11, i32 %spec.store.select, i32 88
  %idxprom53 = zext i32 %spec.store.select73 to i64
  %arrayidx54 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %idxprom53
  %12 = load i32, i32* %arrayidx54, align 4, !tbaa !8
  %tobool55 = icmp ne i32 %bufferstep.0137, 0
  br i1 %tobool55, label %if.then56, label %if.else57

if.then56:                                        ; preds = %for.body
  %shl = shl nuw nsw i32 %or41, 4
  %and = and i32 %shl, 240
  br label %if.end62

if.else57:                                        ; preds = %for.body
  %or59 = or i32 %or41, %outputbuffer.0136
  %conv60 = trunc i32 %or59 to i8
  %incdec.ptr61 = getelementptr inbounds i8, i8* %outp.0130, i64 1
  store i8 %conv60, i8* %outp.0130, align 1, !tbaa !10
  br label %if.end62

if.end62:                                         ; preds = %if.else57, %if.then56
  %outp.1 = phi i8* [ %outp.0130, %if.then56 ], [ %incdec.ptr61, %if.else57 ]
  %outputbuffer.1 = phi i32 [ %and, %if.then56 ], [ %outputbuffer.0136, %if.else57 ]
  %lnot = xor i1 %tobool55, true
  %lnot.ext = zext i1 %lnot to i32
  %dec = add nsw i32 %len.addr.0132, -1
  %cmp = icmp sgt i32 %len.addr.0132, 1
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %if.end62
  br i1 %tobool55, label %if.then65, label %if.end68

if.then65:                                        ; preds = %for.end
  %conv66 = trunc i32 %outputbuffer.1 to i8
  store i8 %conv66, i8* %outp.1, align 1, !tbaa !10
  br label %if.end68

if.end68:                                         ; preds = %entry, %for.end, %if.then65
  %index.0.lcssa148 = phi i32 [ %spec.store.select73, %for.end ], [ %spec.store.select73, %if.then65 ], [ %conv2, %entry ]
  %valpred.0.lcssa147 = phi i32 [ %valpred.2, %for.end ], [ %valpred.2, %if.then65 ], [ %conv, %entry ]
  %conv69 = trunc i32 %valpred.0.lcssa147 to i16
  store i16 %conv69, i16* %valprev, align 2, !tbaa !2
  %conv71 = trunc i32 %index.0.lcssa148 to i8
  store i8 %conv71, i8* %index1, align 2, !tbaa !7
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!2 = !{!3, !4, i64 0}
!3 = !{!"adpcm_state", !4, i64 0, !5, i64 2}
!4 = !{!"short", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!3, !5, i64 2}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !5, i64 0}
!10 = !{!5, !5, i64 0}
