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
  %.promoted = load float, float* getelementptr inbounds ([32 x float], [32 x float]* @output, i64 0, i64 0), align 16, !tbaa !2
  br label %for.body.i

for.body.i:                                       ; preds = %if.end.i, %entry
  %add14.i1 = phi float [ %.promoted, %entry ], [ %add14.i, %if.end.i ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.pre-phi.i, %if.end.i ]
  %cmp1.i = icmp ult i64 %indvars.iv.i, 16
  br i1 %cmp1.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %for.body.i
  %0 = add nuw nsw i64 %indvars.iv.i, 1
  %arrayidx.i = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %0
  %1 = load float, float* %arrayidx.i, align 4, !tbaa !2
  %arrayidx8.phi.trans.insert.i = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %indvars.iv.i
  %.pre.i = load float, float* %arrayidx8.phi.trans.insert.i, align 4, !tbaa !2
  br label %if.end.i

if.else.i:                                        ; preds = %for.body.i
  %arrayidx3.i = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %indvars.iv.i
  %2 = load float, float* %arrayidx3.i, align 4, !tbaa !2
  %mul.i = fmul float %2, 2.000000e+00
  %.pre26.i = add nuw nsw i64 %indvars.iv.i, 1
  br label %if.end.i

if.end.i:                                         ; preds = %if.else.i, %if.then.i
  %indvars.iv.next.pre-phi.i = phi i64 [ %.pre26.i, %if.else.i ], [ %0, %if.then.i ]
  %3 = phi float [ %2, %if.else.i ], [ %.pre.i, %if.then.i ]
  %tmp.0.in.i = phi float [ %mul.i, %if.else.i ], [ %1, %if.then.i ]
  %tmp.0.i = fptosi float %tmp.0.in.i to i32
  %arrayidx6.i = getelementptr inbounds [32 x float], [32 x float]* @input, i64 0, i64 %indvars.iv.i
  %4 = load float, float* %arrayidx6.i, align 4, !tbaa !2
  %mul9.i = fmul float %3, %4
  %conv10.i = sitofp i32 %tmp.0.i to float
  %add11.i = fadd float %mul9.i, %conv10.i
  %add14.i = fadd float %add14.i1, %add11.i
  %exitcond.i = icmp eq i64 %indvars.iv.next.pre-phi.i, 32
  br i1 %exitcond.i, label %_Z6kernelPfS_S_.exit, label %for.body.i

_Z6kernelPfS_S_.exit:                             ; preds = %if.end.i
  store float %add14.i, float* getelementptr inbounds ([32 x float], [32 x float]* @output, i64 0, i64 0), align 16, !tbaa !2
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @_Z6kernelPfS_S_(float* nocapture readonly %input, float* nocapture %output, float* nocapture readonly %coefficient) local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.pre-phi, %if.end ]
  %cmp1 = icmp ult i64 %indvars.iv, 16
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %0 = add nuw nsw i64 %indvars.iv, 1
  %arrayidx = getelementptr inbounds float, float* %coefficient, i64 %0
  %1 = load float, float* %arrayidx, align 4, !tbaa !2
  %arrayidx8.phi.trans.insert = getelementptr inbounds float, float* %coefficient, i64 %indvars.iv
  %.pre = load float, float* %arrayidx8.phi.trans.insert, align 4, !tbaa !2
  br label %if.end

if.else:                                          ; preds = %for.body
  %arrayidx3 = getelementptr inbounds float, float* %coefficient, i64 %indvars.iv
  %2 = load float, float* %arrayidx3, align 4, !tbaa !2
  %mul = fmul float %2, 2.000000e+00
  %.pre26 = add nuw nsw i64 %indvars.iv, 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %indvars.iv.next.pre-phi = phi i64 [ %.pre26, %if.else ], [ %0, %if.then ]
  %3 = phi float [ %2, %if.else ], [ %.pre, %if.then ]
  %tmp.0.in = phi float [ %mul, %if.else ], [ %1, %if.then ]
  %tmp.0 = fptosi float %tmp.0.in to i32
  %arrayidx6 = getelementptr inbounds float, float* %input, i64 %indvars.iv
  %4 = load float, float* %arrayidx6, align 4, !tbaa !2
  %mul9 = fmul float %4, %3
  %conv10 = sitofp i32 %tmp.0 to float
  %add11 = fadd float %mul9, %conv10
  %5 = load float, float* %output, align 4, !tbaa !2
  %add14 = fadd float %5, %add11
  store float %add14, float* %output, align 4, !tbaa !2
  %exitcond = icmp eq i64 %indvars.iv.next.pre-phi, 32
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
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
