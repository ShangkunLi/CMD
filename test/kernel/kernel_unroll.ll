; ModuleID = 'kernel_unroll.bc'
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

for.body.i:                                       ; preds = %if.end.i.3, %entry
  %add14.i1 = phi float [ %.promoted, %entry ], [ %add14.i.3, %if.end.i.3 ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.pre-phi.i.3, %if.end.i.3 ]
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
  br i1 %exitcond.i, label %_Z6kernelPfS_S_.exit, label %for.body.i.1

_Z6kernelPfS_S_.exit:                             ; preds = %if.end.i.3, %if.end.i.2, %if.end.i.1, %if.end.i
  %add14.i.lcssa = phi float [ %add14.i, %if.end.i ], [ %add14.i.1, %if.end.i.1 ], [ %add14.i.2, %if.end.i.2 ], [ %add14.i.3, %if.end.i.3 ]
  store float %add14.i.lcssa, float* getelementptr inbounds ([32 x float], [32 x float]* @output, i64 0, i64 0), align 16, !tbaa !2
  ret i32 0

for.body.i.1:                                     ; preds = %if.end.i
  %cmp1.i.1 = icmp ult i64 %indvars.iv.next.pre-phi.i, 16
  br i1 %cmp1.i.1, label %if.then.i.1, label %if.else.i.1

if.else.i.1:                                      ; preds = %for.body.i.1
  %arrayidx3.i.1 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %indvars.iv.next.pre-phi.i
  %5 = load float, float* %arrayidx3.i.1, align 4, !tbaa !2
  %mul.i.1 = fmul float %5, 2.000000e+00
  %.pre26.i.1 = add nuw nsw i64 %indvars.iv.next.pre-phi.i, 1
  br label %if.end.i.1

if.then.i.1:                                      ; preds = %for.body.i.1
  %6 = add nuw nsw i64 %indvars.iv.next.pre-phi.i, 1
  %arrayidx.i.1 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %6
  %7 = load float, float* %arrayidx.i.1, align 4, !tbaa !2
  %arrayidx8.phi.trans.insert.i.1 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %indvars.iv.next.pre-phi.i
  %.pre.i.1 = load float, float* %arrayidx8.phi.trans.insert.i.1, align 4, !tbaa !2
  br label %if.end.i.1

if.end.i.1:                                       ; preds = %if.then.i.1, %if.else.i.1
  %indvars.iv.next.pre-phi.i.1 = phi i64 [ %.pre26.i.1, %if.else.i.1 ], [ %6, %if.then.i.1 ]
  %8 = phi float [ %5, %if.else.i.1 ], [ %.pre.i.1, %if.then.i.1 ]
  %tmp.0.in.i.1 = phi float [ %mul.i.1, %if.else.i.1 ], [ %7, %if.then.i.1 ]
  %tmp.0.i.1 = fptosi float %tmp.0.in.i.1 to i32
  %arrayidx6.i.1 = getelementptr inbounds [32 x float], [32 x float]* @input, i64 0, i64 %indvars.iv.next.pre-phi.i
  %9 = load float, float* %arrayidx6.i.1, align 4, !tbaa !2
  %mul9.i.1 = fmul float %8, %9
  %conv10.i.1 = sitofp i32 %tmp.0.i.1 to float
  %add11.i.1 = fadd float %mul9.i.1, %conv10.i.1
  %add14.i.1 = fadd float %add14.i, %add11.i.1
  %exitcond.i.1 = icmp eq i64 %indvars.iv.next.pre-phi.i.1, 32
  br i1 %exitcond.i.1, label %_Z6kernelPfS_S_.exit, label %for.body.i.2

for.body.i.2:                                     ; preds = %if.end.i.1
  %cmp1.i.2 = icmp ult i64 %indvars.iv.next.pre-phi.i.1, 16
  br i1 %cmp1.i.2, label %if.then.i.2, label %if.else.i.2

if.else.i.2:                                      ; preds = %for.body.i.2
  %arrayidx3.i.2 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %indvars.iv.next.pre-phi.i.1
  %10 = load float, float* %arrayidx3.i.2, align 4, !tbaa !2
  %mul.i.2 = fmul float %10, 2.000000e+00
  %.pre26.i.2 = add nuw nsw i64 %indvars.iv.next.pre-phi.i.1, 1
  br label %if.end.i.2

