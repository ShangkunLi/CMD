; ModuleID = 'kernel.bc'
source_filename = "kernel.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@input = dso_local local_unnamed_addr global [32 x float] zeroinitializer, align 16
@output = dso_local local_unnamed_addr global [32 x float] zeroinitializer, align 16
@coefficients = dso_local local_unnamed_addr global [32 x float] [float 2.500000e-01, float 1.500000e+00, float 3.750000e+00, float -2.250000e+00, float 5.000000e-01, float 7.500000e-01, float -3.000000e+00, float 1.250000e+00, float 2.500000e-01, float 1.500000e+00, float 3.750000e+00, float -2.250000e+00, float 5.000000e-01, float 7.500000e-01, float -3.000000e+00, float 1.250000e+00, float 2.500000e-01, float 1.500000e+00, float 3.750000e+00, float -2.250000e+00, float 5.000000e-01, float 7.500000e-01, float -3.000000e+00, float 1.250000e+00, float 2.500000e-01, float 1.500000e+00, float 3.750000e+00, float -2.250000e+00, float 5.000000e-01, float 7.500000e-01, float -3.000000e+00, float 1.250000e+00], align 16

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %.pre.i = load float, float* getelementptr inbounds ([32 x float], [32 x float]* @output, i64 0, i64 0), align 16, !tbaa !2
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %0 = phi float [ %.pre.i, %entry ], [ %add.i, %for.body.i ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds [32 x float], [32 x float]* @input, i64 0, i64 %indvars.iv.i
  %1 = load float, float* %arrayidx.i, align 4, !tbaa !2
  %arrayidx2.i = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %indvars.iv.i
  %2 = load float, float* %arrayidx2.i, align 4, !tbaa !2
  %mul.i = fmul float %1, %2
  %add.i = fadd float %0, %mul.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 32
  br i1 %exitcond.i, label %_Z6kernelPfS_S_.exit, label %for.body.i

_Z6kernelPfS_S_.exit:                             ; preds = %for.body.i
  store float %add.i, float* getelementptr inbounds ([32 x float], [32 x float]* @output, i64 0, i64 0), align 16, !tbaa !2
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @_Z6kernelPfS_S_(float* nocapture readonly %input, float* nocapture %output, float* nocapture readonly %coefficient) local_unnamed_addr #0 {
entry:
  %.pre = load float, float* %output, align 4, !tbaa !2
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %0 = phi float [ %.pre, %entry ], [ %add, %for.body ]
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %input, i64 %indvars.iv
  %1 = load float, float* %arrayidx, align 4, !tbaa !2
  %arrayidx2 = getelementptr inbounds float, float* %coefficient, i64 %indvars.iv
  %2 = load float, float* %arrayidx2, align 4, !tbaa !2
  %mul = fmul float %1, %2
  %add = fadd float %0, %mul
  store float %add, float* %output, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"float", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
