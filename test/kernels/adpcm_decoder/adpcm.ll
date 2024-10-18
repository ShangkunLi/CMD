; ModuleID = 'adpcm.bc'
source_filename = "adpcm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@stepsizeTable = internal unnamed_addr constant [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 16
@indexTable = internal unnamed_addr constant [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 16

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @adpcm_decoder(i8* nocapture readonly %indata, i16* nocapture %outdata, i32 %len, %struct.adpcm_state* nocapture %state) local_unnamed_addr #0 {
entry:
  %valprev = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %state, i64 0, i32 0
  %0 = load i16, i16* %valprev, align 2, !tbaa !2
  %index1 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %state, i64 0, i32 1
  %1 = load i8, i8* %index1, align 2, !tbaa !7
  %conv2 = sext i8 %1 to i32
  %cmp97 = icmp sgt i32 %len, 0
  br i1 %cmp97, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %conv = sext i16 %0 to i32
  %idxprom = sext i8 %1 to i64
  %arrayidx = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %idxprom
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !8
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %bufferstep.0105 = phi i32 [ %lnot.ext, %if.end ], [ 0, %for.body.preheader ]
  %inputbuffer.0104 = phi i32 [ %inputbuffer.1, %if.end ], [ undef, %for.body.preheader ]
  %index.0103 = phi i32 [ %spec.store.select59, %if.end ], [ %conv2, %for.body.preheader ]
  %valpred.0102 = phi i32 [ %valpred.2, %if.end ], [ %conv, %for.body.preheader ]
  %step.0101 = phi i32 [ %11, %if.end ], [ %2, %for.body.preheader ]
  %len.addr.0100 = phi i32 [ %dec, %if.end ], [ %len, %for.body.preheader ]
  %outp.099 = phi i16* [ %incdec.ptr54, %if.end ], [ %outdata, %for.body.preheader ]
  %inp.098 = phi i8* [ %inp.1, %if.end ], [ %indata, %for.body.preheader ]
  %tobool = icmp ne i32 %bufferstep.0105, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %and = and i32 %inputbuffer.0104, 15
  br label %if.end

if.else:                                          ; preds = %for.body
  %incdec.ptr = getelementptr inbounds i8, i8* %inp.098, i64 1
  %3 = load i8, i8* %inp.098, align 1, !tbaa !10
  %conv4 = zext i8 %3 to i32
  %4 = lshr i32 %conv4, 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %inp.1 = phi i8* [ %inp.098, %if.then ], [ %incdec.ptr, %if.else ]
  %delta.0 = phi i32 [ %and, %if.then ], [ %4, %if.else ]
  %inputbuffer.1 = phi i32 [ %inputbuffer.0104, %if.then ], [ %conv4, %if.else ]
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %idxprom7 = zext i32 %delta.0 to i64
  %arrayidx8 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %idxprom7
  %5 = load i32, i32* %arrayidx8, align 4, !tbaa !8
  %add = add nsw i32 %5, %index.0103
  %6 = icmp sgt i32 %add, 0
  %spec.store.select = select i1 %6, i32 %add, i32 0
  %7 = icmp slt i32 %spec.store.select, 88
  %spec.store.select59 = select i1 %7, i32 %spec.store.select, i32 88
  %and17 = and i32 %delta.0, 8
  %shr19 = ashr i32 %step.0101, 3
  %and20 = and i32 %delta.0, 4
  %tobool21 = icmp eq i32 %and20, 0
  %add23 = select i1 %tobool21, i32 0, i32 %step.0101
  %spec.select = add nsw i32 %add23, %shr19
  %and25 = and i32 %delta.0, 2
  %tobool26 = icmp eq i32 %and25, 0
  %shr28 = ashr i32 %step.0101, 1
  %add29 = select i1 %tobool26, i32 0, i32 %shr28
  %vpdiff.1 = add nsw i32 %spec.select, %add29
  %and31 = and i32 %delta.0, 1
  %tobool32 = icmp eq i32 %and31, 0
  %shr34 = ashr i32 %step.0101, 2
  %add35 = select i1 %tobool32, i32 0, i32 %shr34
  %vpdiff.2 = add nsw i32 %vpdiff.1, %add35
  %tobool37 = icmp eq i32 %and17, 0
  %8 = sub i32 0, %vpdiff.2
  %valpred.1.p = select i1 %tobool37, i32 %vpdiff.2, i32 %8
  %valpred.1 = add i32 %valpred.1.p, %valpred.0102
  %9 = icmp sgt i32 %valpred.1, -32768
  %spec.select96 = select i1 %9, i32 %valpred.1, i32 -32768
  %10 = icmp slt i32 %spec.select96, 32767
  %valpred.2 = select i1 %10, i32 %spec.select96, i32 32767
  %idxprom51 = zext i32 %spec.store.select59 to i64
  %arrayidx52 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %idxprom51
  %11 = load i32, i32* %arrayidx52, align 4, !tbaa !8
  %conv53 = trunc i32 %valpred.2 to i16
  %incdec.ptr54 = getelementptr inbounds i16, i16* %outp.099, i64 1
  store i16 %conv53, i16* %outp.099, align 2, !tbaa !11
  %dec = add nsw i32 %len.addr.0100, -1
  %cmp = icmp sgt i32 %len.addr.0100, 1
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %if.end
  %conv53.le = trunc i32 %valpred.2 to i16
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %conv55.pre-phi = phi i16 [ %0, %entry ], [ %conv53.le, %for.end.loopexit ]
  %index.0.lcssa = phi i32 [ %conv2, %entry ], [ %spec.store.select59, %for.end.loopexit ]
  store i16 %conv55.pre-phi, i16* %valprev, align 2, !tbaa !2
  %conv57 = trunc i32 %index.0.lcssa to i8
  store i8 %conv57, i8* %index1, align 2, !tbaa !7
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
!11 = !{!4, !4, i64 0}