if.then.i.2:                                      ; preds = %for.body.i.2
  %11 = add nuw nsw i64 %indvars.iv.next.pre-phi.i.1, 1
  %arrayidx.i.2 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %11
  %12 = load float, float* %arrayidx.i.2, align 4, !tbaa !2
  %arrayidx8.phi.trans.insert.i.2 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %indvars.iv.next.pre-phi.i.1
  %.pre.i.2 = load float, float* %arrayidx8.phi.trans.insert.i.2, align 4, !tbaa !2
  br label %if.end.i.2

if.end.i.2:                                       ; preds = %if.then.i.2, %if.else.i.2
  %indvars.iv.next.pre-phi.i.2 = phi i64 [ %.pre26.i.2, %if.else.i.2 ], [ %11, %if.then.i.2 ]
  %13 = phi float [ %10, %if.else.i.2 ], [ %.pre.i.2, %if.then.i.2 ]
  %tmp.0.in.i.2 = phi float [ %mul.i.2, %if.else.i.2 ], [ %12, %if.then.i.2 ]
  %tmp.0.i.2 = fptosi float %tmp.0.in.i.2 to i32
  %arrayidx6.i.2 = getelementptr inbounds [32 x float], [32 x float]* @input, i64 0, i64 %indvars.iv.next.pre-phi.i.1
  %14 = load float, float* %arrayidx6.i.2, align 4, !tbaa !2
  %mul9.i.2 = fmul float %13, %14
  %conv10.i.2 = sitofp i32 %tmp.0.i.2 to float
  %add11.i.2 = fadd float %mul9.i.2, %conv10.i.2
  %add14.i.2 = fadd float %add14.i.1, %add11.i.2
  %exitcond.i.2 = icmp eq i64 %indvars.iv.next.pre-phi.i.2, 32
  br i1 %exitcond.i.2, label %_Z6kernelPfS_S_.exit, label %for.body.i.3

for.body.i.3:                                     ; preds = %if.end.i.2
  %cmp1.i.3 = icmp ult i64 %indvars.iv.next.pre-phi.i.2, 16
  br i1 %cmp1.i.3, label %if.then.i.3, label %if.else.i.3

if.else.i.3:                                      ; preds = %for.body.i.3
  %arrayidx3.i.3 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %indvars.iv.next.pre-phi.i.2
  %15 = load float, float* %arrayidx3.i.3, align 4, !tbaa !2
  %mul.i.3 = fmul float %15, 2.000000e+00
  %.pre26.i.3 = add nuw nsw i64 %indvars.iv.next.pre-phi.i.2, 1
  br label %if.end.i.3

if.then.i.3:                                      ; preds = %for.body.i.3
  %16 = add nuw nsw i64 %indvars.iv.next.pre-phi.i.2, 1
  %arrayidx.i.3 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %16
  %17 = load float, float* %arrayidx.i.3, align 4, !tbaa !2
  %arrayidx8.phi.trans.insert.i.3 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %indvars.iv.next.pre-phi.i.2
  %.pre.i.3 = load float, float* %arrayidx8.phi.trans.insert.i.3, align 4, !tbaa !2
  br label %if.end.i.3

if.end.i.3:                                       ; preds = %if.then.i.3, %if.else.i.3
  %indvars.iv.next.pre-phi.i.3 = phi i64 [ %.pre26.i.3, %if.else.i.3 ], [ %16, %if.then.i.3 ]
  %18 = phi float [ %15, %if.else.i.3 ], [ %.pre.i.3, %if.then.i.3 ]
  %tmp.0.in.i.3 = phi float [ %mul.i.3, %if.else.i.3 ], [ %17, %if.then.i.3 ]
  %tmp.0.i.3 = fptosi float %tmp.0.in.i.3 to i32
  %arrayidx6.i.3 = getelementptr inbounds [32 x float], [32 x float]* @input, i64 0, i64 %indvars.iv.next.pre-phi.i.2
  %19 = load float, float* %arrayidx6.i.3, align 4, !tbaa !2
  %mul9.i.3 = fmul float %18, %19
  %conv10.i.3 = sitofp i32 %tmp.0.i.3 to float
  %add11.i.3 = fadd float %mul9.i.3, %conv10.i.3
  %add14.i.3 = fadd float %add14.i.2, %add11.i.3
  %exitcond.i.3 = icmp eq i64 %indvars.iv.next.pre-phi.i.3, 32
  br i1 %exitcond.i.3, label %_Z6kernelPfS_S_.exit, label %for.body.i, !llvm.loop !6
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @_Z6kernelPfS_S_(float* nocapture readonly %input, float* nocapture %output, float* nocapture readonly %coefficient) local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %if.end.3, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.pre-phi.3, %if.end.3 ]
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
  br i1 %exitcond, label %for.end, label %for.body.1

