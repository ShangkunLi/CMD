; ModuleID = 'bf_test.bc'
source_filename = "bf_test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @BF_encrypt(i64* nocapture %data, %struct.bf_key_st* nocapture readonly %key, i32 %encrypt) local_unnamed_addr #0 {
entry:
  %0 = load i64, i64* %data, align 8, !tbaa !2
  %arrayidx2 = getelementptr inbounds i64, i64* %data, i64 1
  %1 = load i64, i64* %arrayidx2, align 8, !tbaa !2
  %tobool = icmp eq i32 %encrypt, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds %struct.bf_key_st, %struct.bf_key_st* %key, i64 0, i32 0, i64 0
  %2 = load i64, i64* %arraydecay, align 8, !tbaa !2
  %xor = xor i64 %2, %0
  br label %for.body

for.body:                                         ; preds = %for.body, %if.then
  %indvars.iv = phi i64 [ 1, %if.then ], [ %indvars.iv.next, %for.body ]
  %l.054 = phi i64 [ %xor, %if.then ], [ %xor20, %for.body ]
  %r.053 = phi i64 [ %1, %if.then ], [ %l.054, %for.body ]
  %arrayidx4 = getelementptr inbounds %struct.bf_key_st, %struct.bf_key_st* %key, i64 0, i32 0, i64 %indvars.iv
  %3 = load i64, i64* %arrayidx4, align 8, !tbaa !2
  %xor5 = xor i64 %3, %r.053
  %shr = lshr i64 %l.054, 24
  %arrayidx6 = getelementptr inbounds %struct.bf_key_st, %struct.bf_key_st* %key, i64 0, i32 1, i64 %shr
  %4 = load i64, i64* %arrayidx6, align 8, !tbaa !2
  %shr7 = lshr i64 %l.054, 16
  %and = and i64 %shr7, 255
  %add = or i64 %and, 256
  %arrayidx8 = getelementptr inbounds %struct.bf_key_st, %struct.bf_key_st* %key, i64 0, i32 1, i64 %add
  %5 = load i64, i64* %arrayidx8, align 8, !tbaa !2
  %add9 = add i64 %5, %4
  %shr10 = lshr i64 %l.054, 8
  %and11 = and i64 %shr10, 255
  %add12 = or i64 %and11, 512
  %arrayidx13 = getelementptr inbounds %struct.bf_key_st, %struct.bf_key_st* %key, i64 0, i32 1, i64 %add12
  %6 = load i64, i64* %arrayidx13, align 8, !tbaa !2
  %xor14 = xor i64 %add9, %6
  %and15 = and i64 %l.054, 255
  %add16 = or i64 %and15, 768
  %arrayidx17 = getelementptr inbounds %struct.bf_key_st, %struct.bf_key_st* %key, i64 0, i32 1, i64 %add16
  %7 = load i64, i64* %arrayidx17, align 8, !tbaa !2
  %add18 = add i64 %xor14, %7
  %and19 = and i64 %add18, 4294967295
  %xor20 = xor i64 %xor5, %and19
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 21
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %xor22 = xor i64 %l.054, %2
  br label %if.end

if.end:                                           ; preds = %entry, %for.end
  %r.1 = phi i64 [ %xor22, %for.end ], [ %1, %entry ]
  %l.1 = phi i64 [ %xor20, %for.end ], [ %0, %entry ]
  %and23 = and i64 %l.1, 4294967295
  store i64 %and23, i64* %arrayidx2, align 8, !tbaa !2
  %and25 = and i64 %r.1, 4294967295
  store i64 %and25, i64* %data, align 8, !tbaa !2
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