for.end:                                          ; preds = %if.end.3, %if.end.2, %if.end.1, %if.end
  ret void

for.body.1:                                       ; preds = %if.end
  %cmp1.1 = icmp ult i64 %indvars.iv.next.pre-phi, 16
  br i1 %cmp1.1, label %if.then.1, label %if.else.1

if.else.1:                                        ; preds = %for.body.1
  %arrayidx3.1 = getelementptr inbounds float, float* %coefficient, i64 %indvars.iv.next.pre-phi
  %6 = load float, float* %arrayidx3.1, align 4, !tbaa !2
  %mul.1 = fmul float %6, 2.000000e+00
  %.pre26.1 = add nuw nsw i64 %indvars.iv.next.pre-phi, 1
  br label %if.end.1

if.then.1:                                        ; preds = %for.body.1
  %7 = add nuw nsw i64 %indvars.iv.next.pre-phi, 1
  %arrayidx.1 = getelementptr inbounds float, float* %coefficient, i64 %7
  %8 = load float, float* %arrayidx.1, align 4, !tbaa !2
  %arrayidx8.phi.trans.insert.1 = getelementptr inbounds float, float* %coefficient, i64 %indvars.iv.next.pre-phi
  %.pre.1 = load float, float* %arrayidx8.phi.trans.insert.1, align 4, !tbaa !2
  br label %if.end.1

if.end.1:                                         ; preds = %if.then.1, %if.else.1
  %indvars.iv.next.pre-phi.1 = phi i64 [ %.pre26.1, %if.else.1 ], [ %7, %if.then.1 ]
  %9 = phi float [ %6, %if.else.1 ], [ %.pre.1, %if.then.1 ]
  %tmp.0.in.1 = phi float [ %mul.1, %if.else.1 ], [ %8, %if.then.1 ]
  %tmp.0.1 = fptosi float %tmp.0.in.1 to i32
  %arrayidx6.1 = getelementptr inbounds float, float* %input, i64 %indvars.iv.next.pre-phi
  %10 = load float, float* %arrayidx6.1, align 4, !tbaa !2
  %mul9.1 = fmul float %10, %9
  %conv10.1 = sitofp i32 %tmp.0.1 to float
  %add11.1 = fadd float %mul9.1, %conv10.1
  %11 = load float, float* %output, align 4, !tbaa !2
  %add14.1 = fadd float %11, %add11.1
  store float %add14.1, float* %output, align 4, !tbaa !2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.pre-phi.1, 32
  br i1 %exitcond.1, label %for.end, label %for.body.2

for.body.2:                                       ; preds = %if.end.1
  %cmp1.2 = icmp ult i64 %indvars.iv.next.pre-phi.1, 16
  br i1 %cmp1.2, label %if.then.2, label %if.else.2

if.else.2:                                        ; preds = %for.body.2
  %arrayidx3.2 = getelementptr inbounds float, float* %coefficient, i64 %indvars.iv.next.pre-phi.1
  %12 = load float, float* %arrayidx3.2, align 4, !tbaa !2
  %mul.2 = fmul float %12, 2.000000e+00
  %.pre26.2 = add nuw nsw i64 %indvars.iv.next.pre-phi.1, 1
  br label %if.end.2

if.then.2:                                        ; preds = %for.body.2
  %13 = add nuw nsw i64 %indvars.iv.next.pre-phi.1, 1
  %arrayidx.2 = getelementptr inbounds float, float* %coefficient, i64 %13
  %14 = load float, float* %arrayidx.2, align 4, !tbaa !2
  %arrayidx8.phi.trans.insert.2 = getelementptr inbounds float, float* %coefficient, i64 %indvars.iv.next.pre-phi.1
  %.pre.2 = load float, float* %arrayidx8.phi.trans.insert.2, align 4, !tbaa !2
  br label %if.end.2

if.end.2:                                         ; preds = %if.then.2, %if.else.2
  %indvars.iv.next.pre-phi.2 = phi i64 [ %.pre26.2, %if.else.2 ], [ %13, %if.then.2 ]
  %15 = phi float [ %12, %if.else.2 ], [ %.pre.2, %if.then.2 ]
  %tmp.0.in.2 = phi float [ %mul.2, %if.else.2 ], [ %14, %if.then.2 ]
  %tmp.0.2 = fptosi float %tmp.0.in.2 to i32
  %arrayidx6.2 = getelementptr inbounds float, float* %input, i64 %indvars.iv.next.pre-phi.1
  %16 = load float, float* %arrayidx6.2, align 4, !tbaa !2
  %mul9.2 = fmul float %16, %15
  %conv10.2 = sitofp i32 %tmp.0.2 to float
  %add11.2 = fadd float %mul9.2, %conv10.2
  %17 = load float, float* %output, align 4, !tbaa !2
  %add14.2 = fadd float %17, %add11.2
  store float %add14.2, float* %output, align 4, !tbaa !2
  %exitcond.2 = icmp eq i64 %indvars.iv.next.pre-phi.2, 32
  br i1 %exitcond.2, label %for.end, label %for.body.3

for.body.3:                                       ; preds = %if.end.2
  %cmp1.3 = icmp ult i64 %indvars.iv.next.pre-phi.2, 16
  br i1 %cmp1.3, label %if.then.3, label %if.else.3

if.else.3:                                        ; preds = %for.body.3
  %arrayidx3.3 = getelementptr inbounds float, float* %coefficient, i64 %indvars.iv.next.pre-phi.2
  %18 = load float, float* %arrayidx3.3, align 4, !tbaa !2
  %mul.3 = fmul float %18, 2.000000e+00
  %.pre26.3 = add nuw nsw i64 %indvars.iv.next.pre-phi.2, 1
  br label %if.end.3

if.then.3:                                        ; preds = %for.body.3
  %19 = add nuw nsw i64 %indvars.iv.next.pre-phi.2, 1
  %arrayidx.3 = getelementptr inbounds float, float* %coefficient, i64 %19
  %20 = load float, float* %arrayidx.3, align 4, !tbaa !2
  %arrayidx8.phi.trans.insert.3 = getelementptr inbounds float, float* %coefficient, i64 %indvars.iv.next.pre-phi.2
  %.pre.3 = load float, float* %arrayidx8.phi.trans.insert.3, align 4, !tbaa !2
  br label %if.end.3

if.end.3:                                         ; preds = %if.then.3, %if.else.3
  %indvars.iv.next.pre-phi.3 = phi i64 [ %.pre26.3, %if.else.3 ], [ %19, %if.then.3 ]
  %21 = phi float [ %18, %if.else.3 ], [ %.pre.3, %if.then.3 ]
  %tmp.0.in.3 = phi float [ %mul.3, %if.else.3 ], [ %20, %if.then.3 ]
  %tmp.0.3 = fptosi float %tmp.0.in.3 to i32
  %arrayidx6.3 = getelementptr inbounds float, float* %input, i64 %indvars.iv.next.pre-phi.2
  %22 = load float, float* %arrayidx6.3, align 4, !tbaa !2
  %mul9.3 = fmul float %22, %21
  %conv10.3 = sitofp i32 %tmp.0.3 to float
  %add11.3 = fadd float %mul9.3, %conv10.3
  %23 = load float, float* %output, align 4, !tbaa !2
  %add14.3 = fadd float %23, %add11.3
  store float %add14.3, float* %output, align 4, !tbaa !2
  %exitcond.3 = icmp eq i64 %indvars.iv.next.pre-phi.3, 32
  br i1 %exitcond.3, label %for.end, label %for.body, !llvm.loop !8
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !7}
