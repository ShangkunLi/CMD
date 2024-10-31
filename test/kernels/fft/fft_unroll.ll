; ModuleID = 'fft_unroll.bc'
source_filename = "fft.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@data_real = common dso_local global [256 x float] zeroinitializer, align 16
@data_imag = common dso_local global [256 x float] zeroinitializer, align 16
@coef_real = common dso_local global [256 x float] zeroinitializer, align 16
@coef_imag = common dso_local global [256 x float] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %call = tail call i32 (float*, i32, i32, ...) bitcast (i32 (...)* @input_dsp to i32 (float*, i32, i32, ...)*)(float* getelementptr inbounds ([256 x float], [256 x float]* @data_real, i64 0, i64 0), i32 256, i32 0) #3
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.3, %for.body ]
  %arrayidx = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %indvars.iv
  store float 1.000000e+00, float* %arrayidx, align 4, !tbaa !2
  %arrayidx2 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %indvars.iv
  store float 2.000000e+00, float* %arrayidx2, align 4, !tbaa !2
  %arrayidx4 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %indvars.iv
  store float 2.000000e+00, float* %arrayidx4, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %indvars.iv.next
  store float 1.000000e+00, float* %arrayidx.1, align 4, !tbaa !2
  %arrayidx2.1 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %indvars.iv.next
  store float 2.000000e+00, float* %arrayidx2.1, align 4, !tbaa !2
  %arrayidx4.1 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %indvars.iv.next
  store float 2.000000e+00, float* %arrayidx4.1, align 4, !tbaa !2
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1
  %arrayidx.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %indvars.iv.next.1
  store float 1.000000e+00, float* %arrayidx.2, align 4, !tbaa !2
  %arrayidx2.2 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %indvars.iv.next.1
  store float 2.000000e+00, float* %arrayidx2.2, align 4, !tbaa !2
  %arrayidx4.2 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %indvars.iv.next.1
  store float 2.000000e+00, float* %arrayidx4.2, align 4, !tbaa !2
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1
  %arrayidx.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %indvars.iv.next.2
  store float 1.000000e+00, float* %arrayidx.3, align 4, !tbaa !2
  %arrayidx2.3 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %indvars.iv.next.2
  store float 2.000000e+00, float* %arrayidx2.3, align 4, !tbaa !2
  %arrayidx4.3 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %indvars.iv.next.2
  store float 2.000000e+00, float* %arrayidx4.3, align 4, !tbaa !2
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 256
  br i1 %exitcond.3, label %for.cond1.preheader.i.preheader, label %for.body, !llvm.loop !6

for.cond1.preheader.i.preheader:                  ; preds = %for.body
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i.preheader
  br i1 true, label %for.body3.us.preheader.i, label %for.end79.i

for.body3.us.preheader.i:                         ; preds = %for.cond1.preheader.i
  br label %for.body3.us.i

for.body3.us.i:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.i, %for.body3.us.preheader.i
  %indvars.iv162.i = phi i64 [ 0, %for.body3.us.preheader.i ], [ %indvars.iv.next163.i, %for.cond9.for.inc77_crit_edge.us.i ]
  %arrayidx.us.i = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %indvars.iv162.i
  %0 = load float, float* %arrayidx.us.i, align 4, !tbaa !2
  %arrayidx8.us.i = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %indvars.iv162.i
  %1 = load float, float* %arrayidx8.us.i, align 4, !tbaa !2
  %2 = shl nuw nsw i64 %indvars.iv162.i, 1
  %3 = mul nuw nsw i64 %2, 128
  %4 = trunc i64 %3 to i32
  %add13.us.i = add i32 128, %4
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa, label %for.body3.us.i.new

for.body3.us.i.new:                               ; preds = %for.body3.us.i
  br label %for.body11.us.i

for.body11.us.i:                                  ; preds = %for.body11.us.i, %for.body3.us.i.new
  %indvars.iv.i = phi i64 [ 0, %for.body3.us.i.new ], [ %indvars.iv.next.i.3, %for.body11.us.i ]
  %niter = phi i64 [ 128, %for.body3.us.i.new ], [ %niter.nsub.3, %for.body11.us.i ]
  %5 = trunc i64 %indvars.iv.i to i32
  %add14.us.i = add i32 %add13.us.i, %5
  %idxprom15.us.i = sext i32 %add14.us.i to i64
  %arrayidx16.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i
  %6 = load float, float* %arrayidx16.us.i, align 4, !tbaa !2
  %mul17.us.i = fmul float %0, %6
  %arrayidx23.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i
  %7 = load float, float* %arrayidx23.us.i, align 4, !tbaa !2
  %mul24.us.i = fmul float %1, %7
  %sub25.us.i = fsub float %mul17.us.i, %mul24.us.i
  %mul32.us.i = fmul float %1, %6
  %mul39.us.i = fmul float %0, %7
  %add40.us.i = fadd float %mul32.us.i, %mul39.us.i
  %8 = add nuw nsw i64 %indvars.iv.i, %3
  %arrayidx45.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %8
  %9 = load float, float* %arrayidx45.us.i, align 4, !tbaa !2
  %sub46.us.i = fsub float %9, %sub25.us.i
  store float %sub46.us.i, float* %arrayidx16.us.i, align 4, !tbaa !2
  %10 = load float, float* %arrayidx45.us.i, align 4, !tbaa !2
  %add58.us.i = fadd float %sub25.us.i, %10
  store float %add58.us.i, float* %arrayidx45.us.i, align 4, !tbaa !2
  %arrayidx63.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %8
  %11 = load float, float* %arrayidx63.us.i, align 4, !tbaa !2
  %sub64.us.i = fsub float %11, %add40.us.i
  store float %sub64.us.i, float* %arrayidx23.us.i, align 4, !tbaa !2
  %12 = load float, float* %arrayidx63.us.i, align 4, !tbaa !2
  %add76.us.i = fadd float %add40.us.i, %12
  store float %add76.us.i, float* %arrayidx63.us.i, align 4, !tbaa !2
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %niter.nsub = sub i64 %niter, 1
  %13 = trunc i64 %indvars.iv.next.i to i32
  %add14.us.i.1 = add i32 %add13.us.i, %13
  %idxprom15.us.i.1 = sext i32 %add14.us.i.1 to i64
  %arrayidx16.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1
  %14 = load float, float* %arrayidx16.us.i.1, align 4, !tbaa !2
  %mul17.us.i.1 = fmul float %0, %14
  %arrayidx23.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1
  %15 = load float, float* %arrayidx23.us.i.1, align 4, !tbaa !2
  %mul24.us.i.1 = fmul float %1, %15
  %sub25.us.i.1 = fsub float %mul17.us.i.1, %mul24.us.i.1
  %mul32.us.i.1 = fmul float %1, %14
  %mul39.us.i.1 = fmul float %0, %15
  %add40.us.i.1 = fadd float %mul32.us.i.1, %mul39.us.i.1
  %16 = add nuw nsw i64 %indvars.iv.next.i, %3
  %arrayidx45.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %16
  %17 = load float, float* %arrayidx45.us.i.1, align 4, !tbaa !2
  %sub46.us.i.1 = fsub float %17, %sub25.us.i.1
  store float %sub46.us.i.1, float* %arrayidx16.us.i.1, align 4, !tbaa !2
  %18 = load float, float* %arrayidx45.us.i.1, align 4, !tbaa !2
  %add58.us.i.1 = fadd float %sub25.us.i.1, %18
  store float %add58.us.i.1, float* %arrayidx45.us.i.1, align 4, !tbaa !2
  %arrayidx63.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %16
  %19 = load float, float* %arrayidx63.us.i.1, align 4, !tbaa !2
  %sub64.us.i.1 = fsub float %19, %add40.us.i.1
  store float %sub64.us.i.1, float* %arrayidx23.us.i.1, align 4, !tbaa !2
  %20 = load float, float* %arrayidx63.us.i.1, align 4, !tbaa !2
  %add76.us.i.1 = fadd float %add40.us.i.1, %20
  store float %add76.us.i.1, float* %arrayidx63.us.i.1, align 4, !tbaa !2
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.next.i, 1
  %niter.nsub.1 = sub i64 %niter.nsub, 1
  %21 = trunc i64 %indvars.iv.next.i.1 to i32
  %add14.us.i.2 = add i32 %add13.us.i, %21
  %idxprom15.us.i.2 = sext i32 %add14.us.i.2 to i64
  %arrayidx16.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2
  %22 = load float, float* %arrayidx16.us.i.2, align 4, !tbaa !2
  %mul17.us.i.2 = fmul float %0, %22
  %arrayidx23.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2
  %23 = load float, float* %arrayidx23.us.i.2, align 4, !tbaa !2
  %mul24.us.i.2 = fmul float %1, %23
  %sub25.us.i.2 = fsub float %mul17.us.i.2, %mul24.us.i.2
  %mul32.us.i.2 = fmul float %1, %22
  %mul39.us.i.2 = fmul float %0, %23
  %add40.us.i.2 = fadd float %mul32.us.i.2, %mul39.us.i.2
  %24 = add nuw nsw i64 %indvars.iv.next.i.1, %3
  %arrayidx45.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %24
  %25 = load float, float* %arrayidx45.us.i.2, align 4, !tbaa !2
  %sub46.us.i.2 = fsub float %25, %sub25.us.i.2
  store float %sub46.us.i.2, float* %arrayidx16.us.i.2, align 4, !tbaa !2
  %26 = load float, float* %arrayidx45.us.i.2, align 4, !tbaa !2
  %add58.us.i.2 = fadd float %sub25.us.i.2, %26
  store float %add58.us.i.2, float* %arrayidx45.us.i.2, align 4, !tbaa !2
  %arrayidx63.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %24
  %27 = load float, float* %arrayidx63.us.i.2, align 4, !tbaa !2
  %sub64.us.i.2 = fsub float %27, %add40.us.i.2
  store float %sub64.us.i.2, float* %arrayidx23.us.i.2, align 4, !tbaa !2
  %28 = load float, float* %arrayidx63.us.i.2, align 4, !tbaa !2
  %add76.us.i.2 = fadd float %add40.us.i.2, %28
  store float %add76.us.i.2, float* %arrayidx63.us.i.2, align 4, !tbaa !2
  %indvars.iv.next.i.2 = add nuw nsw i64 %indvars.iv.next.i.1, 1
  %niter.nsub.2 = sub i64 %niter.nsub.1, 1
  %29 = trunc i64 %indvars.iv.next.i.2 to i32
  %add14.us.i.3 = add i32 %add13.us.i, %29
  %idxprom15.us.i.3 = sext i32 %add14.us.i.3 to i64
  %arrayidx16.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3
  %30 = load float, float* %arrayidx16.us.i.3, align 4, !tbaa !2
  %mul17.us.i.3 = fmul float %0, %30
  %arrayidx23.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3
  %31 = load float, float* %arrayidx23.us.i.3, align 4, !tbaa !2
  %mul24.us.i.3 = fmul float %1, %31
  %sub25.us.i.3 = fsub float %mul17.us.i.3, %mul24.us.i.3
  %mul32.us.i.3 = fmul float %1, %30
  %mul39.us.i.3 = fmul float %0, %31
  %add40.us.i.3 = fadd float %mul32.us.i.3, %mul39.us.i.3
  %32 = add nuw nsw i64 %indvars.iv.next.i.2, %3
  %arrayidx45.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %32
  %33 = load float, float* %arrayidx45.us.i.3, align 4, !tbaa !2
  %sub46.us.i.3 = fsub float %33, %sub25.us.i.3
  store float %sub46.us.i.3, float* %arrayidx16.us.i.3, align 4, !tbaa !2
  %34 = load float, float* %arrayidx45.us.i.3, align 4, !tbaa !2
  %add58.us.i.3 = fadd float %sub25.us.i.3, %34
  store float %add58.us.i.3, float* %arrayidx45.us.i.3, align 4, !tbaa !2
  %arrayidx63.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %32
  %35 = load float, float* %arrayidx63.us.i.3, align 4, !tbaa !2
  %sub64.us.i.3 = fsub float %35, %add40.us.i.3
  store float %sub64.us.i.3, float* %arrayidx23.us.i.3, align 4, !tbaa !2
  %36 = load float, float* %arrayidx63.us.i.3, align 4, !tbaa !2
  %add76.us.i.3 = fadd float %add40.us.i.3, %36
  store float %add76.us.i.3, float* %arrayidx63.us.i.3, align 4, !tbaa !2
  %indvars.iv.next.i.3 = add nuw nsw i64 %indvars.iv.next.i.2, 1
  %niter.nsub.3 = sub i64 %niter.nsub.2, 1
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit, label %for.body11.us.i, !llvm.loop !8

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit: ; preds = %for.body11.us.i
  %indvars.iv.i.unr.ph = phi i64 [ %indvars.iv.next.i.3, %for.body11.us.i ]
  br label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa:     ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit, %for.body3.us.i
  %indvars.iv.i.unr = phi i64 [ 0, %for.body3.us.i ], [ %indvars.iv.i.unr.ph, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit ]
  br i1 false, label %for.body11.us.i.epil.preheader, label %for.cond9.for.inc77_crit_edge.us.i

for.body11.us.i.epil.preheader:                   ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa
  br label %for.body11.us.i.epil

for.body11.us.i.epil:                             ; preds = %for.body11.us.i.epil, %for.body11.us.i.epil.preheader
  %indvars.iv.i.epil = phi i64 [ %indvars.iv.i.unr, %for.body11.us.i.epil.preheader ], [ %indvars.iv.next.i.epil, %for.body11.us.i.epil ]
  %epil.iter = phi i64 [ 0, %for.body11.us.i.epil.preheader ], [ %epil.iter.sub, %for.body11.us.i.epil ]
  %37 = trunc i64 %indvars.iv.i.epil to i32
  %add14.us.i.epil = add i32 %add13.us.i, %37
  %idxprom15.us.i.epil = sext i32 %add14.us.i.epil to i64
  %arrayidx16.us.i.epil = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.epil
  %38 = load float, float* %arrayidx16.us.i.epil, align 4, !tbaa !2
  %mul17.us.i.epil = fmul float %0, %38
  %arrayidx23.us.i.epil = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.epil
  %39 = load float, float* %arrayidx23.us.i.epil, align 4, !tbaa !2
  %mul24.us.i.epil = fmul float %1, %39
  %sub25.us.i.epil = fsub float %mul17.us.i.epil, %mul24.us.i.epil
  %mul32.us.i.epil = fmul float %1, %38
  %mul39.us.i.epil = fmul float %0, %39
  %add40.us.i.epil = fadd float %mul32.us.i.epil, %mul39.us.i.epil
  %40 = add nuw nsw i64 %indvars.iv.i.epil, %3
  %arrayidx45.us.i.epil = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %40
  %41 = load float, float* %arrayidx45.us.i.epil, align 4, !tbaa !2
  %sub46.us.i.epil = fsub float %41, %sub25.us.i.epil
  store float %sub46.us.i.epil, float* %arrayidx16.us.i.epil, align 4, !tbaa !2
  %42 = load float, float* %arrayidx45.us.i.epil, align 4, !tbaa !2
  %add58.us.i.epil = fadd float %sub25.us.i.epil, %42
  store float %add58.us.i.epil, float* %arrayidx45.us.i.epil, align 4, !tbaa !2
  %arrayidx63.us.i.epil = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %40
  %43 = load float, float* %arrayidx63.us.i.epil, align 4, !tbaa !2
  %sub64.us.i.epil = fsub float %43, %add40.us.i.epil
  store float %sub64.us.i.epil, float* %arrayidx23.us.i.epil, align 4, !tbaa !2
  %44 = load float, float* %arrayidx63.us.i.epil, align 4, !tbaa !2
  %add76.us.i.epil = fadd float %add40.us.i.epil, %44
  store float %add76.us.i.epil, float* %arrayidx63.us.i.epil, align 4, !tbaa !2
  %indvars.iv.next.i.epil = add nuw nsw i64 %indvars.iv.i.epil, 1
  %epil.iter.sub = sub i64 %epil.iter, 1
  %epil.iter.cmp = icmp ne i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %for.body11.us.i.epil, label %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa, !llvm.loop !9

for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa:  ; preds = %for.body11.us.i.epil
  br label %for.cond9.for.inc77_crit_edge.us.i

for.cond9.for.inc77_crit_edge.us.i:               ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa, %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa
  %indvars.iv.next163.i = add nuw nsw i64 %indvars.iv162.i, 1
  %exitcond168.i = icmp eq i64 %indvars.iv.next163.i, 1
  br i1 %exitcond168.i, label %for.end79.i.loopexit, label %for.body3.us.i

for.end79.i.loopexit:                             ; preds = %for.cond9.for.inc77_crit_edge.us.i
  br label %for.end79.i

for.end79.i:                                      ; preds = %for.end79.i.loopexit, %for.cond1.preheader.i
  br i1 true, label %for.body3.us.preheader.i.1, label %for.end79.i.1

for.body3.us.preheader.i.1:                       ; preds = %for.end79.i
  br label %for.body3.us.i.1

for.body3.us.i.1:                                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.1, %for.body3.us.preheader.i.1
  %indvars.iv162.i.1 = phi i64 [ 0, %for.body3.us.preheader.i.1 ], [ %indvars.iv.next163.i.1, %for.cond9.for.inc77_crit_edge.us.i.1 ]
  %45 = add nsw i64 %indvars.iv162.i.1, 1
  %arrayidx.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %45
  %46 = load float, float* %arrayidx.us.i.1, align 4, !tbaa !2
  %arrayidx8.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %45
  %47 = load float, float* %arrayidx8.us.i.1, align 4, !tbaa !2
  %48 = shl nuw nsw i64 %indvars.iv162.i.1, 1
  %49 = mul nuw nsw i64 %48, 64
  %50 = trunc i64 %49 to i32
  %add13.us.i.1 = add i32 64, %50
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.1, label %for.body3.us.i.new.1

for.body3.us.i.new.1:                             ; preds = %for.body3.us.i.1
  br label %for.body11.us.i.1

for.body11.us.i.1:                                ; preds = %for.body11.us.i.1, %for.body3.us.i.new.1
  %indvars.iv.i.1 = phi i64 [ 0, %for.body3.us.i.new.1 ], [ %indvars.iv.next.i.3.1, %for.body11.us.i.1 ]
  %niter.1 = phi i64 [ 64, %for.body3.us.i.new.1 ], [ %niter.nsub.3.1, %for.body11.us.i.1 ]
  %51 = trunc i64 %indvars.iv.i.1 to i32
  %add14.us.i.11 = add i32 %add13.us.i.1, %51
  %idxprom15.us.i.12 = sext i32 %add14.us.i.11 to i64
  %arrayidx16.us.i.13 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.12
  %52 = load float, float* %arrayidx16.us.i.13, align 4, !tbaa !2
  %mul17.us.i.14 = fmul float %46, %52
  %arrayidx23.us.i.15 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.12
  %53 = load float, float* %arrayidx23.us.i.15, align 4, !tbaa !2
  %mul24.us.i.16 = fmul float %47, %53
  %sub25.us.i.17 = fsub float %mul17.us.i.14, %mul24.us.i.16
  %mul32.us.i.18 = fmul float %47, %52
  %mul39.us.i.19 = fmul float %46, %53
  %add40.us.i.110 = fadd float %mul32.us.i.18, %mul39.us.i.19
  %54 = add nuw nsw i64 %indvars.iv.i.1, %49
  %arrayidx45.us.i.111 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %54
  %55 = load float, float* %arrayidx45.us.i.111, align 4, !tbaa !2
  %sub46.us.i.112 = fsub float %55, %sub25.us.i.17
  store float %sub46.us.i.112, float* %arrayidx16.us.i.13, align 4, !tbaa !2
  %56 = load float, float* %arrayidx45.us.i.111, align 4, !tbaa !2
  %add58.us.i.113 = fadd float %sub25.us.i.17, %56
  store float %add58.us.i.113, float* %arrayidx45.us.i.111, align 4, !tbaa !2
  %arrayidx63.us.i.114 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %54
  %57 = load float, float* %arrayidx63.us.i.114, align 4, !tbaa !2
  %sub64.us.i.115 = fsub float %57, %add40.us.i.110
  store float %sub64.us.i.115, float* %arrayidx23.us.i.15, align 4, !tbaa !2
  %58 = load float, float* %arrayidx63.us.i.114, align 4, !tbaa !2
  %add76.us.i.116 = fadd float %add40.us.i.110, %58
  store float %add76.us.i.116, float* %arrayidx63.us.i.114, align 4, !tbaa !2
  %indvars.iv.next.i.117 = add nuw nsw i64 %indvars.iv.i.1, 1
  %niter.nsub.118 = sub i64 %niter.1, 1
  %59 = trunc i64 %indvars.iv.next.i.117 to i32
  %add14.us.i.1.1 = add i32 %add13.us.i.1, %59
  %idxprom15.us.i.1.1 = sext i32 %add14.us.i.1.1 to i64
  %arrayidx16.us.i.1.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.1
  %60 = load float, float* %arrayidx16.us.i.1.1, align 4, !tbaa !2
  %mul17.us.i.1.1 = fmul float %46, %60
  %arrayidx23.us.i.1.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.1
  %61 = load float, float* %arrayidx23.us.i.1.1, align 4, !tbaa !2
  %mul24.us.i.1.1 = fmul float %47, %61
  %sub25.us.i.1.1 = fsub float %mul17.us.i.1.1, %mul24.us.i.1.1
  %mul32.us.i.1.1 = fmul float %47, %60
  %mul39.us.i.1.1 = fmul float %46, %61
  %add40.us.i.1.1 = fadd float %mul32.us.i.1.1, %mul39.us.i.1.1
  %62 = add nuw nsw i64 %indvars.iv.next.i.117, %49
  %arrayidx45.us.i.1.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %62
  %63 = load float, float* %arrayidx45.us.i.1.1, align 4, !tbaa !2
  %sub46.us.i.1.1 = fsub float %63, %sub25.us.i.1.1
  store float %sub46.us.i.1.1, float* %arrayidx16.us.i.1.1, align 4, !tbaa !2
  %64 = load float, float* %arrayidx45.us.i.1.1, align 4, !tbaa !2
  %add58.us.i.1.1 = fadd float %sub25.us.i.1.1, %64
  store float %add58.us.i.1.1, float* %arrayidx45.us.i.1.1, align 4, !tbaa !2
  %arrayidx63.us.i.1.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %62
  %65 = load float, float* %arrayidx63.us.i.1.1, align 4, !tbaa !2
  %sub64.us.i.1.1 = fsub float %65, %add40.us.i.1.1
  store float %sub64.us.i.1.1, float* %arrayidx23.us.i.1.1, align 4, !tbaa !2
  %66 = load float, float* %arrayidx63.us.i.1.1, align 4, !tbaa !2
  %add76.us.i.1.1 = fadd float %add40.us.i.1.1, %66
  store float %add76.us.i.1.1, float* %arrayidx63.us.i.1.1, align 4, !tbaa !2
  %indvars.iv.next.i.1.1 = add nuw nsw i64 %indvars.iv.next.i.117, 1
  %niter.nsub.1.1 = sub i64 %niter.nsub.118, 1
  %67 = trunc i64 %indvars.iv.next.i.1.1 to i32
  %add14.us.i.2.1 = add i32 %add13.us.i.1, %67
  %idxprom15.us.i.2.1 = sext i32 %add14.us.i.2.1 to i64
  %arrayidx16.us.i.2.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.1
  %68 = load float, float* %arrayidx16.us.i.2.1, align 4, !tbaa !2
  %mul17.us.i.2.1 = fmul float %46, %68
  %arrayidx23.us.i.2.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.1
  %69 = load float, float* %arrayidx23.us.i.2.1, align 4, !tbaa !2
  %mul24.us.i.2.1 = fmul float %47, %69
  %sub25.us.i.2.1 = fsub float %mul17.us.i.2.1, %mul24.us.i.2.1
  %mul32.us.i.2.1 = fmul float %47, %68
  %mul39.us.i.2.1 = fmul float %46, %69
  %add40.us.i.2.1 = fadd float %mul32.us.i.2.1, %mul39.us.i.2.1
  %70 = add nuw nsw i64 %indvars.iv.next.i.1.1, %49
  %arrayidx45.us.i.2.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %70
  %71 = load float, float* %arrayidx45.us.i.2.1, align 4, !tbaa !2
  %sub46.us.i.2.1 = fsub float %71, %sub25.us.i.2.1
  store float %sub46.us.i.2.1, float* %arrayidx16.us.i.2.1, align 4, !tbaa !2
  %72 = load float, float* %arrayidx45.us.i.2.1, align 4, !tbaa !2
  %add58.us.i.2.1 = fadd float %sub25.us.i.2.1, %72
  store float %add58.us.i.2.1, float* %arrayidx45.us.i.2.1, align 4, !tbaa !2
  %arrayidx63.us.i.2.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %70
  %73 = load float, float* %arrayidx63.us.i.2.1, align 4, !tbaa !2
  %sub64.us.i.2.1 = fsub float %73, %add40.us.i.2.1
  store float %sub64.us.i.2.1, float* %arrayidx23.us.i.2.1, align 4, !tbaa !2
  %74 = load float, float* %arrayidx63.us.i.2.1, align 4, !tbaa !2
  %add76.us.i.2.1 = fadd float %add40.us.i.2.1, %74
  store float %add76.us.i.2.1, float* %arrayidx63.us.i.2.1, align 4, !tbaa !2
  %indvars.iv.next.i.2.1 = add nuw nsw i64 %indvars.iv.next.i.1.1, 1
  %niter.nsub.2.1 = sub i64 %niter.nsub.1.1, 1
  %75 = trunc i64 %indvars.iv.next.i.2.1 to i32
  %add14.us.i.3.1 = add i32 %add13.us.i.1, %75
  %idxprom15.us.i.3.1 = sext i32 %add14.us.i.3.1 to i64
  %arrayidx16.us.i.3.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.1
  %76 = load float, float* %arrayidx16.us.i.3.1, align 4, !tbaa !2
  %mul17.us.i.3.1 = fmul float %46, %76
  %arrayidx23.us.i.3.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.1
  %77 = load float, float* %arrayidx23.us.i.3.1, align 4, !tbaa !2
  %mul24.us.i.3.1 = fmul float %47, %77
  %sub25.us.i.3.1 = fsub float %mul17.us.i.3.1, %mul24.us.i.3.1
  %mul32.us.i.3.1 = fmul float %47, %76
  %mul39.us.i.3.1 = fmul float %46, %77
  %add40.us.i.3.1 = fadd float %mul32.us.i.3.1, %mul39.us.i.3.1
  %78 = add nuw nsw i64 %indvars.iv.next.i.2.1, %49
  %arrayidx45.us.i.3.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %78
  %79 = load float, float* %arrayidx45.us.i.3.1, align 4, !tbaa !2
  %sub46.us.i.3.1 = fsub float %79, %sub25.us.i.3.1
  store float %sub46.us.i.3.1, float* %arrayidx16.us.i.3.1, align 4, !tbaa !2
  %80 = load float, float* %arrayidx45.us.i.3.1, align 4, !tbaa !2
  %add58.us.i.3.1 = fadd float %sub25.us.i.3.1, %80
  store float %add58.us.i.3.1, float* %arrayidx45.us.i.3.1, align 4, !tbaa !2
  %arrayidx63.us.i.3.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %78
  %81 = load float, float* %arrayidx63.us.i.3.1, align 4, !tbaa !2
  %sub64.us.i.3.1 = fsub float %81, %add40.us.i.3.1
  store float %sub64.us.i.3.1, float* %arrayidx23.us.i.3.1, align 4, !tbaa !2
  %82 = load float, float* %arrayidx63.us.i.3.1, align 4, !tbaa !2
  %add76.us.i.3.1 = fadd float %add40.us.i.3.1, %82
  store float %add76.us.i.3.1, float* %arrayidx63.us.i.3.1, align 4, !tbaa !2
  %indvars.iv.next.i.3.1 = add nuw nsw i64 %indvars.iv.next.i.2.1, 1
  %niter.nsub.3.1 = sub i64 %niter.nsub.2.1, 1
  %niter.ncmp.3.1 = icmp eq i64 %niter.nsub.3.1, 0
  br i1 %niter.ncmp.3.1, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.1, label %for.body11.us.i.1, !llvm.loop !8

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.1: ; preds = %for.body11.us.i.1
  %indvars.iv.i.unr.ph.1 = phi i64 [ %indvars.iv.next.i.3.1, %for.body11.us.i.1 ]
  br label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.1

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.1:   ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.1, %for.body3.us.i.1
  %indvars.iv.i.unr.1 = phi i64 [ 0, %for.body3.us.i.1 ], [ %indvars.iv.i.unr.ph.1, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.1 ]
  br i1 false, label %for.body11.us.i.epil.preheader.1, label %for.cond9.for.inc77_crit_edge.us.i.1

for.body11.us.i.epil.preheader.1:                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.1
  br label %for.body11.us.i.epil.1

for.body11.us.i.epil.1:                           ; preds = %for.body11.us.i.epil.1, %for.body11.us.i.epil.preheader.1
  %indvars.iv.i.epil.1 = phi i64 [ %indvars.iv.i.unr.1, %for.body11.us.i.epil.preheader.1 ], [ %indvars.iv.next.i.epil.1, %for.body11.us.i.epil.1 ]
  %epil.iter.1 = phi i64 [ 0, %for.body11.us.i.epil.preheader.1 ], [ %epil.iter.sub.1, %for.body11.us.i.epil.1 ]
  %83 = trunc i64 %indvars.iv.i.epil.1 to i32
  %add14.us.i.epil.1 = add i32 %add13.us.i.1, %83
  %idxprom15.us.i.epil.1 = sext i32 %add14.us.i.epil.1 to i64
  %arrayidx16.us.i.epil.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.epil.1
  %84 = load float, float* %arrayidx16.us.i.epil.1, align 4, !tbaa !2
  %mul17.us.i.epil.1 = fmul float %46, %84
  %arrayidx23.us.i.epil.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.epil.1
  %85 = load float, float* %arrayidx23.us.i.epil.1, align 4, !tbaa !2
  %mul24.us.i.epil.1 = fmul float %47, %85
  %sub25.us.i.epil.1 = fsub float %mul17.us.i.epil.1, %mul24.us.i.epil.1
  %mul32.us.i.epil.1 = fmul float %47, %84
  %mul39.us.i.epil.1 = fmul float %46, %85
  %add40.us.i.epil.1 = fadd float %mul32.us.i.epil.1, %mul39.us.i.epil.1
  %86 = add nuw nsw i64 %indvars.iv.i.epil.1, %49
  %arrayidx45.us.i.epil.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %86
  %87 = load float, float* %arrayidx45.us.i.epil.1, align 4, !tbaa !2
  %sub46.us.i.epil.1 = fsub float %87, %sub25.us.i.epil.1
  store float %sub46.us.i.epil.1, float* %arrayidx16.us.i.epil.1, align 4, !tbaa !2
  %88 = load float, float* %arrayidx45.us.i.epil.1, align 4, !tbaa !2
  %add58.us.i.epil.1 = fadd float %sub25.us.i.epil.1, %88
  store float %add58.us.i.epil.1, float* %arrayidx45.us.i.epil.1, align 4, !tbaa !2
  %arrayidx63.us.i.epil.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %86
  %89 = load float, float* %arrayidx63.us.i.epil.1, align 4, !tbaa !2
  %sub64.us.i.epil.1 = fsub float %89, %add40.us.i.epil.1
  store float %sub64.us.i.epil.1, float* %arrayidx23.us.i.epil.1, align 4, !tbaa !2
  %90 = load float, float* %arrayidx63.us.i.epil.1, align 4, !tbaa !2
  %add76.us.i.epil.1 = fadd float %add40.us.i.epil.1, %90
  store float %add76.us.i.epil.1, float* %arrayidx63.us.i.epil.1, align 4, !tbaa !2
  %indvars.iv.next.i.epil.1 = add nuw nsw i64 %indvars.iv.i.epil.1, 1
  %epil.iter.sub.1 = sub i64 %epil.iter.1, 1
  %epil.iter.cmp.1 = icmp ne i64 %epil.iter.sub.1, 0
  br i1 %epil.iter.cmp.1, label %for.body11.us.i.epil.1, label %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.1, !llvm.loop !9

for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.1: ; preds = %for.body11.us.i.epil.1
  br label %for.cond9.for.inc77_crit_edge.us.i.1

for.cond9.for.inc77_crit_edge.us.i.1:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.1, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.1
  %indvars.iv.next163.i.1 = add nuw nsw i64 %indvars.iv162.i.1, 1
  %exitcond168.i.1 = icmp eq i64 %indvars.iv.next163.i.1, 2
  br i1 %exitcond168.i.1, label %for.end79.i.loopexit.1, label %for.body3.us.i.1

for.end79.i.loopexit.1:                           ; preds = %for.cond9.for.inc77_crit_edge.us.i.1
  br label %for.end79.i.1

for.end79.i.1:                                    ; preds = %for.end79.i.loopexit.1, %for.end79.i
  br i1 true, label %for.body3.us.preheader.i.2, label %for.end79.i.2

for.body3.us.preheader.i.2:                       ; preds = %for.end79.i.1
  br label %for.body3.us.i.2

for.body3.us.i.2:                                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.2, %for.body3.us.preheader.i.2
  %indvars.iv162.i.2 = phi i64 [ 0, %for.body3.us.preheader.i.2 ], [ %indvars.iv.next163.i.2, %for.cond9.for.inc77_crit_edge.us.i.2 ]
  %91 = add nsw i64 %indvars.iv162.i.2, 3
  %arrayidx.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %91
  %92 = load float, float* %arrayidx.us.i.2, align 4, !tbaa !2
  %arrayidx8.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %91
  %93 = load float, float* %arrayidx8.us.i.2, align 4, !tbaa !2
  %94 = shl nuw nsw i64 %indvars.iv162.i.2, 1
  %95 = mul nuw nsw i64 %94, 32
  %96 = trunc i64 %95 to i32
  %add13.us.i.2 = add i32 32, %96
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.2, label %for.body3.us.i.new.2

for.body3.us.i.new.2:                             ; preds = %for.body3.us.i.2
  br label %for.body11.us.i.2

for.body11.us.i.2:                                ; preds = %for.body11.us.i.2, %for.body3.us.i.new.2
  %indvars.iv.i.2 = phi i64 [ 0, %for.body3.us.i.new.2 ], [ %indvars.iv.next.i.3.2, %for.body11.us.i.2 ]
  %niter.2 = phi i64 [ 32, %for.body3.us.i.new.2 ], [ %niter.nsub.3.2, %for.body11.us.i.2 ]
  %97 = trunc i64 %indvars.iv.i.2 to i32
  %add14.us.i.219 = add i32 %add13.us.i.2, %97
  %idxprom15.us.i.220 = sext i32 %add14.us.i.219 to i64
  %arrayidx16.us.i.221 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.220
  %98 = load float, float* %arrayidx16.us.i.221, align 4, !tbaa !2
  %mul17.us.i.222 = fmul float %92, %98
  %arrayidx23.us.i.223 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.220
  %99 = load float, float* %arrayidx23.us.i.223, align 4, !tbaa !2
  %mul24.us.i.224 = fmul float %93, %99
  %sub25.us.i.225 = fsub float %mul17.us.i.222, %mul24.us.i.224
  %mul32.us.i.226 = fmul float %93, %98
  %mul39.us.i.227 = fmul float %92, %99
  %add40.us.i.228 = fadd float %mul32.us.i.226, %mul39.us.i.227
  %100 = add nuw nsw i64 %indvars.iv.i.2, %95
  %arrayidx45.us.i.229 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %100
  %101 = load float, float* %arrayidx45.us.i.229, align 4, !tbaa !2
  %sub46.us.i.230 = fsub float %101, %sub25.us.i.225
  store float %sub46.us.i.230, float* %arrayidx16.us.i.221, align 4, !tbaa !2
  %102 = load float, float* %arrayidx45.us.i.229, align 4, !tbaa !2
  %add58.us.i.231 = fadd float %sub25.us.i.225, %102
  store float %add58.us.i.231, float* %arrayidx45.us.i.229, align 4, !tbaa !2
  %arrayidx63.us.i.232 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %100
  %103 = load float, float* %arrayidx63.us.i.232, align 4, !tbaa !2
  %sub64.us.i.233 = fsub float %103, %add40.us.i.228
  store float %sub64.us.i.233, float* %arrayidx23.us.i.223, align 4, !tbaa !2
  %104 = load float, float* %arrayidx63.us.i.232, align 4, !tbaa !2
  %add76.us.i.234 = fadd float %add40.us.i.228, %104
  store float %add76.us.i.234, float* %arrayidx63.us.i.232, align 4, !tbaa !2
  %indvars.iv.next.i.235 = add nuw nsw i64 %indvars.iv.i.2, 1
  %niter.nsub.236 = sub i64 %niter.2, 1
  %105 = trunc i64 %indvars.iv.next.i.235 to i32
  %add14.us.i.1.2 = add i32 %add13.us.i.2, %105
  %idxprom15.us.i.1.2 = sext i32 %add14.us.i.1.2 to i64
  %arrayidx16.us.i.1.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.2
  %106 = load float, float* %arrayidx16.us.i.1.2, align 4, !tbaa !2
  %mul17.us.i.1.2 = fmul float %92, %106
  %arrayidx23.us.i.1.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.2
  %107 = load float, float* %arrayidx23.us.i.1.2, align 4, !tbaa !2
  %mul24.us.i.1.2 = fmul float %93, %107
  %sub25.us.i.1.2 = fsub float %mul17.us.i.1.2, %mul24.us.i.1.2
  %mul32.us.i.1.2 = fmul float %93, %106
  %mul39.us.i.1.2 = fmul float %92, %107
  %add40.us.i.1.2 = fadd float %mul32.us.i.1.2, %mul39.us.i.1.2
  %108 = add nuw nsw i64 %indvars.iv.next.i.235, %95
  %arrayidx45.us.i.1.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %108
  %109 = load float, float* %arrayidx45.us.i.1.2, align 4, !tbaa !2
  %sub46.us.i.1.2 = fsub float %109, %sub25.us.i.1.2
  store float %sub46.us.i.1.2, float* %arrayidx16.us.i.1.2, align 4, !tbaa !2
  %110 = load float, float* %arrayidx45.us.i.1.2, align 4, !tbaa !2
  %add58.us.i.1.2 = fadd float %sub25.us.i.1.2, %110
  store float %add58.us.i.1.2, float* %arrayidx45.us.i.1.2, align 4, !tbaa !2
  %arrayidx63.us.i.1.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %108
  %111 = load float, float* %arrayidx63.us.i.1.2, align 4, !tbaa !2
  %sub64.us.i.1.2 = fsub float %111, %add40.us.i.1.2
  store float %sub64.us.i.1.2, float* %arrayidx23.us.i.1.2, align 4, !tbaa !2
  %112 = load float, float* %arrayidx63.us.i.1.2, align 4, !tbaa !2
  %add76.us.i.1.2 = fadd float %add40.us.i.1.2, %112
  store float %add76.us.i.1.2, float* %arrayidx63.us.i.1.2, align 4, !tbaa !2
  %indvars.iv.next.i.1.2 = add nuw nsw i64 %indvars.iv.next.i.235, 1
  %niter.nsub.1.2 = sub i64 %niter.nsub.236, 1
  %113 = trunc i64 %indvars.iv.next.i.1.2 to i32
  %add14.us.i.2.2 = add i32 %add13.us.i.2, %113
  %idxprom15.us.i.2.2 = sext i32 %add14.us.i.2.2 to i64
  %arrayidx16.us.i.2.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.2
  %114 = load float, float* %arrayidx16.us.i.2.2, align 4, !tbaa !2
  %mul17.us.i.2.2 = fmul float %92, %114
  %arrayidx23.us.i.2.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.2
  %115 = load float, float* %arrayidx23.us.i.2.2, align 4, !tbaa !2
  %mul24.us.i.2.2 = fmul float %93, %115
  %sub25.us.i.2.2 = fsub float %mul17.us.i.2.2, %mul24.us.i.2.2
  %mul32.us.i.2.2 = fmul float %93, %114
  %mul39.us.i.2.2 = fmul float %92, %115
  %add40.us.i.2.2 = fadd float %mul32.us.i.2.2, %mul39.us.i.2.2
  %116 = add nuw nsw i64 %indvars.iv.next.i.1.2, %95
  %arrayidx45.us.i.2.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %116
  %117 = load float, float* %arrayidx45.us.i.2.2, align 4, !tbaa !2
  %sub46.us.i.2.2 = fsub float %117, %sub25.us.i.2.2
  store float %sub46.us.i.2.2, float* %arrayidx16.us.i.2.2, align 4, !tbaa !2
  %118 = load float, float* %arrayidx45.us.i.2.2, align 4, !tbaa !2
  %add58.us.i.2.2 = fadd float %sub25.us.i.2.2, %118
  store float %add58.us.i.2.2, float* %arrayidx45.us.i.2.2, align 4, !tbaa !2
  %arrayidx63.us.i.2.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %116
  %119 = load float, float* %arrayidx63.us.i.2.2, align 4, !tbaa !2
  %sub64.us.i.2.2 = fsub float %119, %add40.us.i.2.2
  store float %sub64.us.i.2.2, float* %arrayidx23.us.i.2.2, align 4, !tbaa !2
  %120 = load float, float* %arrayidx63.us.i.2.2, align 4, !tbaa !2
  %add76.us.i.2.2 = fadd float %add40.us.i.2.2, %120
  store float %add76.us.i.2.2, float* %arrayidx63.us.i.2.2, align 4, !tbaa !2
  %indvars.iv.next.i.2.2 = add nuw nsw i64 %indvars.iv.next.i.1.2, 1
  %niter.nsub.2.2 = sub i64 %niter.nsub.1.2, 1
  %121 = trunc i64 %indvars.iv.next.i.2.2 to i32
  %add14.us.i.3.2 = add i32 %add13.us.i.2, %121
  %idxprom15.us.i.3.2 = sext i32 %add14.us.i.3.2 to i64
  %arrayidx16.us.i.3.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.2
  %122 = load float, float* %arrayidx16.us.i.3.2, align 4, !tbaa !2
  %mul17.us.i.3.2 = fmul float %92, %122
  %arrayidx23.us.i.3.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.2
  %123 = load float, float* %arrayidx23.us.i.3.2, align 4, !tbaa !2
  %mul24.us.i.3.2 = fmul float %93, %123
  %sub25.us.i.3.2 = fsub float %mul17.us.i.3.2, %mul24.us.i.3.2
  %mul32.us.i.3.2 = fmul float %93, %122
  %mul39.us.i.3.2 = fmul float %92, %123
  %add40.us.i.3.2 = fadd float %mul32.us.i.3.2, %mul39.us.i.3.2
  %124 = add nuw nsw i64 %indvars.iv.next.i.2.2, %95
  %arrayidx45.us.i.3.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %124
  %125 = load float, float* %arrayidx45.us.i.3.2, align 4, !tbaa !2
  %sub46.us.i.3.2 = fsub float %125, %sub25.us.i.3.2
  store float %sub46.us.i.3.2, float* %arrayidx16.us.i.3.2, align 4, !tbaa !2
  %126 = load float, float* %arrayidx45.us.i.3.2, align 4, !tbaa !2
  %add58.us.i.3.2 = fadd float %sub25.us.i.3.2, %126
  store float %add58.us.i.3.2, float* %arrayidx45.us.i.3.2, align 4, !tbaa !2
  %arrayidx63.us.i.3.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %124
  %127 = load float, float* %arrayidx63.us.i.3.2, align 4, !tbaa !2
  %sub64.us.i.3.2 = fsub float %127, %add40.us.i.3.2
  store float %sub64.us.i.3.2, float* %arrayidx23.us.i.3.2, align 4, !tbaa !2
  %128 = load float, float* %arrayidx63.us.i.3.2, align 4, !tbaa !2
  %add76.us.i.3.2 = fadd float %add40.us.i.3.2, %128
  store float %add76.us.i.3.2, float* %arrayidx63.us.i.3.2, align 4, !tbaa !2
  %indvars.iv.next.i.3.2 = add nuw nsw i64 %indvars.iv.next.i.2.2, 1
  %niter.nsub.3.2 = sub i64 %niter.nsub.2.2, 1
  %niter.ncmp.3.2 = icmp eq i64 %niter.nsub.3.2, 0
  br i1 %niter.ncmp.3.2, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.2, label %for.body11.us.i.2, !llvm.loop !8

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.2: ; preds = %for.body11.us.i.2
  %indvars.iv.i.unr.ph.2 = phi i64 [ %indvars.iv.next.i.3.2, %for.body11.us.i.2 ]
  br label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.2

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.2:   ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.2, %for.body3.us.i.2
  %indvars.iv.i.unr.2 = phi i64 [ 0, %for.body3.us.i.2 ], [ %indvars.iv.i.unr.ph.2, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.2 ]
  br i1 false, label %for.body11.us.i.epil.preheader.2, label %for.cond9.for.inc77_crit_edge.us.i.2

for.body11.us.i.epil.preheader.2:                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.2
  br label %for.body11.us.i.epil.2

for.body11.us.i.epil.2:                           ; preds = %for.body11.us.i.epil.2, %for.body11.us.i.epil.preheader.2
  %indvars.iv.i.epil.2 = phi i64 [ %indvars.iv.i.unr.2, %for.body11.us.i.epil.preheader.2 ], [ %indvars.iv.next.i.epil.2, %for.body11.us.i.epil.2 ]
  %epil.iter.2 = phi i64 [ 0, %for.body11.us.i.epil.preheader.2 ], [ %epil.iter.sub.2, %for.body11.us.i.epil.2 ]
  %129 = trunc i64 %indvars.iv.i.epil.2 to i32
  %add14.us.i.epil.2 = add i32 %add13.us.i.2, %129
  %idxprom15.us.i.epil.2 = sext i32 %add14.us.i.epil.2 to i64
  %arrayidx16.us.i.epil.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.epil.2
  %130 = load float, float* %arrayidx16.us.i.epil.2, align 4, !tbaa !2
  %mul17.us.i.epil.2 = fmul float %92, %130
  %arrayidx23.us.i.epil.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.epil.2
  %131 = load float, float* %arrayidx23.us.i.epil.2, align 4, !tbaa !2
  %mul24.us.i.epil.2 = fmul float %93, %131
  %sub25.us.i.epil.2 = fsub float %mul17.us.i.epil.2, %mul24.us.i.epil.2
  %mul32.us.i.epil.2 = fmul float %93, %130
  %mul39.us.i.epil.2 = fmul float %92, %131
  %add40.us.i.epil.2 = fadd float %mul32.us.i.epil.2, %mul39.us.i.epil.2
  %132 = add nuw nsw i64 %indvars.iv.i.epil.2, %95
  %arrayidx45.us.i.epil.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %132
  %133 = load float, float* %arrayidx45.us.i.epil.2, align 4, !tbaa !2
  %sub46.us.i.epil.2 = fsub float %133, %sub25.us.i.epil.2
  store float %sub46.us.i.epil.2, float* %arrayidx16.us.i.epil.2, align 4, !tbaa !2
  %134 = load float, float* %arrayidx45.us.i.epil.2, align 4, !tbaa !2
  %add58.us.i.epil.2 = fadd float %sub25.us.i.epil.2, %134
  store float %add58.us.i.epil.2, float* %arrayidx45.us.i.epil.2, align 4, !tbaa !2
  %arrayidx63.us.i.epil.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %132
  %135 = load float, float* %arrayidx63.us.i.epil.2, align 4, !tbaa !2
  %sub64.us.i.epil.2 = fsub float %135, %add40.us.i.epil.2
  store float %sub64.us.i.epil.2, float* %arrayidx23.us.i.epil.2, align 4, !tbaa !2
  %136 = load float, float* %arrayidx63.us.i.epil.2, align 4, !tbaa !2
  %add76.us.i.epil.2 = fadd float %add40.us.i.epil.2, %136
  store float %add76.us.i.epil.2, float* %arrayidx63.us.i.epil.2, align 4, !tbaa !2
  %indvars.iv.next.i.epil.2 = add nuw nsw i64 %indvars.iv.i.epil.2, 1
  %epil.iter.sub.2 = sub i64 %epil.iter.2, 1
  %epil.iter.cmp.2 = icmp ne i64 %epil.iter.sub.2, 0
  br i1 %epil.iter.cmp.2, label %for.body11.us.i.epil.2, label %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.2, !llvm.loop !9

for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.2: ; preds = %for.body11.us.i.epil.2
  br label %for.cond9.for.inc77_crit_edge.us.i.2

for.cond9.for.inc77_crit_edge.us.i.2:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.2, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.2
  %indvars.iv.next163.i.2 = add nuw nsw i64 %indvars.iv162.i.2, 1
  %exitcond168.i.2 = icmp eq i64 %indvars.iv.next163.i.2, 4
  br i1 %exitcond168.i.2, label %for.end79.i.loopexit.2, label %for.body3.us.i.2

for.end79.i.loopexit.2:                           ; preds = %for.cond9.for.inc77_crit_edge.us.i.2
  br label %for.end79.i.2

for.end79.i.2:                                    ; preds = %for.end79.i.loopexit.2, %for.end79.i.1
  br i1 true, label %for.body3.us.preheader.i.3, label %for.end79.i.3

for.body3.us.preheader.i.3:                       ; preds = %for.end79.i.2
  br label %for.body3.us.i.3

for.body3.us.i.3:                                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.3, %for.body3.us.preheader.i.3
  %indvars.iv162.i.3 = phi i64 [ 0, %for.body3.us.preheader.i.3 ], [ %indvars.iv.next163.i.3, %for.cond9.for.inc77_crit_edge.us.i.3 ]
  %137 = add nsw i64 %indvars.iv162.i.3, 7
  %arrayidx.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %137
  %138 = load float, float* %arrayidx.us.i.3, align 4, !tbaa !2
  %arrayidx8.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %137
  %139 = load float, float* %arrayidx8.us.i.3, align 4, !tbaa !2
  %140 = shl nuw nsw i64 %indvars.iv162.i.3, 1
  %141 = mul nuw nsw i64 %140, 16
  %142 = trunc i64 %141 to i32
  %add13.us.i.3 = add i32 16, %142
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.3, label %for.body3.us.i.new.3

for.body3.us.i.new.3:                             ; preds = %for.body3.us.i.3
  br label %for.body11.us.i.3

for.body11.us.i.3:                                ; preds = %for.body11.us.i.3, %for.body3.us.i.new.3
  %indvars.iv.i.3 = phi i64 [ 0, %for.body3.us.i.new.3 ], [ %indvars.iv.next.i.3.3, %for.body11.us.i.3 ]
  %niter.3 = phi i64 [ 16, %for.body3.us.i.new.3 ], [ %niter.nsub.3.3, %for.body11.us.i.3 ]
  %143 = trunc i64 %indvars.iv.i.3 to i32
  %add14.us.i.337 = add i32 %add13.us.i.3, %143
  %idxprom15.us.i.338 = sext i32 %add14.us.i.337 to i64
  %arrayidx16.us.i.339 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.338
  %144 = load float, float* %arrayidx16.us.i.339, align 4, !tbaa !2
  %mul17.us.i.340 = fmul float %138, %144
  %arrayidx23.us.i.341 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.338
  %145 = load float, float* %arrayidx23.us.i.341, align 4, !tbaa !2
  %mul24.us.i.342 = fmul float %139, %145
  %sub25.us.i.343 = fsub float %mul17.us.i.340, %mul24.us.i.342
  %mul32.us.i.344 = fmul float %139, %144
  %mul39.us.i.345 = fmul float %138, %145
  %add40.us.i.346 = fadd float %mul32.us.i.344, %mul39.us.i.345
  %146 = add nuw nsw i64 %indvars.iv.i.3, %141
  %arrayidx45.us.i.347 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %146
  %147 = load float, float* %arrayidx45.us.i.347, align 4, !tbaa !2
  %sub46.us.i.348 = fsub float %147, %sub25.us.i.343
  store float %sub46.us.i.348, float* %arrayidx16.us.i.339, align 4, !tbaa !2
  %148 = load float, float* %arrayidx45.us.i.347, align 4, !tbaa !2
  %add58.us.i.349 = fadd float %sub25.us.i.343, %148
  store float %add58.us.i.349, float* %arrayidx45.us.i.347, align 4, !tbaa !2
  %arrayidx63.us.i.350 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %146
  %149 = load float, float* %arrayidx63.us.i.350, align 4, !tbaa !2
  %sub64.us.i.351 = fsub float %149, %add40.us.i.346
  store float %sub64.us.i.351, float* %arrayidx23.us.i.341, align 4, !tbaa !2
  %150 = load float, float* %arrayidx63.us.i.350, align 4, !tbaa !2
  %add76.us.i.352 = fadd float %add40.us.i.346, %150
  store float %add76.us.i.352, float* %arrayidx63.us.i.350, align 4, !tbaa !2
  %indvars.iv.next.i.353 = add nuw nsw i64 %indvars.iv.i.3, 1
  %niter.nsub.354 = sub i64 %niter.3, 1
  %151 = trunc i64 %indvars.iv.next.i.353 to i32
  %add14.us.i.1.3 = add i32 %add13.us.i.3, %151
  %idxprom15.us.i.1.3 = sext i32 %add14.us.i.1.3 to i64
  %arrayidx16.us.i.1.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.3
  %152 = load float, float* %arrayidx16.us.i.1.3, align 4, !tbaa !2
  %mul17.us.i.1.3 = fmul float %138, %152
  %arrayidx23.us.i.1.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.3
  %153 = load float, float* %arrayidx23.us.i.1.3, align 4, !tbaa !2
  %mul24.us.i.1.3 = fmul float %139, %153
  %sub25.us.i.1.3 = fsub float %mul17.us.i.1.3, %mul24.us.i.1.3
  %mul32.us.i.1.3 = fmul float %139, %152
  %mul39.us.i.1.3 = fmul float %138, %153
  %add40.us.i.1.3 = fadd float %mul32.us.i.1.3, %mul39.us.i.1.3
  %154 = add nuw nsw i64 %indvars.iv.next.i.353, %141
  %arrayidx45.us.i.1.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %154
  %155 = load float, float* %arrayidx45.us.i.1.3, align 4, !tbaa !2
  %sub46.us.i.1.3 = fsub float %155, %sub25.us.i.1.3
  store float %sub46.us.i.1.3, float* %arrayidx16.us.i.1.3, align 4, !tbaa !2
  %156 = load float, float* %arrayidx45.us.i.1.3, align 4, !tbaa !2
  %add58.us.i.1.3 = fadd float %sub25.us.i.1.3, %156
  store float %add58.us.i.1.3, float* %arrayidx45.us.i.1.3, align 4, !tbaa !2
  %arrayidx63.us.i.1.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %154
  %157 = load float, float* %arrayidx63.us.i.1.3, align 4, !tbaa !2
  %sub64.us.i.1.3 = fsub float %157, %add40.us.i.1.3
  store float %sub64.us.i.1.3, float* %arrayidx23.us.i.1.3, align 4, !tbaa !2
  %158 = load float, float* %arrayidx63.us.i.1.3, align 4, !tbaa !2
  %add76.us.i.1.3 = fadd float %add40.us.i.1.3, %158
  store float %add76.us.i.1.3, float* %arrayidx63.us.i.1.3, align 4, !tbaa !2
  %indvars.iv.next.i.1.3 = add nuw nsw i64 %indvars.iv.next.i.353, 1
  %niter.nsub.1.3 = sub i64 %niter.nsub.354, 1
  %159 = trunc i64 %indvars.iv.next.i.1.3 to i32
  %add14.us.i.2.3 = add i32 %add13.us.i.3, %159
  %idxprom15.us.i.2.3 = sext i32 %add14.us.i.2.3 to i64
  %arrayidx16.us.i.2.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.3
  %160 = load float, float* %arrayidx16.us.i.2.3, align 4, !tbaa !2
  %mul17.us.i.2.3 = fmul float %138, %160
  %arrayidx23.us.i.2.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.3
  %161 = load float, float* %arrayidx23.us.i.2.3, align 4, !tbaa !2
  %mul24.us.i.2.3 = fmul float %139, %161
  %sub25.us.i.2.3 = fsub float %mul17.us.i.2.3, %mul24.us.i.2.3
  %mul32.us.i.2.3 = fmul float %139, %160
  %mul39.us.i.2.3 = fmul float %138, %161
  %add40.us.i.2.3 = fadd float %mul32.us.i.2.3, %mul39.us.i.2.3
  %162 = add nuw nsw i64 %indvars.iv.next.i.1.3, %141
  %arrayidx45.us.i.2.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %162
  %163 = load float, float* %arrayidx45.us.i.2.3, align 4, !tbaa !2
  %sub46.us.i.2.3 = fsub float %163, %sub25.us.i.2.3
  store float %sub46.us.i.2.3, float* %arrayidx16.us.i.2.3, align 4, !tbaa !2
  %164 = load float, float* %arrayidx45.us.i.2.3, align 4, !tbaa !2
  %add58.us.i.2.3 = fadd float %sub25.us.i.2.3, %164
  store float %add58.us.i.2.3, float* %arrayidx45.us.i.2.3, align 4, !tbaa !2
  %arrayidx63.us.i.2.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %162
  %165 = load float, float* %arrayidx63.us.i.2.3, align 4, !tbaa !2
  %sub64.us.i.2.3 = fsub float %165, %add40.us.i.2.3
  store float %sub64.us.i.2.3, float* %arrayidx23.us.i.2.3, align 4, !tbaa !2
  %166 = load float, float* %arrayidx63.us.i.2.3, align 4, !tbaa !2
  %add76.us.i.2.3 = fadd float %add40.us.i.2.3, %166
  store float %add76.us.i.2.3, float* %arrayidx63.us.i.2.3, align 4, !tbaa !2
  %indvars.iv.next.i.2.3 = add nuw nsw i64 %indvars.iv.next.i.1.3, 1
  %niter.nsub.2.3 = sub i64 %niter.nsub.1.3, 1
  %167 = trunc i64 %indvars.iv.next.i.2.3 to i32
  %add14.us.i.3.3 = add i32 %add13.us.i.3, %167
  %idxprom15.us.i.3.3 = sext i32 %add14.us.i.3.3 to i64
  %arrayidx16.us.i.3.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.3
  %168 = load float, float* %arrayidx16.us.i.3.3, align 4, !tbaa !2
  %mul17.us.i.3.3 = fmul float %138, %168
  %arrayidx23.us.i.3.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.3
  %169 = load float, float* %arrayidx23.us.i.3.3, align 4, !tbaa !2
  %mul24.us.i.3.3 = fmul float %139, %169
  %sub25.us.i.3.3 = fsub float %mul17.us.i.3.3, %mul24.us.i.3.3
  %mul32.us.i.3.3 = fmul float %139, %168
  %mul39.us.i.3.3 = fmul float %138, %169
  %add40.us.i.3.3 = fadd float %mul32.us.i.3.3, %mul39.us.i.3.3
  %170 = add nuw nsw i64 %indvars.iv.next.i.2.3, %141
  %arrayidx45.us.i.3.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %170
  %171 = load float, float* %arrayidx45.us.i.3.3, align 4, !tbaa !2
  %sub46.us.i.3.3 = fsub float %171, %sub25.us.i.3.3
  store float %sub46.us.i.3.3, float* %arrayidx16.us.i.3.3, align 4, !tbaa !2
  %172 = load float, float* %arrayidx45.us.i.3.3, align 4, !tbaa !2
  %add58.us.i.3.3 = fadd float %sub25.us.i.3.3, %172
  store float %add58.us.i.3.3, float* %arrayidx45.us.i.3.3, align 4, !tbaa !2
  %arrayidx63.us.i.3.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %170
  %173 = load float, float* %arrayidx63.us.i.3.3, align 4, !tbaa !2
  %sub64.us.i.3.3 = fsub float %173, %add40.us.i.3.3
  store float %sub64.us.i.3.3, float* %arrayidx23.us.i.3.3, align 4, !tbaa !2
  %174 = load float, float* %arrayidx63.us.i.3.3, align 4, !tbaa !2
  %add76.us.i.3.3 = fadd float %add40.us.i.3.3, %174
  store float %add76.us.i.3.3, float* %arrayidx63.us.i.3.3, align 4, !tbaa !2
  %indvars.iv.next.i.3.3 = add nuw nsw i64 %indvars.iv.next.i.2.3, 1
  %niter.nsub.3.3 = sub i64 %niter.nsub.2.3, 1
  %niter.ncmp.3.3 = icmp eq i64 %niter.nsub.3.3, 0
  br i1 %niter.ncmp.3.3, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.3, label %for.body11.us.i.3, !llvm.loop !8

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.3: ; preds = %for.body11.us.i.3
  %indvars.iv.i.unr.ph.3 = phi i64 [ %indvars.iv.next.i.3.3, %for.body11.us.i.3 ]
  br label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.3

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.3:   ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.3, %for.body3.us.i.3
  %indvars.iv.i.unr.3 = phi i64 [ 0, %for.body3.us.i.3 ], [ %indvars.iv.i.unr.ph.3, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.3 ]
  br i1 false, label %for.body11.us.i.epil.preheader.3, label %for.cond9.for.inc77_crit_edge.us.i.3

for.body11.us.i.epil.preheader.3:                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.3
  br label %for.body11.us.i.epil.3

for.body11.us.i.epil.3:                           ; preds = %for.body11.us.i.epil.3, %for.body11.us.i.epil.preheader.3
  %indvars.iv.i.epil.3 = phi i64 [ %indvars.iv.i.unr.3, %for.body11.us.i.epil.preheader.3 ], [ %indvars.iv.next.i.epil.3, %for.body11.us.i.epil.3 ]
  %epil.iter.3 = phi i64 [ 0, %for.body11.us.i.epil.preheader.3 ], [ %epil.iter.sub.3, %for.body11.us.i.epil.3 ]
  %175 = trunc i64 %indvars.iv.i.epil.3 to i32
  %add14.us.i.epil.3 = add i32 %add13.us.i.3, %175
  %idxprom15.us.i.epil.3 = sext i32 %add14.us.i.epil.3 to i64
  %arrayidx16.us.i.epil.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.epil.3
  %176 = load float, float* %arrayidx16.us.i.epil.3, align 4, !tbaa !2
  %mul17.us.i.epil.3 = fmul float %138, %176
  %arrayidx23.us.i.epil.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.epil.3
  %177 = load float, float* %arrayidx23.us.i.epil.3, align 4, !tbaa !2
  %mul24.us.i.epil.3 = fmul float %139, %177
  %sub25.us.i.epil.3 = fsub float %mul17.us.i.epil.3, %mul24.us.i.epil.3
  %mul32.us.i.epil.3 = fmul float %139, %176
  %mul39.us.i.epil.3 = fmul float %138, %177
  %add40.us.i.epil.3 = fadd float %mul32.us.i.epil.3, %mul39.us.i.epil.3
  %178 = add nuw nsw i64 %indvars.iv.i.epil.3, %141
  %arrayidx45.us.i.epil.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %178
  %179 = load float, float* %arrayidx45.us.i.epil.3, align 4, !tbaa !2
  %sub46.us.i.epil.3 = fsub float %179, %sub25.us.i.epil.3
  store float %sub46.us.i.epil.3, float* %arrayidx16.us.i.epil.3, align 4, !tbaa !2
  %180 = load float, float* %arrayidx45.us.i.epil.3, align 4, !tbaa !2
  %add58.us.i.epil.3 = fadd float %sub25.us.i.epil.3, %180
  store float %add58.us.i.epil.3, float* %arrayidx45.us.i.epil.3, align 4, !tbaa !2
  %arrayidx63.us.i.epil.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %178
  %181 = load float, float* %arrayidx63.us.i.epil.3, align 4, !tbaa !2
  %sub64.us.i.epil.3 = fsub float %181, %add40.us.i.epil.3
  store float %sub64.us.i.epil.3, float* %arrayidx23.us.i.epil.3, align 4, !tbaa !2
  %182 = load float, float* %arrayidx63.us.i.epil.3, align 4, !tbaa !2
  %add76.us.i.epil.3 = fadd float %add40.us.i.epil.3, %182
  store float %add76.us.i.epil.3, float* %arrayidx63.us.i.epil.3, align 4, !tbaa !2
  %indvars.iv.next.i.epil.3 = add nuw nsw i64 %indvars.iv.i.epil.3, 1
  %epil.iter.sub.3 = sub i64 %epil.iter.3, 1
  %epil.iter.cmp.3 = icmp ne i64 %epil.iter.sub.3, 0
  br i1 %epil.iter.cmp.3, label %for.body11.us.i.epil.3, label %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.3, !llvm.loop !9

for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.3: ; preds = %for.body11.us.i.epil.3
  br label %for.cond9.for.inc77_crit_edge.us.i.3

for.cond9.for.inc77_crit_edge.us.i.3:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.3, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.3
  %indvars.iv.next163.i.3 = add nuw nsw i64 %indvars.iv162.i.3, 1
  %exitcond168.i.3 = icmp eq i64 %indvars.iv.next163.i.3, 8
  br i1 %exitcond168.i.3, label %for.end79.i.loopexit.3, label %for.body3.us.i.3

for.end79.i.loopexit.3:                           ; preds = %for.cond9.for.inc77_crit_edge.us.i.3
  br label %for.end79.i.3

for.end79.i.3:                                    ; preds = %for.end79.i.loopexit.3, %for.end79.i.2
  br i1 true, label %for.body3.us.preheader.i.4, label %for.end79.i.4

for.body3.us.preheader.i.4:                       ; preds = %for.end79.i.3
  br label %for.body3.us.i.4

for.body3.us.i.4:                                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.4, %for.body3.us.preheader.i.4
  %indvars.iv162.i.4 = phi i64 [ 0, %for.body3.us.preheader.i.4 ], [ %indvars.iv.next163.i.4, %for.cond9.for.inc77_crit_edge.us.i.4 ]
  %183 = add nsw i64 %indvars.iv162.i.4, 15
  %arrayidx.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %183
  %184 = load float, float* %arrayidx.us.i.4, align 4, !tbaa !2
  %arrayidx8.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %183
  %185 = load float, float* %arrayidx8.us.i.4, align 4, !tbaa !2
  %186 = shl nuw nsw i64 %indvars.iv162.i.4, 1
  %187 = mul nuw nsw i64 %186, 8
  %188 = trunc i64 %187 to i32
  %add13.us.i.4 = add i32 8, %188
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.4, label %for.body3.us.i.new.4

for.body3.us.i.new.4:                             ; preds = %for.body3.us.i.4
  br label %for.body11.us.i.4

for.body11.us.i.4:                                ; preds = %for.body11.us.i.4, %for.body3.us.i.new.4
  %indvars.iv.i.4 = phi i64 [ 0, %for.body3.us.i.new.4 ], [ %indvars.iv.next.i.3.4, %for.body11.us.i.4 ]
  %niter.4 = phi i64 [ 8, %for.body3.us.i.new.4 ], [ %niter.nsub.3.4, %for.body11.us.i.4 ]
  %189 = trunc i64 %indvars.iv.i.4 to i32
  %add14.us.i.4 = add i32 %add13.us.i.4, %189
  %idxprom15.us.i.4 = sext i32 %add14.us.i.4 to i64
  %arrayidx16.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.4
  %190 = load float, float* %arrayidx16.us.i.4, align 4, !tbaa !2
  %mul17.us.i.4 = fmul float %184, %190
  %arrayidx23.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.4
  %191 = load float, float* %arrayidx23.us.i.4, align 4, !tbaa !2
  %mul24.us.i.4 = fmul float %185, %191
  %sub25.us.i.4 = fsub float %mul17.us.i.4, %mul24.us.i.4
  %mul32.us.i.4 = fmul float %185, %190
  %mul39.us.i.4 = fmul float %184, %191
  %add40.us.i.4 = fadd float %mul32.us.i.4, %mul39.us.i.4
  %192 = add nuw nsw i64 %indvars.iv.i.4, %187
  %arrayidx45.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %192
  %193 = load float, float* %arrayidx45.us.i.4, align 4, !tbaa !2
  %sub46.us.i.4 = fsub float %193, %sub25.us.i.4
  store float %sub46.us.i.4, float* %arrayidx16.us.i.4, align 4, !tbaa !2
  %194 = load float, float* %arrayidx45.us.i.4, align 4, !tbaa !2
  %add58.us.i.4 = fadd float %sub25.us.i.4, %194
  store float %add58.us.i.4, float* %arrayidx45.us.i.4, align 4, !tbaa !2
  %arrayidx63.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %192
  %195 = load float, float* %arrayidx63.us.i.4, align 4, !tbaa !2
  %sub64.us.i.4 = fsub float %195, %add40.us.i.4
  store float %sub64.us.i.4, float* %arrayidx23.us.i.4, align 4, !tbaa !2
  %196 = load float, float* %arrayidx63.us.i.4, align 4, !tbaa !2
  %add76.us.i.4 = fadd float %add40.us.i.4, %196
  store float %add76.us.i.4, float* %arrayidx63.us.i.4, align 4, !tbaa !2
  %indvars.iv.next.i.4 = add nuw nsw i64 %indvars.iv.i.4, 1
  %niter.nsub.4 = sub i64 %niter.4, 1
  %197 = trunc i64 %indvars.iv.next.i.4 to i32
  %add14.us.i.1.4 = add i32 %add13.us.i.4, %197
  %idxprom15.us.i.1.4 = sext i32 %add14.us.i.1.4 to i64
  %arrayidx16.us.i.1.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.4
  %198 = load float, float* %arrayidx16.us.i.1.4, align 4, !tbaa !2
  %mul17.us.i.1.4 = fmul float %184, %198
  %arrayidx23.us.i.1.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.4
  %199 = load float, float* %arrayidx23.us.i.1.4, align 4, !tbaa !2
  %mul24.us.i.1.4 = fmul float %185, %199
  %sub25.us.i.1.4 = fsub float %mul17.us.i.1.4, %mul24.us.i.1.4
  %mul32.us.i.1.4 = fmul float %185, %198
  %mul39.us.i.1.4 = fmul float %184, %199
  %add40.us.i.1.4 = fadd float %mul32.us.i.1.4, %mul39.us.i.1.4
  %200 = add nuw nsw i64 %indvars.iv.next.i.4, %187
  %arrayidx45.us.i.1.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %200
  %201 = load float, float* %arrayidx45.us.i.1.4, align 4, !tbaa !2
  %sub46.us.i.1.4 = fsub float %201, %sub25.us.i.1.4
  store float %sub46.us.i.1.4, float* %arrayidx16.us.i.1.4, align 4, !tbaa !2
  %202 = load float, float* %arrayidx45.us.i.1.4, align 4, !tbaa !2
  %add58.us.i.1.4 = fadd float %sub25.us.i.1.4, %202
  store float %add58.us.i.1.4, float* %arrayidx45.us.i.1.4, align 4, !tbaa !2
  %arrayidx63.us.i.1.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %200
  %203 = load float, float* %arrayidx63.us.i.1.4, align 4, !tbaa !2
  %sub64.us.i.1.4 = fsub float %203, %add40.us.i.1.4
  store float %sub64.us.i.1.4, float* %arrayidx23.us.i.1.4, align 4, !tbaa !2
  %204 = load float, float* %arrayidx63.us.i.1.4, align 4, !tbaa !2
  %add76.us.i.1.4 = fadd float %add40.us.i.1.4, %204
  store float %add76.us.i.1.4, float* %arrayidx63.us.i.1.4, align 4, !tbaa !2
  %indvars.iv.next.i.1.4 = add nuw nsw i64 %indvars.iv.next.i.4, 1
  %niter.nsub.1.4 = sub i64 %niter.nsub.4, 1
  %205 = trunc i64 %indvars.iv.next.i.1.4 to i32
  %add14.us.i.2.4 = add i32 %add13.us.i.4, %205
  %idxprom15.us.i.2.4 = sext i32 %add14.us.i.2.4 to i64
  %arrayidx16.us.i.2.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.4
  %206 = load float, float* %arrayidx16.us.i.2.4, align 4, !tbaa !2
  %mul17.us.i.2.4 = fmul float %184, %206
  %arrayidx23.us.i.2.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.4
  %207 = load float, float* %arrayidx23.us.i.2.4, align 4, !tbaa !2
  %mul24.us.i.2.4 = fmul float %185, %207
  %sub25.us.i.2.4 = fsub float %mul17.us.i.2.4, %mul24.us.i.2.4
  %mul32.us.i.2.4 = fmul float %185, %206
  %mul39.us.i.2.4 = fmul float %184, %207
  %add40.us.i.2.4 = fadd float %mul32.us.i.2.4, %mul39.us.i.2.4
  %208 = add nuw nsw i64 %indvars.iv.next.i.1.4, %187
  %arrayidx45.us.i.2.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %208
  %209 = load float, float* %arrayidx45.us.i.2.4, align 4, !tbaa !2
  %sub46.us.i.2.4 = fsub float %209, %sub25.us.i.2.4
  store float %sub46.us.i.2.4, float* %arrayidx16.us.i.2.4, align 4, !tbaa !2
  %210 = load float, float* %arrayidx45.us.i.2.4, align 4, !tbaa !2
  %add58.us.i.2.4 = fadd float %sub25.us.i.2.4, %210
  store float %add58.us.i.2.4, float* %arrayidx45.us.i.2.4, align 4, !tbaa !2
  %arrayidx63.us.i.2.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %208
  %211 = load float, float* %arrayidx63.us.i.2.4, align 4, !tbaa !2
  %sub64.us.i.2.4 = fsub float %211, %add40.us.i.2.4
  store float %sub64.us.i.2.4, float* %arrayidx23.us.i.2.4, align 4, !tbaa !2
  %212 = load float, float* %arrayidx63.us.i.2.4, align 4, !tbaa !2
  %add76.us.i.2.4 = fadd float %add40.us.i.2.4, %212
  store float %add76.us.i.2.4, float* %arrayidx63.us.i.2.4, align 4, !tbaa !2
  %indvars.iv.next.i.2.4 = add nuw nsw i64 %indvars.iv.next.i.1.4, 1
  %niter.nsub.2.4 = sub i64 %niter.nsub.1.4, 1
  %213 = trunc i64 %indvars.iv.next.i.2.4 to i32
  %add14.us.i.3.4 = add i32 %add13.us.i.4, %213
  %idxprom15.us.i.3.4 = sext i32 %add14.us.i.3.4 to i64
  %arrayidx16.us.i.3.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.4
  %214 = load float, float* %arrayidx16.us.i.3.4, align 4, !tbaa !2
  %mul17.us.i.3.4 = fmul float %184, %214
  %arrayidx23.us.i.3.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.4
  %215 = load float, float* %arrayidx23.us.i.3.4, align 4, !tbaa !2
  %mul24.us.i.3.4 = fmul float %185, %215
  %sub25.us.i.3.4 = fsub float %mul17.us.i.3.4, %mul24.us.i.3.4
  %mul32.us.i.3.4 = fmul float %185, %214
  %mul39.us.i.3.4 = fmul float %184, %215
  %add40.us.i.3.4 = fadd float %mul32.us.i.3.4, %mul39.us.i.3.4
  %216 = add nuw nsw i64 %indvars.iv.next.i.2.4, %187
  %arrayidx45.us.i.3.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %216
  %217 = load float, float* %arrayidx45.us.i.3.4, align 4, !tbaa !2
  %sub46.us.i.3.4 = fsub float %217, %sub25.us.i.3.4
  store float %sub46.us.i.3.4, float* %arrayidx16.us.i.3.4, align 4, !tbaa !2
  %218 = load float, float* %arrayidx45.us.i.3.4, align 4, !tbaa !2
  %add58.us.i.3.4 = fadd float %sub25.us.i.3.4, %218
  store float %add58.us.i.3.4, float* %arrayidx45.us.i.3.4, align 4, !tbaa !2
  %arrayidx63.us.i.3.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %216
  %219 = load float, float* %arrayidx63.us.i.3.4, align 4, !tbaa !2
  %sub64.us.i.3.4 = fsub float %219, %add40.us.i.3.4
  store float %sub64.us.i.3.4, float* %arrayidx23.us.i.3.4, align 4, !tbaa !2
  %220 = load float, float* %arrayidx63.us.i.3.4, align 4, !tbaa !2
  %add76.us.i.3.4 = fadd float %add40.us.i.3.4, %220
  store float %add76.us.i.3.4, float* %arrayidx63.us.i.3.4, align 4, !tbaa !2
  %indvars.iv.next.i.3.4 = add nuw nsw i64 %indvars.iv.next.i.2.4, 1
  %niter.nsub.3.4 = sub i64 %niter.nsub.2.4, 1
  %niter.ncmp.3.4 = icmp eq i64 %niter.nsub.3.4, 0
  br i1 %niter.ncmp.3.4, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.4, label %for.body11.us.i.4, !llvm.loop !8

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.4: ; preds = %for.body11.us.i.4
  %indvars.iv.i.unr.ph.4 = phi i64 [ %indvars.iv.next.i.3.4, %for.body11.us.i.4 ]
  br label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.4

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.4:   ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.4, %for.body3.us.i.4
  %indvars.iv.i.unr.4 = phi i64 [ 0, %for.body3.us.i.4 ], [ %indvars.iv.i.unr.ph.4, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.4 ]
  br i1 false, label %for.body11.us.i.epil.preheader.4, label %for.cond9.for.inc77_crit_edge.us.i.4

for.body11.us.i.epil.preheader.4:                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.4
  br label %for.body11.us.i.epil.4

for.body11.us.i.epil.4:                           ; preds = %for.body11.us.i.epil.4, %for.body11.us.i.epil.preheader.4
  %indvars.iv.i.epil.4 = phi i64 [ %indvars.iv.i.unr.4, %for.body11.us.i.epil.preheader.4 ], [ %indvars.iv.next.i.epil.4, %for.body11.us.i.epil.4 ]
  %epil.iter.4 = phi i64 [ 0, %for.body11.us.i.epil.preheader.4 ], [ %epil.iter.sub.4, %for.body11.us.i.epil.4 ]
  %221 = trunc i64 %indvars.iv.i.epil.4 to i32
  %add14.us.i.epil.4 = add i32 %add13.us.i.4, %221
  %idxprom15.us.i.epil.4 = sext i32 %add14.us.i.epil.4 to i64
  %arrayidx16.us.i.epil.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.epil.4
  %222 = load float, float* %arrayidx16.us.i.epil.4, align 4, !tbaa !2
  %mul17.us.i.epil.4 = fmul float %184, %222
  %arrayidx23.us.i.epil.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.epil.4
  %223 = load float, float* %arrayidx23.us.i.epil.4, align 4, !tbaa !2
  %mul24.us.i.epil.4 = fmul float %185, %223
  %sub25.us.i.epil.4 = fsub float %mul17.us.i.epil.4, %mul24.us.i.epil.4
  %mul32.us.i.epil.4 = fmul float %185, %222
  %mul39.us.i.epil.4 = fmul float %184, %223
  %add40.us.i.epil.4 = fadd float %mul32.us.i.epil.4, %mul39.us.i.epil.4
  %224 = add nuw nsw i64 %indvars.iv.i.epil.4, %187
  %arrayidx45.us.i.epil.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %224
  %225 = load float, float* %arrayidx45.us.i.epil.4, align 4, !tbaa !2
  %sub46.us.i.epil.4 = fsub float %225, %sub25.us.i.epil.4
  store float %sub46.us.i.epil.4, float* %arrayidx16.us.i.epil.4, align 4, !tbaa !2
  %226 = load float, float* %arrayidx45.us.i.epil.4, align 4, !tbaa !2
  %add58.us.i.epil.4 = fadd float %sub25.us.i.epil.4, %226
  store float %add58.us.i.epil.4, float* %arrayidx45.us.i.epil.4, align 4, !tbaa !2
  %arrayidx63.us.i.epil.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %224
  %227 = load float, float* %arrayidx63.us.i.epil.4, align 4, !tbaa !2
  %sub64.us.i.epil.4 = fsub float %227, %add40.us.i.epil.4
  store float %sub64.us.i.epil.4, float* %arrayidx23.us.i.epil.4, align 4, !tbaa !2
  %228 = load float, float* %arrayidx63.us.i.epil.4, align 4, !tbaa !2
  %add76.us.i.epil.4 = fadd float %add40.us.i.epil.4, %228
  store float %add76.us.i.epil.4, float* %arrayidx63.us.i.epil.4, align 4, !tbaa !2
  %indvars.iv.next.i.epil.4 = add nuw nsw i64 %indvars.iv.i.epil.4, 1
  %epil.iter.sub.4 = sub i64 %epil.iter.4, 1
  %epil.iter.cmp.4 = icmp ne i64 %epil.iter.sub.4, 0
  br i1 %epil.iter.cmp.4, label %for.body11.us.i.epil.4, label %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.4, !llvm.loop !9

for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.4: ; preds = %for.body11.us.i.epil.4
  br label %for.cond9.for.inc77_crit_edge.us.i.4

for.cond9.for.inc77_crit_edge.us.i.4:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.4, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.4
  %indvars.iv.next163.i.4 = add nuw nsw i64 %indvars.iv162.i.4, 1
  %exitcond168.i.4 = icmp eq i64 %indvars.iv.next163.i.4, 16
  br i1 %exitcond168.i.4, label %for.end79.i.loopexit.4, label %for.body3.us.i.4

for.end79.i.loopexit.4:                           ; preds = %for.cond9.for.inc77_crit_edge.us.i.4
  br label %for.end79.i.4

for.end79.i.4:                                    ; preds = %for.end79.i.loopexit.4, %for.end79.i.3
  br i1 true, label %for.body3.us.preheader.i.5, label %for.end79.i.5

for.body3.us.preheader.i.5:                       ; preds = %for.end79.i.4
  br label %for.body3.us.i.5

for.body3.us.i.5:                                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.5, %for.body3.us.preheader.i.5
  %indvars.iv162.i.5 = phi i64 [ 0, %for.body3.us.preheader.i.5 ], [ %indvars.iv.next163.i.5, %for.cond9.for.inc77_crit_edge.us.i.5 ]
  %229 = add nsw i64 %indvars.iv162.i.5, 31
  %arrayidx.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %229
  %230 = load float, float* %arrayidx.us.i.5, align 4, !tbaa !2
  %arrayidx8.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %229
  %231 = load float, float* %arrayidx8.us.i.5, align 4, !tbaa !2
  %232 = shl nuw nsw i64 %indvars.iv162.i.5, 1
  %233 = mul nuw nsw i64 %232, 4
  %234 = trunc i64 %233 to i32
  %add13.us.i.5 = add i32 4, %234
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.5, label %for.body3.us.i.new.5

for.body3.us.i.new.5:                             ; preds = %for.body3.us.i.5
  br label %for.body11.us.i.5

for.body11.us.i.5:                                ; preds = %for.body11.us.i.5, %for.body3.us.i.new.5
  %indvars.iv.i.5 = phi i64 [ 0, %for.body3.us.i.new.5 ], [ %indvars.iv.next.i.3.5, %for.body11.us.i.5 ]
  %niter.5 = phi i64 [ 4, %for.body3.us.i.new.5 ], [ %niter.nsub.3.5, %for.body11.us.i.5 ]
  %235 = trunc i64 %indvars.iv.i.5 to i32
  %add14.us.i.5 = add i32 %add13.us.i.5, %235
  %idxprom15.us.i.5 = sext i32 %add14.us.i.5 to i64
  %arrayidx16.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.5
  %236 = load float, float* %arrayidx16.us.i.5, align 4, !tbaa !2
  %mul17.us.i.5 = fmul float %230, %236
  %arrayidx23.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.5
  %237 = load float, float* %arrayidx23.us.i.5, align 4, !tbaa !2
  %mul24.us.i.5 = fmul float %231, %237
  %sub25.us.i.5 = fsub float %mul17.us.i.5, %mul24.us.i.5
  %mul32.us.i.5 = fmul float %231, %236
  %mul39.us.i.5 = fmul float %230, %237
  %add40.us.i.5 = fadd float %mul32.us.i.5, %mul39.us.i.5
  %238 = add nuw nsw i64 %indvars.iv.i.5, %233
  %arrayidx45.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %238
  %239 = load float, float* %arrayidx45.us.i.5, align 4, !tbaa !2
  %sub46.us.i.5 = fsub float %239, %sub25.us.i.5
  store float %sub46.us.i.5, float* %arrayidx16.us.i.5, align 4, !tbaa !2
  %240 = load float, float* %arrayidx45.us.i.5, align 4, !tbaa !2
  %add58.us.i.5 = fadd float %sub25.us.i.5, %240
  store float %add58.us.i.5, float* %arrayidx45.us.i.5, align 4, !tbaa !2
  %arrayidx63.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %238
  %241 = load float, float* %arrayidx63.us.i.5, align 4, !tbaa !2
  %sub64.us.i.5 = fsub float %241, %add40.us.i.5
  store float %sub64.us.i.5, float* %arrayidx23.us.i.5, align 4, !tbaa !2
  %242 = load float, float* %arrayidx63.us.i.5, align 4, !tbaa !2
  %add76.us.i.5 = fadd float %add40.us.i.5, %242
  store float %add76.us.i.5, float* %arrayidx63.us.i.5, align 4, !tbaa !2
  %indvars.iv.next.i.5 = add nuw nsw i64 %indvars.iv.i.5, 1
  %niter.nsub.5 = sub i64 %niter.5, 1
  %243 = trunc i64 %indvars.iv.next.i.5 to i32
  %add14.us.i.1.5 = add i32 %add13.us.i.5, %243
  %idxprom15.us.i.1.5 = sext i32 %add14.us.i.1.5 to i64
  %arrayidx16.us.i.1.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.5
  %244 = load float, float* %arrayidx16.us.i.1.5, align 4, !tbaa !2
  %mul17.us.i.1.5 = fmul float %230, %244
  %arrayidx23.us.i.1.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.5
  %245 = load float, float* %arrayidx23.us.i.1.5, align 4, !tbaa !2
  %mul24.us.i.1.5 = fmul float %231, %245
  %sub25.us.i.1.5 = fsub float %mul17.us.i.1.5, %mul24.us.i.1.5
  %mul32.us.i.1.5 = fmul float %231, %244
  %mul39.us.i.1.5 = fmul float %230, %245
  %add40.us.i.1.5 = fadd float %mul32.us.i.1.5, %mul39.us.i.1.5
  %246 = add nuw nsw i64 %indvars.iv.next.i.5, %233
  %arrayidx45.us.i.1.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %246
  %247 = load float, float* %arrayidx45.us.i.1.5, align 4, !tbaa !2
  %sub46.us.i.1.5 = fsub float %247, %sub25.us.i.1.5
  store float %sub46.us.i.1.5, float* %arrayidx16.us.i.1.5, align 4, !tbaa !2
  %248 = load float, float* %arrayidx45.us.i.1.5, align 4, !tbaa !2
  %add58.us.i.1.5 = fadd float %sub25.us.i.1.5, %248
  store float %add58.us.i.1.5, float* %arrayidx45.us.i.1.5, align 4, !tbaa !2
  %arrayidx63.us.i.1.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %246
  %249 = load float, float* %arrayidx63.us.i.1.5, align 4, !tbaa !2
  %sub64.us.i.1.5 = fsub float %249, %add40.us.i.1.5
  store float %sub64.us.i.1.5, float* %arrayidx23.us.i.1.5, align 4, !tbaa !2
  %250 = load float, float* %arrayidx63.us.i.1.5, align 4, !tbaa !2
  %add76.us.i.1.5 = fadd float %add40.us.i.1.5, %250
  store float %add76.us.i.1.5, float* %arrayidx63.us.i.1.5, align 4, !tbaa !2
  %indvars.iv.next.i.1.5 = add nuw nsw i64 %indvars.iv.next.i.5, 1
  %niter.nsub.1.5 = sub i64 %niter.nsub.5, 1
  %251 = trunc i64 %indvars.iv.next.i.1.5 to i32
  %add14.us.i.2.5 = add i32 %add13.us.i.5, %251
  %idxprom15.us.i.2.5 = sext i32 %add14.us.i.2.5 to i64
  %arrayidx16.us.i.2.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.5
  %252 = load float, float* %arrayidx16.us.i.2.5, align 4, !tbaa !2
  %mul17.us.i.2.5 = fmul float %230, %252
  %arrayidx23.us.i.2.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.5
  %253 = load float, float* %arrayidx23.us.i.2.5, align 4, !tbaa !2
  %mul24.us.i.2.5 = fmul float %231, %253
  %sub25.us.i.2.5 = fsub float %mul17.us.i.2.5, %mul24.us.i.2.5
  %mul32.us.i.2.5 = fmul float %231, %252
  %mul39.us.i.2.5 = fmul float %230, %253
  %add40.us.i.2.5 = fadd float %mul32.us.i.2.5, %mul39.us.i.2.5
  %254 = add nuw nsw i64 %indvars.iv.next.i.1.5, %233
  %arrayidx45.us.i.2.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %254
  %255 = load float, float* %arrayidx45.us.i.2.5, align 4, !tbaa !2
  %sub46.us.i.2.5 = fsub float %255, %sub25.us.i.2.5
  store float %sub46.us.i.2.5, float* %arrayidx16.us.i.2.5, align 4, !tbaa !2
  %256 = load float, float* %arrayidx45.us.i.2.5, align 4, !tbaa !2
  %add58.us.i.2.5 = fadd float %sub25.us.i.2.5, %256
  store float %add58.us.i.2.5, float* %arrayidx45.us.i.2.5, align 4, !tbaa !2
  %arrayidx63.us.i.2.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %254
  %257 = load float, float* %arrayidx63.us.i.2.5, align 4, !tbaa !2
  %sub64.us.i.2.5 = fsub float %257, %add40.us.i.2.5
  store float %sub64.us.i.2.5, float* %arrayidx23.us.i.2.5, align 4, !tbaa !2
  %258 = load float, float* %arrayidx63.us.i.2.5, align 4, !tbaa !2
  %add76.us.i.2.5 = fadd float %add40.us.i.2.5, %258
  store float %add76.us.i.2.5, float* %arrayidx63.us.i.2.5, align 4, !tbaa !2
  %indvars.iv.next.i.2.5 = add nuw nsw i64 %indvars.iv.next.i.1.5, 1
  %niter.nsub.2.5 = sub i64 %niter.nsub.1.5, 1
  %259 = trunc i64 %indvars.iv.next.i.2.5 to i32
  %add14.us.i.3.5 = add i32 %add13.us.i.5, %259
  %idxprom15.us.i.3.5 = sext i32 %add14.us.i.3.5 to i64
  %arrayidx16.us.i.3.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.5
  %260 = load float, float* %arrayidx16.us.i.3.5, align 4, !tbaa !2
  %mul17.us.i.3.5 = fmul float %230, %260
  %arrayidx23.us.i.3.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.5
  %261 = load float, float* %arrayidx23.us.i.3.5, align 4, !tbaa !2
  %mul24.us.i.3.5 = fmul float %231, %261
  %sub25.us.i.3.5 = fsub float %mul17.us.i.3.5, %mul24.us.i.3.5
  %mul32.us.i.3.5 = fmul float %231, %260
  %mul39.us.i.3.5 = fmul float %230, %261
  %add40.us.i.3.5 = fadd float %mul32.us.i.3.5, %mul39.us.i.3.5
  %262 = add nuw nsw i64 %indvars.iv.next.i.2.5, %233
  %arrayidx45.us.i.3.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %262
  %263 = load float, float* %arrayidx45.us.i.3.5, align 4, !tbaa !2
  %sub46.us.i.3.5 = fsub float %263, %sub25.us.i.3.5
  store float %sub46.us.i.3.5, float* %arrayidx16.us.i.3.5, align 4, !tbaa !2
  %264 = load float, float* %arrayidx45.us.i.3.5, align 4, !tbaa !2
  %add58.us.i.3.5 = fadd float %sub25.us.i.3.5, %264
  store float %add58.us.i.3.5, float* %arrayidx45.us.i.3.5, align 4, !tbaa !2
  %arrayidx63.us.i.3.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %262
  %265 = load float, float* %arrayidx63.us.i.3.5, align 4, !tbaa !2
  %sub64.us.i.3.5 = fsub float %265, %add40.us.i.3.5
  store float %sub64.us.i.3.5, float* %arrayidx23.us.i.3.5, align 4, !tbaa !2
  %266 = load float, float* %arrayidx63.us.i.3.5, align 4, !tbaa !2
  %add76.us.i.3.5 = fadd float %add40.us.i.3.5, %266
  store float %add76.us.i.3.5, float* %arrayidx63.us.i.3.5, align 4, !tbaa !2
  %indvars.iv.next.i.3.5 = add nuw nsw i64 %indvars.iv.next.i.2.5, 1
  %niter.nsub.3.5 = sub i64 %niter.nsub.2.5, 1
  %niter.ncmp.3.5 = icmp eq i64 %niter.nsub.3.5, 0
  br i1 %niter.ncmp.3.5, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.5, label %for.body11.us.i.5, !llvm.loop !8

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.5: ; preds = %for.body11.us.i.5
  %indvars.iv.i.unr.ph.5 = phi i64 [ %indvars.iv.next.i.3.5, %for.body11.us.i.5 ]
  br label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.5

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.5:   ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.5, %for.body3.us.i.5
  %indvars.iv.i.unr.5 = phi i64 [ 0, %for.body3.us.i.5 ], [ %indvars.iv.i.unr.ph.5, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.5 ]
  br i1 false, label %for.body11.us.i.epil.preheader.5, label %for.cond9.for.inc77_crit_edge.us.i.5

for.body11.us.i.epil.preheader.5:                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.5
  br label %for.body11.us.i.epil.5

for.body11.us.i.epil.5:                           ; preds = %for.body11.us.i.epil.5, %for.body11.us.i.epil.preheader.5
  %indvars.iv.i.epil.5 = phi i64 [ %indvars.iv.i.unr.5, %for.body11.us.i.epil.preheader.5 ], [ %indvars.iv.next.i.epil.5, %for.body11.us.i.epil.5 ]
  %epil.iter.5 = phi i64 [ 0, %for.body11.us.i.epil.preheader.5 ], [ %epil.iter.sub.5, %for.body11.us.i.epil.5 ]
  %267 = trunc i64 %indvars.iv.i.epil.5 to i32
  %add14.us.i.epil.5 = add i32 %add13.us.i.5, %267
  %idxprom15.us.i.epil.5 = sext i32 %add14.us.i.epil.5 to i64
  %arrayidx16.us.i.epil.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.epil.5
  %268 = load float, float* %arrayidx16.us.i.epil.5, align 4, !tbaa !2
  %mul17.us.i.epil.5 = fmul float %230, %268
  %arrayidx23.us.i.epil.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.epil.5
  %269 = load float, float* %arrayidx23.us.i.epil.5, align 4, !tbaa !2
  %mul24.us.i.epil.5 = fmul float %231, %269
  %sub25.us.i.epil.5 = fsub float %mul17.us.i.epil.5, %mul24.us.i.epil.5
  %mul32.us.i.epil.5 = fmul float %231, %268
  %mul39.us.i.epil.5 = fmul float %230, %269
  %add40.us.i.epil.5 = fadd float %mul32.us.i.epil.5, %mul39.us.i.epil.5
  %270 = add nuw nsw i64 %indvars.iv.i.epil.5, %233
  %arrayidx45.us.i.epil.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %270
  %271 = load float, float* %arrayidx45.us.i.epil.5, align 4, !tbaa !2
  %sub46.us.i.epil.5 = fsub float %271, %sub25.us.i.epil.5
  store float %sub46.us.i.epil.5, float* %arrayidx16.us.i.epil.5, align 4, !tbaa !2
  %272 = load float, float* %arrayidx45.us.i.epil.5, align 4, !tbaa !2
  %add58.us.i.epil.5 = fadd float %sub25.us.i.epil.5, %272
  store float %add58.us.i.epil.5, float* %arrayidx45.us.i.epil.5, align 4, !tbaa !2
  %arrayidx63.us.i.epil.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %270
  %273 = load float, float* %arrayidx63.us.i.epil.5, align 4, !tbaa !2
  %sub64.us.i.epil.5 = fsub float %273, %add40.us.i.epil.5
  store float %sub64.us.i.epil.5, float* %arrayidx23.us.i.epil.5, align 4, !tbaa !2
  %274 = load float, float* %arrayidx63.us.i.epil.5, align 4, !tbaa !2
  %add76.us.i.epil.5 = fadd float %add40.us.i.epil.5, %274
  store float %add76.us.i.epil.5, float* %arrayidx63.us.i.epil.5, align 4, !tbaa !2
  %indvars.iv.next.i.epil.5 = add nuw nsw i64 %indvars.iv.i.epil.5, 1
  %epil.iter.sub.5 = sub i64 %epil.iter.5, 1
  %epil.iter.cmp.5 = icmp ne i64 %epil.iter.sub.5, 0
  br i1 %epil.iter.cmp.5, label %for.body11.us.i.epil.5, label %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.5, !llvm.loop !9

for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.5: ; preds = %for.body11.us.i.epil.5
  br label %for.cond9.for.inc77_crit_edge.us.i.5

for.cond9.for.inc77_crit_edge.us.i.5:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.5, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.5
  %indvars.iv.next163.i.5 = add nuw nsw i64 %indvars.iv162.i.5, 1
  %exitcond168.i.5 = icmp eq i64 %indvars.iv.next163.i.5, 32
  br i1 %exitcond168.i.5, label %for.end79.i.loopexit.5, label %for.body3.us.i.5

for.end79.i.loopexit.5:                           ; preds = %for.cond9.for.inc77_crit_edge.us.i.5
  br label %for.end79.i.5

for.end79.i.5:                                    ; preds = %for.end79.i.loopexit.5, %for.end79.i.4
  br i1 true, label %for.body3.us.preheader.i.6, label %for.end79.i.6

for.body3.us.preheader.i.6:                       ; preds = %for.end79.i.5
  br label %for.body3.us.i.6

for.body3.us.i.6:                                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.6, %for.body3.us.preheader.i.6
  %indvars.iv162.i.6 = phi i64 [ 0, %for.body3.us.preheader.i.6 ], [ %indvars.iv.next163.i.6, %for.cond9.for.inc77_crit_edge.us.i.6 ]
  %275 = add nsw i64 %indvars.iv162.i.6, 63
  %arrayidx.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %275
  %276 = load float, float* %arrayidx.us.i.6, align 4, !tbaa !2
  %arrayidx8.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %275
  %277 = load float, float* %arrayidx8.us.i.6, align 4, !tbaa !2
  %278 = shl nuw nsw i64 %indvars.iv162.i.6, 1
  %279 = mul nuw nsw i64 %278, 2
  %280 = trunc i64 %279 to i32
  %add13.us.i.6 = add i32 2, %280
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.6, label %for.body3.us.i.new.6

for.body3.us.i.new.6:                             ; preds = %for.body3.us.i.6
  br label %for.body11.us.i.6

for.body11.us.i.6:                                ; preds = %for.body11.us.i.6, %for.body3.us.i.new.6
  %indvars.iv.i.6 = phi i64 [ 0, %for.body3.us.i.new.6 ], [ %indvars.iv.next.i.3.6, %for.body11.us.i.6 ]
  %niter.6 = phi i64 [ 0, %for.body3.us.i.new.6 ], [ %niter.nsub.3.6, %for.body11.us.i.6 ]
  %281 = trunc i64 %indvars.iv.i.6 to i32
  %add14.us.i.6 = add i32 %add13.us.i.6, %281
  %idxprom15.us.i.6 = sext i32 %add14.us.i.6 to i64
  %arrayidx16.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.6
  %282 = load float, float* %arrayidx16.us.i.6, align 4, !tbaa !2
  %mul17.us.i.6 = fmul float %276, %282
  %arrayidx23.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.6
  %283 = load float, float* %arrayidx23.us.i.6, align 4, !tbaa !2
  %mul24.us.i.6 = fmul float %277, %283
  %sub25.us.i.6 = fsub float %mul17.us.i.6, %mul24.us.i.6
  %mul32.us.i.6 = fmul float %277, %282
  %mul39.us.i.6 = fmul float %276, %283
  %add40.us.i.6 = fadd float %mul32.us.i.6, %mul39.us.i.6
  %284 = add nuw nsw i64 %indvars.iv.i.6, %279
  %arrayidx45.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %284
  %285 = load float, float* %arrayidx45.us.i.6, align 4, !tbaa !2
  %sub46.us.i.6 = fsub float %285, %sub25.us.i.6
  store float %sub46.us.i.6, float* %arrayidx16.us.i.6, align 4, !tbaa !2
  %286 = load float, float* %arrayidx45.us.i.6, align 4, !tbaa !2
  %add58.us.i.6 = fadd float %sub25.us.i.6, %286
  store float %add58.us.i.6, float* %arrayidx45.us.i.6, align 4, !tbaa !2
  %arrayidx63.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %284
  %287 = load float, float* %arrayidx63.us.i.6, align 4, !tbaa !2
  %sub64.us.i.6 = fsub float %287, %add40.us.i.6
  store float %sub64.us.i.6, float* %arrayidx23.us.i.6, align 4, !tbaa !2
  %288 = load float, float* %arrayidx63.us.i.6, align 4, !tbaa !2
  %add76.us.i.6 = fadd float %add40.us.i.6, %288
  store float %add76.us.i.6, float* %arrayidx63.us.i.6, align 4, !tbaa !2
  %indvars.iv.next.i.6 = add nuw nsw i64 %indvars.iv.i.6, 1
  %niter.nsub.6 = sub i64 %niter.6, 1
  %289 = trunc i64 %indvars.iv.next.i.6 to i32
  %add14.us.i.1.6 = add i32 %add13.us.i.6, %289
  %idxprom15.us.i.1.6 = sext i32 %add14.us.i.1.6 to i64
  %arrayidx16.us.i.1.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.6
  %290 = load float, float* %arrayidx16.us.i.1.6, align 4, !tbaa !2
  %mul17.us.i.1.6 = fmul float %276, %290
  %arrayidx23.us.i.1.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.6
  %291 = load float, float* %arrayidx23.us.i.1.6, align 4, !tbaa !2
  %mul24.us.i.1.6 = fmul float %277, %291
  %sub25.us.i.1.6 = fsub float %mul17.us.i.1.6, %mul24.us.i.1.6
  %mul32.us.i.1.6 = fmul float %277, %290
  %mul39.us.i.1.6 = fmul float %276, %291
  %add40.us.i.1.6 = fadd float %mul32.us.i.1.6, %mul39.us.i.1.6
  %292 = add nuw nsw i64 %indvars.iv.next.i.6, %279
  %arrayidx45.us.i.1.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %292
  %293 = load float, float* %arrayidx45.us.i.1.6, align 4, !tbaa !2
  %sub46.us.i.1.6 = fsub float %293, %sub25.us.i.1.6
  store float %sub46.us.i.1.6, float* %arrayidx16.us.i.1.6, align 4, !tbaa !2
  %294 = load float, float* %arrayidx45.us.i.1.6, align 4, !tbaa !2
  %add58.us.i.1.6 = fadd float %sub25.us.i.1.6, %294
  store float %add58.us.i.1.6, float* %arrayidx45.us.i.1.6, align 4, !tbaa !2
  %arrayidx63.us.i.1.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %292
  %295 = load float, float* %arrayidx63.us.i.1.6, align 4, !tbaa !2
  %sub64.us.i.1.6 = fsub float %295, %add40.us.i.1.6
  store float %sub64.us.i.1.6, float* %arrayidx23.us.i.1.6, align 4, !tbaa !2
  %296 = load float, float* %arrayidx63.us.i.1.6, align 4, !tbaa !2
  %add76.us.i.1.6 = fadd float %add40.us.i.1.6, %296
  store float %add76.us.i.1.6, float* %arrayidx63.us.i.1.6, align 4, !tbaa !2
  %indvars.iv.next.i.1.6 = add nuw nsw i64 %indvars.iv.next.i.6, 1
  %niter.nsub.1.6 = sub i64 %niter.nsub.6, 1
  %297 = trunc i64 %indvars.iv.next.i.1.6 to i32
  %add14.us.i.2.6 = add i32 %add13.us.i.6, %297
  %idxprom15.us.i.2.6 = sext i32 %add14.us.i.2.6 to i64
  %arrayidx16.us.i.2.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.6
  %298 = load float, float* %arrayidx16.us.i.2.6, align 4, !tbaa !2
  %mul17.us.i.2.6 = fmul float %276, %298
  %arrayidx23.us.i.2.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.6
  %299 = load float, float* %arrayidx23.us.i.2.6, align 4, !tbaa !2
  %mul24.us.i.2.6 = fmul float %277, %299
  %sub25.us.i.2.6 = fsub float %mul17.us.i.2.6, %mul24.us.i.2.6
  %mul32.us.i.2.6 = fmul float %277, %298
  %mul39.us.i.2.6 = fmul float %276, %299
  %add40.us.i.2.6 = fadd float %mul32.us.i.2.6, %mul39.us.i.2.6
  %300 = add nuw nsw i64 %indvars.iv.next.i.1.6, %279
  %arrayidx45.us.i.2.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %300
  %301 = load float, float* %arrayidx45.us.i.2.6, align 4, !tbaa !2
  %sub46.us.i.2.6 = fsub float %301, %sub25.us.i.2.6
  store float %sub46.us.i.2.6, float* %arrayidx16.us.i.2.6, align 4, !tbaa !2
  %302 = load float, float* %arrayidx45.us.i.2.6, align 4, !tbaa !2
  %add58.us.i.2.6 = fadd float %sub25.us.i.2.6, %302
  store float %add58.us.i.2.6, float* %arrayidx45.us.i.2.6, align 4, !tbaa !2
  %arrayidx63.us.i.2.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %300
  %303 = load float, float* %arrayidx63.us.i.2.6, align 4, !tbaa !2
  %sub64.us.i.2.6 = fsub float %303, %add40.us.i.2.6
  store float %sub64.us.i.2.6, float* %arrayidx23.us.i.2.6, align 4, !tbaa !2
  %304 = load float, float* %arrayidx63.us.i.2.6, align 4, !tbaa !2
  %add76.us.i.2.6 = fadd float %add40.us.i.2.6, %304
  store float %add76.us.i.2.6, float* %arrayidx63.us.i.2.6, align 4, !tbaa !2
  %indvars.iv.next.i.2.6 = add nuw nsw i64 %indvars.iv.next.i.1.6, 1
  %niter.nsub.2.6 = sub i64 %niter.nsub.1.6, 1
  %305 = trunc i64 %indvars.iv.next.i.2.6 to i32
  %add14.us.i.3.6 = add i32 %add13.us.i.6, %305
  %idxprom15.us.i.3.6 = sext i32 %add14.us.i.3.6 to i64
  %arrayidx16.us.i.3.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.6
  %306 = load float, float* %arrayidx16.us.i.3.6, align 4, !tbaa !2
  %mul17.us.i.3.6 = fmul float %276, %306
  %arrayidx23.us.i.3.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.6
  %307 = load float, float* %arrayidx23.us.i.3.6, align 4, !tbaa !2
  %mul24.us.i.3.6 = fmul float %277, %307
  %sub25.us.i.3.6 = fsub float %mul17.us.i.3.6, %mul24.us.i.3.6
  %mul32.us.i.3.6 = fmul float %277, %306
  %mul39.us.i.3.6 = fmul float %276, %307
  %add40.us.i.3.6 = fadd float %mul32.us.i.3.6, %mul39.us.i.3.6
  %308 = add nuw nsw i64 %indvars.iv.next.i.2.6, %279
  %arrayidx45.us.i.3.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %308
  %309 = load float, float* %arrayidx45.us.i.3.6, align 4, !tbaa !2
  %sub46.us.i.3.6 = fsub float %309, %sub25.us.i.3.6
  store float %sub46.us.i.3.6, float* %arrayidx16.us.i.3.6, align 4, !tbaa !2
  %310 = load float, float* %arrayidx45.us.i.3.6, align 4, !tbaa !2
  %add58.us.i.3.6 = fadd float %sub25.us.i.3.6, %310
  store float %add58.us.i.3.6, float* %arrayidx45.us.i.3.6, align 4, !tbaa !2
  %arrayidx63.us.i.3.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %308
  %311 = load float, float* %arrayidx63.us.i.3.6, align 4, !tbaa !2
  %sub64.us.i.3.6 = fsub float %311, %add40.us.i.3.6
  store float %sub64.us.i.3.6, float* %arrayidx23.us.i.3.6, align 4, !tbaa !2
  %312 = load float, float* %arrayidx63.us.i.3.6, align 4, !tbaa !2
  %add76.us.i.3.6 = fadd float %add40.us.i.3.6, %312
  store float %add76.us.i.3.6, float* %arrayidx63.us.i.3.6, align 4, !tbaa !2
  %indvars.iv.next.i.3.6 = add nuw nsw i64 %indvars.iv.next.i.2.6, 1
  %niter.nsub.3.6 = sub i64 %niter.nsub.2.6, 1
  %niter.ncmp.3.6 = icmp eq i64 %niter.nsub.3.6, 0
  br i1 %niter.ncmp.3.6, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.6, label %for.body11.us.i.6, !llvm.loop !8

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.6: ; preds = %for.body11.us.i.6
  %indvars.iv.i.unr.ph.6 = phi i64 [ %indvars.iv.next.i.3.6, %for.body11.us.i.6 ]
  br label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.6

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.6:   ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.6, %for.body3.us.i.6
  %indvars.iv.i.unr.6 = phi i64 [ 0, %for.body3.us.i.6 ], [ %indvars.iv.i.unr.ph.6, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.6 ]
  br i1 true, label %for.body11.us.i.epil.preheader.6, label %for.cond9.for.inc77_crit_edge.us.i.6

for.body11.us.i.epil.preheader.6:                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.6
  br label %for.body11.us.i.epil.6

for.body11.us.i.epil.6:                           ; preds = %for.body11.us.i.epil.6, %for.body11.us.i.epil.preheader.6
  %indvars.iv.i.epil.6 = phi i64 [ %indvars.iv.i.unr.6, %for.body11.us.i.epil.preheader.6 ], [ %indvars.iv.next.i.epil.6, %for.body11.us.i.epil.6 ]
  %epil.iter.6 = phi i64 [ 2, %for.body11.us.i.epil.preheader.6 ], [ %epil.iter.sub.6, %for.body11.us.i.epil.6 ]
  %313 = trunc i64 %indvars.iv.i.epil.6 to i32
  %add14.us.i.epil.6 = add i32 %add13.us.i.6, %313
  %idxprom15.us.i.epil.6 = sext i32 %add14.us.i.epil.6 to i64
  %arrayidx16.us.i.epil.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.epil.6
  %314 = load float, float* %arrayidx16.us.i.epil.6, align 4, !tbaa !2
  %mul17.us.i.epil.6 = fmul float %276, %314
  %arrayidx23.us.i.epil.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.epil.6
  %315 = load float, float* %arrayidx23.us.i.epil.6, align 4, !tbaa !2
  %mul24.us.i.epil.6 = fmul float %277, %315
  %sub25.us.i.epil.6 = fsub float %mul17.us.i.epil.6, %mul24.us.i.epil.6
  %mul32.us.i.epil.6 = fmul float %277, %314
  %mul39.us.i.epil.6 = fmul float %276, %315
  %add40.us.i.epil.6 = fadd float %mul32.us.i.epil.6, %mul39.us.i.epil.6
  %316 = add nuw nsw i64 %indvars.iv.i.epil.6, %279
  %arrayidx45.us.i.epil.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %316
  %317 = load float, float* %arrayidx45.us.i.epil.6, align 4, !tbaa !2
  %sub46.us.i.epil.6 = fsub float %317, %sub25.us.i.epil.6
  store float %sub46.us.i.epil.6, float* %arrayidx16.us.i.epil.6, align 4, !tbaa !2
  %318 = load float, float* %arrayidx45.us.i.epil.6, align 4, !tbaa !2
  %add58.us.i.epil.6 = fadd float %sub25.us.i.epil.6, %318
  store float %add58.us.i.epil.6, float* %arrayidx45.us.i.epil.6, align 4, !tbaa !2
  %arrayidx63.us.i.epil.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %316
  %319 = load float, float* %arrayidx63.us.i.epil.6, align 4, !tbaa !2
  %sub64.us.i.epil.6 = fsub float %319, %add40.us.i.epil.6
  store float %sub64.us.i.epil.6, float* %arrayidx23.us.i.epil.6, align 4, !tbaa !2
  %320 = load float, float* %arrayidx63.us.i.epil.6, align 4, !tbaa !2
  %add76.us.i.epil.6 = fadd float %add40.us.i.epil.6, %320
  store float %add76.us.i.epil.6, float* %arrayidx63.us.i.epil.6, align 4, !tbaa !2
  %indvars.iv.next.i.epil.6 = add nuw nsw i64 %indvars.iv.i.epil.6, 1
  %epil.iter.sub.6 = sub i64 %epil.iter.6, 1
  %epil.iter.cmp.6 = icmp ne i64 %epil.iter.sub.6, 0
  br i1 %epil.iter.cmp.6, label %for.body11.us.i.epil.6, label %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.6, !llvm.loop !9

for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.6: ; preds = %for.body11.us.i.epil.6
  br label %for.cond9.for.inc77_crit_edge.us.i.6

for.cond9.for.inc77_crit_edge.us.i.6:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.6, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.6
  %indvars.iv.next163.i.6 = add nuw nsw i64 %indvars.iv162.i.6, 1
  %exitcond168.i.6 = icmp eq i64 %indvars.iv.next163.i.6, 64
  br i1 %exitcond168.i.6, label %for.end79.i.loopexit.6, label %for.body3.us.i.6

for.end79.i.loopexit.6:                           ; preds = %for.cond9.for.inc77_crit_edge.us.i.6
  br label %for.end79.i.6

for.end79.i.6:                                    ; preds = %for.end79.i.loopexit.6, %for.end79.i.5
  br i1 true, label %for.body3.us.preheader.i.7, label %for.end79.i.7

for.body3.us.preheader.i.7:                       ; preds = %for.end79.i.6
  br label %for.body3.us.i.7

for.body3.us.i.7:                                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.7, %for.body3.us.preheader.i.7
  %indvars.iv162.i.7 = phi i64 [ 0, %for.body3.us.preheader.i.7 ], [ %indvars.iv.next163.i.7, %for.cond9.for.inc77_crit_edge.us.i.7 ]
  %321 = add nsw i64 %indvars.iv162.i.7, 127
  %arrayidx.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %321
  %322 = load float, float* %arrayidx.us.i.7, align 4, !tbaa !2
  %arrayidx8.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %321
  %323 = load float, float* %arrayidx8.us.i.7, align 4, !tbaa !2
  %324 = shl nuw nsw i64 %indvars.iv162.i.7, 1
  %325 = trunc i64 %324 to i32
  %add13.us.i.7 = add i32 1, %325
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.7, label %for.body3.us.i.new.7

for.body3.us.i.new.7:                             ; preds = %for.body3.us.i.7
  br label %for.body11.us.i.7

for.body11.us.i.7:                                ; preds = %for.body11.us.i.7, %for.body3.us.i.new.7
  %indvars.iv.i.7 = phi i64 [ 0, %for.body3.us.i.new.7 ], [ %indvars.iv.next.i.3.7, %for.body11.us.i.7 ]
  %niter.7 = phi i64 [ 0, %for.body3.us.i.new.7 ], [ %niter.nsub.3.7, %for.body11.us.i.7 ]
  %326 = trunc i64 %indvars.iv.i.7 to i32
  %add14.us.i.7 = add i32 %add13.us.i.7, %326
  %idxprom15.us.i.7 = sext i32 %add14.us.i.7 to i64
  %arrayidx16.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.7
  %327 = load float, float* %arrayidx16.us.i.7, align 4, !tbaa !2
  %mul17.us.i.7 = fmul float %322, %327
  %arrayidx23.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.7
  %328 = load float, float* %arrayidx23.us.i.7, align 4, !tbaa !2
  %mul24.us.i.7 = fmul float %323, %328
  %sub25.us.i.7 = fsub float %mul17.us.i.7, %mul24.us.i.7
  %mul32.us.i.7 = fmul float %323, %327
  %mul39.us.i.7 = fmul float %322, %328
  %add40.us.i.7 = fadd float %mul32.us.i.7, %mul39.us.i.7
  %329 = add nuw nsw i64 %indvars.iv.i.7, %324
  %arrayidx45.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %329
  %330 = load float, float* %arrayidx45.us.i.7, align 4, !tbaa !2
  %sub46.us.i.7 = fsub float %330, %sub25.us.i.7
  store float %sub46.us.i.7, float* %arrayidx16.us.i.7, align 4, !tbaa !2
  %331 = load float, float* %arrayidx45.us.i.7, align 4, !tbaa !2
  %add58.us.i.7 = fadd float %sub25.us.i.7, %331
  store float %add58.us.i.7, float* %arrayidx45.us.i.7, align 4, !tbaa !2
  %arrayidx63.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %329
  %332 = load float, float* %arrayidx63.us.i.7, align 4, !tbaa !2
  %sub64.us.i.7 = fsub float %332, %add40.us.i.7
  store float %sub64.us.i.7, float* %arrayidx23.us.i.7, align 4, !tbaa !2
  %333 = load float, float* %arrayidx63.us.i.7, align 4, !tbaa !2
  %add76.us.i.7 = fadd float %add40.us.i.7, %333
  store float %add76.us.i.7, float* %arrayidx63.us.i.7, align 4, !tbaa !2
  %indvars.iv.next.i.7 = add nuw nsw i64 %indvars.iv.i.7, 1
  %niter.nsub.7 = sub i64 %niter.7, 1
  %334 = trunc i64 %indvars.iv.next.i.7 to i32
  %add14.us.i.1.7 = add i32 %add13.us.i.7, %334
  %idxprom15.us.i.1.7 = sext i32 %add14.us.i.1.7 to i64
  %arrayidx16.us.i.1.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.7
  %335 = load float, float* %arrayidx16.us.i.1.7, align 4, !tbaa !2
  %mul17.us.i.1.7 = fmul float %322, %335
  %arrayidx23.us.i.1.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.7
  %336 = load float, float* %arrayidx23.us.i.1.7, align 4, !tbaa !2
  %mul24.us.i.1.7 = fmul float %323, %336
  %sub25.us.i.1.7 = fsub float %mul17.us.i.1.7, %mul24.us.i.1.7
  %mul32.us.i.1.7 = fmul float %323, %335
  %mul39.us.i.1.7 = fmul float %322, %336
  %add40.us.i.1.7 = fadd float %mul32.us.i.1.7, %mul39.us.i.1.7
  %337 = add nuw nsw i64 %indvars.iv.next.i.7, %324
  %arrayidx45.us.i.1.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %337
  %338 = load float, float* %arrayidx45.us.i.1.7, align 4, !tbaa !2
  %sub46.us.i.1.7 = fsub float %338, %sub25.us.i.1.7
  store float %sub46.us.i.1.7, float* %arrayidx16.us.i.1.7, align 4, !tbaa !2
  %339 = load float, float* %arrayidx45.us.i.1.7, align 4, !tbaa !2
  %add58.us.i.1.7 = fadd float %sub25.us.i.1.7, %339
  store float %add58.us.i.1.7, float* %arrayidx45.us.i.1.7, align 4, !tbaa !2
  %arrayidx63.us.i.1.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %337
  %340 = load float, float* %arrayidx63.us.i.1.7, align 4, !tbaa !2
  %sub64.us.i.1.7 = fsub float %340, %add40.us.i.1.7
  store float %sub64.us.i.1.7, float* %arrayidx23.us.i.1.7, align 4, !tbaa !2
  %341 = load float, float* %arrayidx63.us.i.1.7, align 4, !tbaa !2
  %add76.us.i.1.7 = fadd float %add40.us.i.1.7, %341
  store float %add76.us.i.1.7, float* %arrayidx63.us.i.1.7, align 4, !tbaa !2
  %indvars.iv.next.i.1.7 = add nuw nsw i64 %indvars.iv.next.i.7, 1
  %niter.nsub.1.7 = sub i64 %niter.nsub.7, 1
  %342 = trunc i64 %indvars.iv.next.i.1.7 to i32
  %add14.us.i.2.7 = add i32 %add13.us.i.7, %342
  %idxprom15.us.i.2.7 = sext i32 %add14.us.i.2.7 to i64
  %arrayidx16.us.i.2.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.7
  %343 = load float, float* %arrayidx16.us.i.2.7, align 4, !tbaa !2
  %mul17.us.i.2.7 = fmul float %322, %343
  %arrayidx23.us.i.2.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.7
  %344 = load float, float* %arrayidx23.us.i.2.7, align 4, !tbaa !2
  %mul24.us.i.2.7 = fmul float %323, %344
  %sub25.us.i.2.7 = fsub float %mul17.us.i.2.7, %mul24.us.i.2.7
  %mul32.us.i.2.7 = fmul float %323, %343
  %mul39.us.i.2.7 = fmul float %322, %344
  %add40.us.i.2.7 = fadd float %mul32.us.i.2.7, %mul39.us.i.2.7
  %345 = add nuw nsw i64 %indvars.iv.next.i.1.7, %324
  %arrayidx45.us.i.2.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %345
  %346 = load float, float* %arrayidx45.us.i.2.7, align 4, !tbaa !2
  %sub46.us.i.2.7 = fsub float %346, %sub25.us.i.2.7
  store float %sub46.us.i.2.7, float* %arrayidx16.us.i.2.7, align 4, !tbaa !2
  %347 = load float, float* %arrayidx45.us.i.2.7, align 4, !tbaa !2
  %add58.us.i.2.7 = fadd float %sub25.us.i.2.7, %347
  store float %add58.us.i.2.7, float* %arrayidx45.us.i.2.7, align 4, !tbaa !2
  %arrayidx63.us.i.2.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %345
  %348 = load float, float* %arrayidx63.us.i.2.7, align 4, !tbaa !2
  %sub64.us.i.2.7 = fsub float %348, %add40.us.i.2.7
  store float %sub64.us.i.2.7, float* %arrayidx23.us.i.2.7, align 4, !tbaa !2
  %349 = load float, float* %arrayidx63.us.i.2.7, align 4, !tbaa !2
  %add76.us.i.2.7 = fadd float %add40.us.i.2.7, %349
  store float %add76.us.i.2.7, float* %arrayidx63.us.i.2.7, align 4, !tbaa !2
  %indvars.iv.next.i.2.7 = add nuw nsw i64 %indvars.iv.next.i.1.7, 1
  %niter.nsub.2.7 = sub i64 %niter.nsub.1.7, 1
  %350 = trunc i64 %indvars.iv.next.i.2.7 to i32
  %add14.us.i.3.7 = add i32 %add13.us.i.7, %350
  %idxprom15.us.i.3.7 = sext i32 %add14.us.i.3.7 to i64
  %arrayidx16.us.i.3.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.7
  %351 = load float, float* %arrayidx16.us.i.3.7, align 4, !tbaa !2
  %mul17.us.i.3.7 = fmul float %322, %351
  %arrayidx23.us.i.3.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.7
  %352 = load float, float* %arrayidx23.us.i.3.7, align 4, !tbaa !2
  %mul24.us.i.3.7 = fmul float %323, %352
  %sub25.us.i.3.7 = fsub float %mul17.us.i.3.7, %mul24.us.i.3.7
  %mul32.us.i.3.7 = fmul float %323, %351
  %mul39.us.i.3.7 = fmul float %322, %352
  %add40.us.i.3.7 = fadd float %mul32.us.i.3.7, %mul39.us.i.3.7
  %353 = add nuw nsw i64 %indvars.iv.next.i.2.7, %324
  %arrayidx45.us.i.3.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %353
  %354 = load float, float* %arrayidx45.us.i.3.7, align 4, !tbaa !2
  %sub46.us.i.3.7 = fsub float %354, %sub25.us.i.3.7
  store float %sub46.us.i.3.7, float* %arrayidx16.us.i.3.7, align 4, !tbaa !2
  %355 = load float, float* %arrayidx45.us.i.3.7, align 4, !tbaa !2
  %add58.us.i.3.7 = fadd float %sub25.us.i.3.7, %355
  store float %add58.us.i.3.7, float* %arrayidx45.us.i.3.7, align 4, !tbaa !2
  %arrayidx63.us.i.3.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %353
  %356 = load float, float* %arrayidx63.us.i.3.7, align 4, !tbaa !2
  %sub64.us.i.3.7 = fsub float %356, %add40.us.i.3.7
  store float %sub64.us.i.3.7, float* %arrayidx23.us.i.3.7, align 4, !tbaa !2
  %357 = load float, float* %arrayidx63.us.i.3.7, align 4, !tbaa !2
  %add76.us.i.3.7 = fadd float %add40.us.i.3.7, %357
  store float %add76.us.i.3.7, float* %arrayidx63.us.i.3.7, align 4, !tbaa !2
  %indvars.iv.next.i.3.7 = add nuw nsw i64 %indvars.iv.next.i.2.7, 1
  %niter.nsub.3.7 = sub i64 %niter.nsub.2.7, 1
  %niter.ncmp.3.7 = icmp eq i64 %niter.nsub.3.7, 0
  br i1 %niter.ncmp.3.7, label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.7, label %for.body11.us.i.7, !llvm.loop !8

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.7: ; preds = %for.body11.us.i.7
  %indvars.iv.i.unr.ph.7 = phi i64 [ %indvars.iv.next.i.3.7, %for.body11.us.i.7 ]
  br label %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.7

for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.7:   ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.7, %for.body3.us.i.7
  %indvars.iv.i.unr.7 = phi i64 [ 0, %for.body3.us.i.7 ], [ %indvars.iv.i.unr.ph.7, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.loopexit.7 ]
  br i1 true, label %for.body11.us.i.epil.preheader.7, label %for.cond9.for.inc77_crit_edge.us.i.7

for.body11.us.i.epil.preheader.7:                 ; preds = %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.7
  br label %for.body11.us.i.epil.7

for.body11.us.i.epil.7:                           ; preds = %for.body11.us.i.epil.7, %for.body11.us.i.epil.preheader.7
  %indvars.iv.i.epil.7 = phi i64 [ %indvars.iv.i.unr.7, %for.body11.us.i.epil.preheader.7 ], [ %indvars.iv.next.i.epil.7, %for.body11.us.i.epil.7 ]
  %epil.iter.7 = phi i64 [ 1, %for.body11.us.i.epil.preheader.7 ], [ %epil.iter.sub.7, %for.body11.us.i.epil.7 ]
  %358 = trunc i64 %indvars.iv.i.epil.7 to i32
  %add14.us.i.epil.7 = add i32 %add13.us.i.7, %358
  %idxprom15.us.i.epil.7 = sext i32 %add14.us.i.epil.7 to i64
  %arrayidx16.us.i.epil.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.epil.7
  %359 = load float, float* %arrayidx16.us.i.epil.7, align 4, !tbaa !2
  %mul17.us.i.epil.7 = fmul float %322, %359
  %arrayidx23.us.i.epil.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.epil.7
  %360 = load float, float* %arrayidx23.us.i.epil.7, align 4, !tbaa !2
  %mul24.us.i.epil.7 = fmul float %323, %360
  %sub25.us.i.epil.7 = fsub float %mul17.us.i.epil.7, %mul24.us.i.epil.7
  %mul32.us.i.epil.7 = fmul float %323, %359
  %mul39.us.i.epil.7 = fmul float %322, %360
  %add40.us.i.epil.7 = fadd float %mul32.us.i.epil.7, %mul39.us.i.epil.7
  %361 = add nuw nsw i64 %indvars.iv.i.epil.7, %324
  %arrayidx45.us.i.epil.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %361
  %362 = load float, float* %arrayidx45.us.i.epil.7, align 4, !tbaa !2
  %sub46.us.i.epil.7 = fsub float %362, %sub25.us.i.epil.7
  store float %sub46.us.i.epil.7, float* %arrayidx16.us.i.epil.7, align 4, !tbaa !2
  %363 = load float, float* %arrayidx45.us.i.epil.7, align 4, !tbaa !2
  %add58.us.i.epil.7 = fadd float %sub25.us.i.epil.7, %363
  store float %add58.us.i.epil.7, float* %arrayidx45.us.i.epil.7, align 4, !tbaa !2
  %arrayidx63.us.i.epil.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %361
  %364 = load float, float* %arrayidx63.us.i.epil.7, align 4, !tbaa !2
  %sub64.us.i.epil.7 = fsub float %364, %add40.us.i.epil.7
  store float %sub64.us.i.epil.7, float* %arrayidx23.us.i.epil.7, align 4, !tbaa !2
  %365 = load float, float* %arrayidx63.us.i.epil.7, align 4, !tbaa !2
  %add76.us.i.epil.7 = fadd float %add40.us.i.epil.7, %365
  store float %add76.us.i.epil.7, float* %arrayidx63.us.i.epil.7, align 4, !tbaa !2
  %indvars.iv.next.i.epil.7 = add nuw nsw i64 %indvars.iv.i.epil.7, 1
  %epil.iter.sub.7 = sub i64 %epil.iter.7, 1
  %epil.iter.cmp.7 = icmp ne i64 %epil.iter.sub.7, 0
  br i1 %epil.iter.cmp.7, label %for.body11.us.i.epil.7, label %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.7, !llvm.loop !9

for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.7: ; preds = %for.body11.us.i.epil.7
  br label %for.cond9.for.inc77_crit_edge.us.i.7

for.cond9.for.inc77_crit_edge.us.i.7:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.epilog-lcssa.7, %for.cond9.for.inc77_crit_edge.us.i.unr-lcssa.7
  %indvars.iv.next163.i.7 = add nuw nsw i64 %indvars.iv162.i.7, 1
  %exitcond168.i.7 = icmp eq i64 %indvars.iv.next163.i.7, 128
  br i1 %exitcond168.i.7, label %for.end79.i.loopexit.7, label %for.body3.us.i.7

for.end79.i.loopexit.7:                           ; preds = %for.cond9.for.inc77_crit_edge.us.i.7
  br label %for.end79.i.7

for.end79.i.7:                                    ; preds = %for.end79.i.loopexit.7, %for.end79.i.6
  %call5 = tail call i32 (float*, i32, i32, ...) bitcast (i32 (...)* @output_dsp to i32 (float*, i32, i32, ...)*)(float* getelementptr inbounds ([256 x float], [256 x float]* @data_real, i64 0, i64 0), i32 256, i32 0) #3
  %call6 = tail call i32 (float*, i32, i32, ...) bitcast (i32 (...)* @output_dsp to i32 (float*, i32, i32, ...)*)(float* getelementptr inbounds ([256 x float], [256 x float]* @data_imag, i64 0, i64 0), i32 256, i32 0) #3
  %call7 = tail call i32 (float*, i32, i32, ...) bitcast (i32 (...)* @output_dsp to i32 (float*, i32, i32, ...)*)(float* getelementptr inbounds ([256 x float], [256 x float]* @coef_real, i64 0, i64 0), i32 256, i32 0) #3
  %call8 = tail call i32 (float*, i32, i32, ...) bitcast (i32 (...)* @output_dsp to i32 (float*, i32, i32, ...)*)(float* getelementptr inbounds ([256 x float], [256 x float]* @coef_imag, i64 0, i64 0), i32 256, i32 0) #3
  ret i32 0
}

declare dso_local i32 @input_dsp(...) local_unnamed_addr #1

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(float* nocapture %data_real, float* nocapture %data_imag, float* nocapture readonly %coef_real, float* nocapture readonly %coef_imag) local_unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry
  br i1 true, label %for.body3.us.preheader, label %for.end79

for.body3.us.preheader:                           ; preds = %for.cond1.preheader
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond9.for.inc77_crit_edge.us, %for.body3.us.preheader
  %indvars.iv162 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next163, %for.cond9.for.inc77_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds float, float* %coef_real, i64 %indvars.iv162
  %0 = load float, float* %arrayidx.us, align 4, !tbaa !2
  %arrayidx8.us = getelementptr inbounds float, float* %coef_imag, i64 %indvars.iv162
  %1 = load float, float* %arrayidx8.us, align 4, !tbaa !2
  %2 = shl nuw nsw i64 %indvars.iv162, 1
  %3 = mul nsw i64 %2, 128
  %4 = trunc i64 %3 to i32
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa, label %for.body3.us.new

for.body3.us.new:                                 ; preds = %for.body3.us
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us, %for.body3.us.new
  %indvars.iv = phi i64 [ 0, %for.body3.us.new ], [ %indvars.iv.next.3, %for.body11.us ]
  %niter = phi i64 [ 128, %for.body3.us.new ], [ %niter.nsub.3, %for.body11.us ]
  %5 = trunc i64 %indvars.iv to i32
  %add13.us = add i32 %5, %4
  %add14.us = add i32 %add13.us, 128
  %idxprom15.us = sext i32 %add14.us to i64
  %arrayidx16.us = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us
  %6 = load float, float* %arrayidx16.us, align 4, !tbaa !2
  %mul17.us = fmul float %0, %6
  %arrayidx23.us = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us
  %7 = load float, float* %arrayidx23.us, align 4, !tbaa !2
  %mul24.us = fmul float %1, %7
  %sub25.us = fsub float %mul17.us, %mul24.us
  %mul32.us = fmul float %1, %6
  %mul39.us = fmul float %0, %7
  %add40.us = fadd float %mul32.us, %mul39.us
  %8 = add nuw nsw i64 %indvars.iv, %3
  %arrayidx45.us = getelementptr inbounds float, float* %data_real, i64 %8
  %9 = load float, float* %arrayidx45.us, align 4, !tbaa !2
  %sub46.us = fsub float %9, %sub25.us
  store float %sub46.us, float* %arrayidx16.us, align 4, !tbaa !2
  %10 = load float, float* %arrayidx45.us, align 4, !tbaa !2
  %add58.us = fadd float %sub25.us, %10
  store float %add58.us, float* %arrayidx45.us, align 4, !tbaa !2
  %arrayidx63.us = getelementptr inbounds float, float* %data_imag, i64 %8
  %11 = load float, float* %arrayidx63.us, align 4, !tbaa !2
  %sub64.us = fsub float %11, %add40.us
  store float %sub64.us, float* %arrayidx23.us, align 4, !tbaa !2
  %12 = load float, float* %arrayidx63.us, align 4, !tbaa !2
  %add76.us = fadd float %add40.us, %12
  store float %add76.us, float* %arrayidx63.us, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %niter.nsub = sub i64 %niter, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %add13.us.1 = add i32 %13, %4
  %add14.us.1 = add i32 %add13.us.1, 128
  %idxprom15.us.1 = sext i32 %add14.us.1 to i64
  %arrayidx16.us.1 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1
  %14 = load float, float* %arrayidx16.us.1, align 4, !tbaa !2
  %mul17.us.1 = fmul float %0, %14
  %arrayidx23.us.1 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1
  %15 = load float, float* %arrayidx23.us.1, align 4, !tbaa !2
  %mul24.us.1 = fmul float %1, %15
  %sub25.us.1 = fsub float %mul17.us.1, %mul24.us.1
  %mul32.us.1 = fmul float %1, %14
  %mul39.us.1 = fmul float %0, %15
  %add40.us.1 = fadd float %mul32.us.1, %mul39.us.1
  %16 = add nuw nsw i64 %indvars.iv.next, %3
  %arrayidx45.us.1 = getelementptr inbounds float, float* %data_real, i64 %16
  %17 = load float, float* %arrayidx45.us.1, align 4, !tbaa !2
  %sub46.us.1 = fsub float %17, %sub25.us.1
  store float %sub46.us.1, float* %arrayidx16.us.1, align 4, !tbaa !2
  %18 = load float, float* %arrayidx45.us.1, align 4, !tbaa !2
  %add58.us.1 = fadd float %sub25.us.1, %18
  store float %add58.us.1, float* %arrayidx45.us.1, align 4, !tbaa !2
  %arrayidx63.us.1 = getelementptr inbounds float, float* %data_imag, i64 %16
  %19 = load float, float* %arrayidx63.us.1, align 4, !tbaa !2
  %sub64.us.1 = fsub float %19, %add40.us.1
  store float %sub64.us.1, float* %arrayidx23.us.1, align 4, !tbaa !2
  %20 = load float, float* %arrayidx63.us.1, align 4, !tbaa !2
  %add76.us.1 = fadd float %add40.us.1, %20
  store float %add76.us.1, float* %arrayidx63.us.1, align 4, !tbaa !2
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1
  %niter.nsub.1 = sub i64 %niter.nsub, 1
  %21 = trunc i64 %indvars.iv.next.1 to i32
  %add13.us.2 = add i32 %21, %4
  %add14.us.2 = add i32 %add13.us.2, 128
  %idxprom15.us.2 = sext i32 %add14.us.2 to i64
  %arrayidx16.us.2 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2
  %22 = load float, float* %arrayidx16.us.2, align 4, !tbaa !2
  %mul17.us.2 = fmul float %0, %22
  %arrayidx23.us.2 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2
  %23 = load float, float* %arrayidx23.us.2, align 4, !tbaa !2
  %mul24.us.2 = fmul float %1, %23
  %sub25.us.2 = fsub float %mul17.us.2, %mul24.us.2
  %mul32.us.2 = fmul float %1, %22
  %mul39.us.2 = fmul float %0, %23
  %add40.us.2 = fadd float %mul32.us.2, %mul39.us.2
  %24 = add nuw nsw i64 %indvars.iv.next.1, %3
  %arrayidx45.us.2 = getelementptr inbounds float, float* %data_real, i64 %24
  %25 = load float, float* %arrayidx45.us.2, align 4, !tbaa !2
  %sub46.us.2 = fsub float %25, %sub25.us.2
  store float %sub46.us.2, float* %arrayidx16.us.2, align 4, !tbaa !2
  %26 = load float, float* %arrayidx45.us.2, align 4, !tbaa !2
  %add58.us.2 = fadd float %sub25.us.2, %26
  store float %add58.us.2, float* %arrayidx45.us.2, align 4, !tbaa !2
  %arrayidx63.us.2 = getelementptr inbounds float, float* %data_imag, i64 %24
  %27 = load float, float* %arrayidx63.us.2, align 4, !tbaa !2
  %sub64.us.2 = fsub float %27, %add40.us.2
  store float %sub64.us.2, float* %arrayidx23.us.2, align 4, !tbaa !2
  %28 = load float, float* %arrayidx63.us.2, align 4, !tbaa !2
  %add76.us.2 = fadd float %add40.us.2, %28
  store float %add76.us.2, float* %arrayidx63.us.2, align 4, !tbaa !2
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1
  %niter.nsub.2 = sub i64 %niter.nsub.1, 1
  %29 = trunc i64 %indvars.iv.next.2 to i32
  %add13.us.3 = add i32 %29, %4
  %add14.us.3 = add i32 %add13.us.3, 128
  %idxprom15.us.3 = sext i32 %add14.us.3 to i64
  %arrayidx16.us.3 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3
  %30 = load float, float* %arrayidx16.us.3, align 4, !tbaa !2
  %mul17.us.3 = fmul float %0, %30
  %arrayidx23.us.3 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3
  %31 = load float, float* %arrayidx23.us.3, align 4, !tbaa !2
  %mul24.us.3 = fmul float %1, %31
  %sub25.us.3 = fsub float %mul17.us.3, %mul24.us.3
  %mul32.us.3 = fmul float %1, %30
  %mul39.us.3 = fmul float %0, %31
  %add40.us.3 = fadd float %mul32.us.3, %mul39.us.3
  %32 = add nuw nsw i64 %indvars.iv.next.2, %3
  %arrayidx45.us.3 = getelementptr inbounds float, float* %data_real, i64 %32
  %33 = load float, float* %arrayidx45.us.3, align 4, !tbaa !2
  %sub46.us.3 = fsub float %33, %sub25.us.3
  store float %sub46.us.3, float* %arrayidx16.us.3, align 4, !tbaa !2
  %34 = load float, float* %arrayidx45.us.3, align 4, !tbaa !2
  %add58.us.3 = fadd float %sub25.us.3, %34
  store float %add58.us.3, float* %arrayidx45.us.3, align 4, !tbaa !2
  %arrayidx63.us.3 = getelementptr inbounds float, float* %data_imag, i64 %32
  %35 = load float, float* %arrayidx63.us.3, align 4, !tbaa !2
  %sub64.us.3 = fsub float %35, %add40.us.3
  store float %sub64.us.3, float* %arrayidx23.us.3, align 4, !tbaa !2
  %36 = load float, float* %arrayidx63.us.3, align 4, !tbaa !2
  %add76.us.3 = fadd float %add40.us.3, %36
  store float %add76.us.3, float* %arrayidx63.us.3, align 4, !tbaa !2
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1
  %niter.nsub.3 = sub i64 %niter.nsub.2, 1
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit, label %for.body11.us, !llvm.loop !10

for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit: ; preds = %for.body11.us
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.3, %for.body11.us ]
  br label %for.cond9.for.inc77_crit_edge.us.unr-lcssa

for.cond9.for.inc77_crit_edge.us.unr-lcssa:       ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit, %for.body3.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.unr.ph, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit ]
  br i1 false, label %for.body11.us.epil.preheader, label %for.cond9.for.inc77_crit_edge.us

for.body11.us.epil.preheader:                     ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa
  br label %for.body11.us.epil

for.body11.us.epil:                               ; preds = %for.body11.us.epil, %for.body11.us.epil.preheader
  %indvars.iv.epil = phi i64 [ %indvars.iv.unr, %for.body11.us.epil.preheader ], [ %indvars.iv.next.epil, %for.body11.us.epil ]
  %epil.iter = phi i64 [ 0, %for.body11.us.epil.preheader ], [ %epil.iter.sub, %for.body11.us.epil ]
  %37 = trunc i64 %indvars.iv.epil to i32
  %add13.us.epil = add i32 %37, %4
  %add14.us.epil = add i32 %add13.us.epil, 128
  %idxprom15.us.epil = sext i32 %add14.us.epil to i64
  %arrayidx16.us.epil = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.epil
  %38 = load float, float* %arrayidx16.us.epil, align 4, !tbaa !2
  %mul17.us.epil = fmul float %0, %38
  %arrayidx23.us.epil = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.epil
  %39 = load float, float* %arrayidx23.us.epil, align 4, !tbaa !2
  %mul24.us.epil = fmul float %1, %39
  %sub25.us.epil = fsub float %mul17.us.epil, %mul24.us.epil
  %mul32.us.epil = fmul float %1, %38
  %mul39.us.epil = fmul float %0, %39
  %add40.us.epil = fadd float %mul32.us.epil, %mul39.us.epil
  %40 = add nuw nsw i64 %indvars.iv.epil, %3
  %arrayidx45.us.epil = getelementptr inbounds float, float* %data_real, i64 %40
  %41 = load float, float* %arrayidx45.us.epil, align 4, !tbaa !2
  %sub46.us.epil = fsub float %41, %sub25.us.epil
  store float %sub46.us.epil, float* %arrayidx16.us.epil, align 4, !tbaa !2
  %42 = load float, float* %arrayidx45.us.epil, align 4, !tbaa !2
  %add58.us.epil = fadd float %sub25.us.epil, %42
  store float %add58.us.epil, float* %arrayidx45.us.epil, align 4, !tbaa !2
  %arrayidx63.us.epil = getelementptr inbounds float, float* %data_imag, i64 %40
  %43 = load float, float* %arrayidx63.us.epil, align 4, !tbaa !2
  %sub64.us.epil = fsub float %43, %add40.us.epil
  store float %sub64.us.epil, float* %arrayidx23.us.epil, align 4, !tbaa !2
  %44 = load float, float* %arrayidx63.us.epil, align 4, !tbaa !2
  %add76.us.epil = fadd float %add40.us.epil, %44
  store float %add76.us.epil, float* %arrayidx63.us.epil, align 4, !tbaa !2
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.sub = sub i64 %epil.iter, 1
  %epil.iter.cmp = icmp ne i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %for.body11.us.epil, label %for.cond9.for.inc77_crit_edge.us.epilog-lcssa, !llvm.loop !11

for.cond9.for.inc77_crit_edge.us.epilog-lcssa:    ; preds = %for.body11.us.epil
  br label %for.cond9.for.inc77_crit_edge.us

for.cond9.for.inc77_crit_edge.us:                 ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa, %for.cond9.for.inc77_crit_edge.us.epilog-lcssa
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next163, 1
  br i1 %exitcond168, label %for.end79.loopexit, label %for.body3.us

for.end79.loopexit:                               ; preds = %for.cond9.for.inc77_crit_edge.us
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.cond1.preheader
  br i1 true, label %for.body3.us.preheader.1, label %for.end79.1

for.body3.us.preheader.1:                         ; preds = %for.end79
  br label %for.body3.us.1

for.body3.us.1:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.1, %for.body3.us.preheader.1
  %indvars.iv162.1 = phi i64 [ 0, %for.body3.us.preheader.1 ], [ %indvars.iv.next163.1, %for.cond9.for.inc77_crit_edge.us.1 ]
  %45 = add nsw i64 %indvars.iv162.1, 1
  %arrayidx.us.1 = getelementptr inbounds float, float* %coef_real, i64 %45
  %46 = load float, float* %arrayidx.us.1, align 4, !tbaa !2
  %arrayidx8.us.1 = getelementptr inbounds float, float* %coef_imag, i64 %45
  %47 = load float, float* %arrayidx8.us.1, align 4, !tbaa !2
  %48 = shl nuw nsw i64 %indvars.iv162.1, 1
  %49 = mul nsw i64 %48, 64
  %50 = trunc i64 %49 to i32
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.1, label %for.body3.us.new.1

for.body3.us.new.1:                               ; preds = %for.body3.us.1
  br label %for.body11.us.1

for.body11.us.1:                                  ; preds = %for.body11.us.1, %for.body3.us.new.1
  %indvars.iv.1 = phi i64 [ 0, %for.body3.us.new.1 ], [ %indvars.iv.next.3.1, %for.body11.us.1 ]
  %niter.1 = phi i64 [ 64, %for.body3.us.new.1 ], [ %niter.nsub.3.1, %for.body11.us.1 ]
  %51 = trunc i64 %indvars.iv.1 to i32
  %add13.us.11 = add i32 %51, %50
  %add14.us.12 = add i32 %add13.us.11, 64
  %idxprom15.us.13 = sext i32 %add14.us.12 to i64
  %arrayidx16.us.14 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.13
  %52 = load float, float* %arrayidx16.us.14, align 4, !tbaa !2
  %mul17.us.15 = fmul float %46, %52
  %arrayidx23.us.16 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.13
  %53 = load float, float* %arrayidx23.us.16, align 4, !tbaa !2
  %mul24.us.17 = fmul float %47, %53
  %sub25.us.18 = fsub float %mul17.us.15, %mul24.us.17
  %mul32.us.19 = fmul float %47, %52
  %mul39.us.110 = fmul float %46, %53
  %add40.us.111 = fadd float %mul32.us.19, %mul39.us.110
  %54 = add nuw nsw i64 %indvars.iv.1, %49
  %arrayidx45.us.112 = getelementptr inbounds float, float* %data_real, i64 %54
  %55 = load float, float* %arrayidx45.us.112, align 4, !tbaa !2
  %sub46.us.113 = fsub float %55, %sub25.us.18
  store float %sub46.us.113, float* %arrayidx16.us.14, align 4, !tbaa !2
  %56 = load float, float* %arrayidx45.us.112, align 4, !tbaa !2
  %add58.us.114 = fadd float %sub25.us.18, %56
  store float %add58.us.114, float* %arrayidx45.us.112, align 4, !tbaa !2
  %arrayidx63.us.115 = getelementptr inbounds float, float* %data_imag, i64 %54
  %57 = load float, float* %arrayidx63.us.115, align 4, !tbaa !2
  %sub64.us.116 = fsub float %57, %add40.us.111
  store float %sub64.us.116, float* %arrayidx23.us.16, align 4, !tbaa !2
  %58 = load float, float* %arrayidx63.us.115, align 4, !tbaa !2
  %add76.us.117 = fadd float %add40.us.111, %58
  store float %add76.us.117, float* %arrayidx63.us.115, align 4, !tbaa !2
  %indvars.iv.next.118 = add nuw nsw i64 %indvars.iv.1, 1
  %niter.nsub.119 = sub i64 %niter.1, 1
  %59 = trunc i64 %indvars.iv.next.118 to i32
  %add13.us.1.1 = add i32 %59, %50
  %add14.us.1.1 = add i32 %add13.us.1.1, 64
  %idxprom15.us.1.1 = sext i32 %add14.us.1.1 to i64
  %arrayidx16.us.1.1 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.1
  %60 = load float, float* %arrayidx16.us.1.1, align 4, !tbaa !2
  %mul17.us.1.1 = fmul float %46, %60
  %arrayidx23.us.1.1 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.1
  %61 = load float, float* %arrayidx23.us.1.1, align 4, !tbaa !2
  %mul24.us.1.1 = fmul float %47, %61
  %sub25.us.1.1 = fsub float %mul17.us.1.1, %mul24.us.1.1
  %mul32.us.1.1 = fmul float %47, %60
  %mul39.us.1.1 = fmul float %46, %61
  %add40.us.1.1 = fadd float %mul32.us.1.1, %mul39.us.1.1
  %62 = add nuw nsw i64 %indvars.iv.next.118, %49
  %arrayidx45.us.1.1 = getelementptr inbounds float, float* %data_real, i64 %62
  %63 = load float, float* %arrayidx45.us.1.1, align 4, !tbaa !2
  %sub46.us.1.1 = fsub float %63, %sub25.us.1.1
  store float %sub46.us.1.1, float* %arrayidx16.us.1.1, align 4, !tbaa !2
  %64 = load float, float* %arrayidx45.us.1.1, align 4, !tbaa !2
  %add58.us.1.1 = fadd float %sub25.us.1.1, %64
  store float %add58.us.1.1, float* %arrayidx45.us.1.1, align 4, !tbaa !2
  %arrayidx63.us.1.1 = getelementptr inbounds float, float* %data_imag, i64 %62
  %65 = load float, float* %arrayidx63.us.1.1, align 4, !tbaa !2
  %sub64.us.1.1 = fsub float %65, %add40.us.1.1
  store float %sub64.us.1.1, float* %arrayidx23.us.1.1, align 4, !tbaa !2
  %66 = load float, float* %arrayidx63.us.1.1, align 4, !tbaa !2
  %add76.us.1.1 = fadd float %add40.us.1.1, %66
  store float %add76.us.1.1, float* %arrayidx63.us.1.1, align 4, !tbaa !2
  %indvars.iv.next.1.1 = add nuw nsw i64 %indvars.iv.next.118, 1
  %niter.nsub.1.1 = sub i64 %niter.nsub.119, 1
  %67 = trunc i64 %indvars.iv.next.1.1 to i32
  %add13.us.2.1 = add i32 %67, %50
  %add14.us.2.1 = add i32 %add13.us.2.1, 64
  %idxprom15.us.2.1 = sext i32 %add14.us.2.1 to i64
  %arrayidx16.us.2.1 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.1
  %68 = load float, float* %arrayidx16.us.2.1, align 4, !tbaa !2
  %mul17.us.2.1 = fmul float %46, %68
  %arrayidx23.us.2.1 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.1
  %69 = load float, float* %arrayidx23.us.2.1, align 4, !tbaa !2
  %mul24.us.2.1 = fmul float %47, %69
  %sub25.us.2.1 = fsub float %mul17.us.2.1, %mul24.us.2.1
  %mul32.us.2.1 = fmul float %47, %68
  %mul39.us.2.1 = fmul float %46, %69
  %add40.us.2.1 = fadd float %mul32.us.2.1, %mul39.us.2.1
  %70 = add nuw nsw i64 %indvars.iv.next.1.1, %49
  %arrayidx45.us.2.1 = getelementptr inbounds float, float* %data_real, i64 %70
  %71 = load float, float* %arrayidx45.us.2.1, align 4, !tbaa !2
  %sub46.us.2.1 = fsub float %71, %sub25.us.2.1
  store float %sub46.us.2.1, float* %arrayidx16.us.2.1, align 4, !tbaa !2
  %72 = load float, float* %arrayidx45.us.2.1, align 4, !tbaa !2
  %add58.us.2.1 = fadd float %sub25.us.2.1, %72
  store float %add58.us.2.1, float* %arrayidx45.us.2.1, align 4, !tbaa !2
  %arrayidx63.us.2.1 = getelementptr inbounds float, float* %data_imag, i64 %70
  %73 = load float, float* %arrayidx63.us.2.1, align 4, !tbaa !2
  %sub64.us.2.1 = fsub float %73, %add40.us.2.1
  store float %sub64.us.2.1, float* %arrayidx23.us.2.1, align 4, !tbaa !2
  %74 = load float, float* %arrayidx63.us.2.1, align 4, !tbaa !2
  %add76.us.2.1 = fadd float %add40.us.2.1, %74
  store float %add76.us.2.1, float* %arrayidx63.us.2.1, align 4, !tbaa !2
  %indvars.iv.next.2.1 = add nuw nsw i64 %indvars.iv.next.1.1, 1
  %niter.nsub.2.1 = sub i64 %niter.nsub.1.1, 1
  %75 = trunc i64 %indvars.iv.next.2.1 to i32
  %add13.us.3.1 = add i32 %75, %50
  %add14.us.3.1 = add i32 %add13.us.3.1, 64
  %idxprom15.us.3.1 = sext i32 %add14.us.3.1 to i64
  %arrayidx16.us.3.1 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.1
  %76 = load float, float* %arrayidx16.us.3.1, align 4, !tbaa !2
  %mul17.us.3.1 = fmul float %46, %76
  %arrayidx23.us.3.1 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.1
  %77 = load float, float* %arrayidx23.us.3.1, align 4, !tbaa !2
  %mul24.us.3.1 = fmul float %47, %77
  %sub25.us.3.1 = fsub float %mul17.us.3.1, %mul24.us.3.1
  %mul32.us.3.1 = fmul float %47, %76
  %mul39.us.3.1 = fmul float %46, %77
  %add40.us.3.1 = fadd float %mul32.us.3.1, %mul39.us.3.1
  %78 = add nuw nsw i64 %indvars.iv.next.2.1, %49
  %arrayidx45.us.3.1 = getelementptr inbounds float, float* %data_real, i64 %78
  %79 = load float, float* %arrayidx45.us.3.1, align 4, !tbaa !2
  %sub46.us.3.1 = fsub float %79, %sub25.us.3.1
  store float %sub46.us.3.1, float* %arrayidx16.us.3.1, align 4, !tbaa !2
  %80 = load float, float* %arrayidx45.us.3.1, align 4, !tbaa !2
  %add58.us.3.1 = fadd float %sub25.us.3.1, %80
  store float %add58.us.3.1, float* %arrayidx45.us.3.1, align 4, !tbaa !2
  %arrayidx63.us.3.1 = getelementptr inbounds float, float* %data_imag, i64 %78
  %81 = load float, float* %arrayidx63.us.3.1, align 4, !tbaa !2
  %sub64.us.3.1 = fsub float %81, %add40.us.3.1
  store float %sub64.us.3.1, float* %arrayidx23.us.3.1, align 4, !tbaa !2
  %82 = load float, float* %arrayidx63.us.3.1, align 4, !tbaa !2
  %add76.us.3.1 = fadd float %add40.us.3.1, %82
  store float %add76.us.3.1, float* %arrayidx63.us.3.1, align 4, !tbaa !2
  %indvars.iv.next.3.1 = add nuw nsw i64 %indvars.iv.next.2.1, 1
  %niter.nsub.3.1 = sub i64 %niter.nsub.2.1, 1
  %niter.ncmp.3.1 = icmp eq i64 %niter.nsub.3.1, 0
  br i1 %niter.ncmp.3.1, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.1, label %for.body11.us.1, !llvm.loop !10

for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.1: ; preds = %for.body11.us.1
  %indvars.iv.unr.ph.1 = phi i64 [ %indvars.iv.next.3.1, %for.body11.us.1 ]
  br label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.1

for.cond9.for.inc77_crit_edge.us.unr-lcssa.1:     ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.1, %for.body3.us.1
  %indvars.iv.unr.1 = phi i64 [ 0, %for.body3.us.1 ], [ %indvars.iv.unr.ph.1, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.1 ]
  br i1 false, label %for.body11.us.epil.preheader.1, label %for.cond9.for.inc77_crit_edge.us.1

for.body11.us.epil.preheader.1:                   ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.1
  br label %for.body11.us.epil.1

for.body11.us.epil.1:                             ; preds = %for.body11.us.epil.1, %for.body11.us.epil.preheader.1
  %indvars.iv.epil.1 = phi i64 [ %indvars.iv.unr.1, %for.body11.us.epil.preheader.1 ], [ %indvars.iv.next.epil.1, %for.body11.us.epil.1 ]
  %epil.iter.1 = phi i64 [ 0, %for.body11.us.epil.preheader.1 ], [ %epil.iter.sub.1, %for.body11.us.epil.1 ]
  %83 = trunc i64 %indvars.iv.epil.1 to i32
  %add13.us.epil.1 = add i32 %83, %50
  %add14.us.epil.1 = add i32 %add13.us.epil.1, 64
  %idxprom15.us.epil.1 = sext i32 %add14.us.epil.1 to i64
  %arrayidx16.us.epil.1 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.epil.1
  %84 = load float, float* %arrayidx16.us.epil.1, align 4, !tbaa !2
  %mul17.us.epil.1 = fmul float %46, %84
  %arrayidx23.us.epil.1 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.epil.1
  %85 = load float, float* %arrayidx23.us.epil.1, align 4, !tbaa !2
  %mul24.us.epil.1 = fmul float %47, %85
  %sub25.us.epil.1 = fsub float %mul17.us.epil.1, %mul24.us.epil.1
  %mul32.us.epil.1 = fmul float %47, %84
  %mul39.us.epil.1 = fmul float %46, %85
  %add40.us.epil.1 = fadd float %mul32.us.epil.1, %mul39.us.epil.1
  %86 = add nuw nsw i64 %indvars.iv.epil.1, %49
  %arrayidx45.us.epil.1 = getelementptr inbounds float, float* %data_real, i64 %86
  %87 = load float, float* %arrayidx45.us.epil.1, align 4, !tbaa !2
  %sub46.us.epil.1 = fsub float %87, %sub25.us.epil.1
  store float %sub46.us.epil.1, float* %arrayidx16.us.epil.1, align 4, !tbaa !2
  %88 = load float, float* %arrayidx45.us.epil.1, align 4, !tbaa !2
  %add58.us.epil.1 = fadd float %sub25.us.epil.1, %88
  store float %add58.us.epil.1, float* %arrayidx45.us.epil.1, align 4, !tbaa !2
  %arrayidx63.us.epil.1 = getelementptr inbounds float, float* %data_imag, i64 %86
  %89 = load float, float* %arrayidx63.us.epil.1, align 4, !tbaa !2
  %sub64.us.epil.1 = fsub float %89, %add40.us.epil.1
  store float %sub64.us.epil.1, float* %arrayidx23.us.epil.1, align 4, !tbaa !2
  %90 = load float, float* %arrayidx63.us.epil.1, align 4, !tbaa !2
  %add76.us.epil.1 = fadd float %add40.us.epil.1, %90
  store float %add76.us.epil.1, float* %arrayidx63.us.epil.1, align 4, !tbaa !2
  %indvars.iv.next.epil.1 = add nuw nsw i64 %indvars.iv.epil.1, 1
  %epil.iter.sub.1 = sub i64 %epil.iter.1, 1
  %epil.iter.cmp.1 = icmp ne i64 %epil.iter.sub.1, 0
  br i1 %epil.iter.cmp.1, label %for.body11.us.epil.1, label %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.1, !llvm.loop !11

for.cond9.for.inc77_crit_edge.us.epilog-lcssa.1:  ; preds = %for.body11.us.epil.1
  br label %for.cond9.for.inc77_crit_edge.us.1

for.cond9.for.inc77_crit_edge.us.1:               ; preds = %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.1, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.1
  %indvars.iv.next163.1 = add nuw nsw i64 %indvars.iv162.1, 1
  %exitcond168.1 = icmp eq i64 %indvars.iv.next163.1, 2
  br i1 %exitcond168.1, label %for.end79.loopexit.1, label %for.body3.us.1

for.end79.loopexit.1:                             ; preds = %for.cond9.for.inc77_crit_edge.us.1
  br label %for.end79.1

for.end79.1:                                      ; preds = %for.end79.loopexit.1, %for.end79
  br i1 true, label %for.body3.us.preheader.2, label %for.end79.2

for.body3.us.preheader.2:                         ; preds = %for.end79.1
  br label %for.body3.us.2

for.body3.us.2:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.2, %for.body3.us.preheader.2
  %indvars.iv162.2 = phi i64 [ 0, %for.body3.us.preheader.2 ], [ %indvars.iv.next163.2, %for.cond9.for.inc77_crit_edge.us.2 ]
  %91 = add nsw i64 %indvars.iv162.2, 3
  %arrayidx.us.2 = getelementptr inbounds float, float* %coef_real, i64 %91
  %92 = load float, float* %arrayidx.us.2, align 4, !tbaa !2
  %arrayidx8.us.2 = getelementptr inbounds float, float* %coef_imag, i64 %91
  %93 = load float, float* %arrayidx8.us.2, align 4, !tbaa !2
  %94 = shl nuw nsw i64 %indvars.iv162.2, 1
  %95 = mul nsw i64 %94, 32
  %96 = trunc i64 %95 to i32
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.2, label %for.body3.us.new.2

for.body3.us.new.2:                               ; preds = %for.body3.us.2
  br label %for.body11.us.2

for.body11.us.2:                                  ; preds = %for.body11.us.2, %for.body3.us.new.2
  %indvars.iv.2 = phi i64 [ 0, %for.body3.us.new.2 ], [ %indvars.iv.next.3.2, %for.body11.us.2 ]
  %niter.2 = phi i64 [ 32, %for.body3.us.new.2 ], [ %niter.nsub.3.2, %for.body11.us.2 ]
  %97 = trunc i64 %indvars.iv.2 to i32
  %add13.us.220 = add i32 %97, %96
  %add14.us.221 = add i32 %add13.us.220, 32
  %idxprom15.us.222 = sext i32 %add14.us.221 to i64
  %arrayidx16.us.223 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.222
  %98 = load float, float* %arrayidx16.us.223, align 4, !tbaa !2
  %mul17.us.224 = fmul float %92, %98
  %arrayidx23.us.225 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.222
  %99 = load float, float* %arrayidx23.us.225, align 4, !tbaa !2
  %mul24.us.226 = fmul float %93, %99
  %sub25.us.227 = fsub float %mul17.us.224, %mul24.us.226
  %mul32.us.228 = fmul float %93, %98
  %mul39.us.229 = fmul float %92, %99
  %add40.us.230 = fadd float %mul32.us.228, %mul39.us.229
  %100 = add nuw nsw i64 %indvars.iv.2, %95
  %arrayidx45.us.231 = getelementptr inbounds float, float* %data_real, i64 %100
  %101 = load float, float* %arrayidx45.us.231, align 4, !tbaa !2
  %sub46.us.232 = fsub float %101, %sub25.us.227
  store float %sub46.us.232, float* %arrayidx16.us.223, align 4, !tbaa !2
  %102 = load float, float* %arrayidx45.us.231, align 4, !tbaa !2
  %add58.us.233 = fadd float %sub25.us.227, %102
  store float %add58.us.233, float* %arrayidx45.us.231, align 4, !tbaa !2
  %arrayidx63.us.234 = getelementptr inbounds float, float* %data_imag, i64 %100
  %103 = load float, float* %arrayidx63.us.234, align 4, !tbaa !2
  %sub64.us.235 = fsub float %103, %add40.us.230
  store float %sub64.us.235, float* %arrayidx23.us.225, align 4, !tbaa !2
  %104 = load float, float* %arrayidx63.us.234, align 4, !tbaa !2
  %add76.us.236 = fadd float %add40.us.230, %104
  store float %add76.us.236, float* %arrayidx63.us.234, align 4, !tbaa !2
  %indvars.iv.next.237 = add nuw nsw i64 %indvars.iv.2, 1
  %niter.nsub.238 = sub i64 %niter.2, 1
  %105 = trunc i64 %indvars.iv.next.237 to i32
  %add13.us.1.2 = add i32 %105, %96
  %add14.us.1.2 = add i32 %add13.us.1.2, 32
  %idxprom15.us.1.2 = sext i32 %add14.us.1.2 to i64
  %arrayidx16.us.1.2 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.2
  %106 = load float, float* %arrayidx16.us.1.2, align 4, !tbaa !2
  %mul17.us.1.2 = fmul float %92, %106
  %arrayidx23.us.1.2 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.2
  %107 = load float, float* %arrayidx23.us.1.2, align 4, !tbaa !2
  %mul24.us.1.2 = fmul float %93, %107
  %sub25.us.1.2 = fsub float %mul17.us.1.2, %mul24.us.1.2
  %mul32.us.1.2 = fmul float %93, %106
  %mul39.us.1.2 = fmul float %92, %107
  %add40.us.1.2 = fadd float %mul32.us.1.2, %mul39.us.1.2
  %108 = add nuw nsw i64 %indvars.iv.next.237, %95
  %arrayidx45.us.1.2 = getelementptr inbounds float, float* %data_real, i64 %108
  %109 = load float, float* %arrayidx45.us.1.2, align 4, !tbaa !2
  %sub46.us.1.2 = fsub float %109, %sub25.us.1.2
  store float %sub46.us.1.2, float* %arrayidx16.us.1.2, align 4, !tbaa !2
  %110 = load float, float* %arrayidx45.us.1.2, align 4, !tbaa !2
  %add58.us.1.2 = fadd float %sub25.us.1.2, %110
  store float %add58.us.1.2, float* %arrayidx45.us.1.2, align 4, !tbaa !2
  %arrayidx63.us.1.2 = getelementptr inbounds float, float* %data_imag, i64 %108
  %111 = load float, float* %arrayidx63.us.1.2, align 4, !tbaa !2
  %sub64.us.1.2 = fsub float %111, %add40.us.1.2
  store float %sub64.us.1.2, float* %arrayidx23.us.1.2, align 4, !tbaa !2
  %112 = load float, float* %arrayidx63.us.1.2, align 4, !tbaa !2
  %add76.us.1.2 = fadd float %add40.us.1.2, %112
  store float %add76.us.1.2, float* %arrayidx63.us.1.2, align 4, !tbaa !2
  %indvars.iv.next.1.2 = add nuw nsw i64 %indvars.iv.next.237, 1
  %niter.nsub.1.2 = sub i64 %niter.nsub.238, 1
  %113 = trunc i64 %indvars.iv.next.1.2 to i32
  %add13.us.2.2 = add i32 %113, %96
  %add14.us.2.2 = add i32 %add13.us.2.2, 32
  %idxprom15.us.2.2 = sext i32 %add14.us.2.2 to i64
  %arrayidx16.us.2.2 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.2
  %114 = load float, float* %arrayidx16.us.2.2, align 4, !tbaa !2
  %mul17.us.2.2 = fmul float %92, %114
  %arrayidx23.us.2.2 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.2
  %115 = load float, float* %arrayidx23.us.2.2, align 4, !tbaa !2
  %mul24.us.2.2 = fmul float %93, %115
  %sub25.us.2.2 = fsub float %mul17.us.2.2, %mul24.us.2.2
  %mul32.us.2.2 = fmul float %93, %114
  %mul39.us.2.2 = fmul float %92, %115
  %add40.us.2.2 = fadd float %mul32.us.2.2, %mul39.us.2.2
  %116 = add nuw nsw i64 %indvars.iv.next.1.2, %95
  %arrayidx45.us.2.2 = getelementptr inbounds float, float* %data_real, i64 %116
  %117 = load float, float* %arrayidx45.us.2.2, align 4, !tbaa !2
  %sub46.us.2.2 = fsub float %117, %sub25.us.2.2
  store float %sub46.us.2.2, float* %arrayidx16.us.2.2, align 4, !tbaa !2
  %118 = load float, float* %arrayidx45.us.2.2, align 4, !tbaa !2
  %add58.us.2.2 = fadd float %sub25.us.2.2, %118
  store float %add58.us.2.2, float* %arrayidx45.us.2.2, align 4, !tbaa !2
  %arrayidx63.us.2.2 = getelementptr inbounds float, float* %data_imag, i64 %116
  %119 = load float, float* %arrayidx63.us.2.2, align 4, !tbaa !2
  %sub64.us.2.2 = fsub float %119, %add40.us.2.2
  store float %sub64.us.2.2, float* %arrayidx23.us.2.2, align 4, !tbaa !2
  %120 = load float, float* %arrayidx63.us.2.2, align 4, !tbaa !2
  %add76.us.2.2 = fadd float %add40.us.2.2, %120
  store float %add76.us.2.2, float* %arrayidx63.us.2.2, align 4, !tbaa !2
  %indvars.iv.next.2.2 = add nuw nsw i64 %indvars.iv.next.1.2, 1
  %niter.nsub.2.2 = sub i64 %niter.nsub.1.2, 1
  %121 = trunc i64 %indvars.iv.next.2.2 to i32
  %add13.us.3.2 = add i32 %121, %96
  %add14.us.3.2 = add i32 %add13.us.3.2, 32
  %idxprom15.us.3.2 = sext i32 %add14.us.3.2 to i64
  %arrayidx16.us.3.2 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.2
  %122 = load float, float* %arrayidx16.us.3.2, align 4, !tbaa !2
  %mul17.us.3.2 = fmul float %92, %122
  %arrayidx23.us.3.2 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.2
  %123 = load float, float* %arrayidx23.us.3.2, align 4, !tbaa !2
  %mul24.us.3.2 = fmul float %93, %123
  %sub25.us.3.2 = fsub float %mul17.us.3.2, %mul24.us.3.2
  %mul32.us.3.2 = fmul float %93, %122
  %mul39.us.3.2 = fmul float %92, %123
  %add40.us.3.2 = fadd float %mul32.us.3.2, %mul39.us.3.2
  %124 = add nuw nsw i64 %indvars.iv.next.2.2, %95
  %arrayidx45.us.3.2 = getelementptr inbounds float, float* %data_real, i64 %124
  %125 = load float, float* %arrayidx45.us.3.2, align 4, !tbaa !2
  %sub46.us.3.2 = fsub float %125, %sub25.us.3.2
  store float %sub46.us.3.2, float* %arrayidx16.us.3.2, align 4, !tbaa !2
  %126 = load float, float* %arrayidx45.us.3.2, align 4, !tbaa !2
  %add58.us.3.2 = fadd float %sub25.us.3.2, %126
  store float %add58.us.3.2, float* %arrayidx45.us.3.2, align 4, !tbaa !2
  %arrayidx63.us.3.2 = getelementptr inbounds float, float* %data_imag, i64 %124
  %127 = load float, float* %arrayidx63.us.3.2, align 4, !tbaa !2
  %sub64.us.3.2 = fsub float %127, %add40.us.3.2
  store float %sub64.us.3.2, float* %arrayidx23.us.3.2, align 4, !tbaa !2
  %128 = load float, float* %arrayidx63.us.3.2, align 4, !tbaa !2
  %add76.us.3.2 = fadd float %add40.us.3.2, %128
  store float %add76.us.3.2, float* %arrayidx63.us.3.2, align 4, !tbaa !2
  %indvars.iv.next.3.2 = add nuw nsw i64 %indvars.iv.next.2.2, 1
  %niter.nsub.3.2 = sub i64 %niter.nsub.2.2, 1
  %niter.ncmp.3.2 = icmp eq i64 %niter.nsub.3.2, 0
  br i1 %niter.ncmp.3.2, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.2, label %for.body11.us.2, !llvm.loop !10

for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.2: ; preds = %for.body11.us.2
  %indvars.iv.unr.ph.2 = phi i64 [ %indvars.iv.next.3.2, %for.body11.us.2 ]
  br label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.2

for.cond9.for.inc77_crit_edge.us.unr-lcssa.2:     ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.2, %for.body3.us.2
  %indvars.iv.unr.2 = phi i64 [ 0, %for.body3.us.2 ], [ %indvars.iv.unr.ph.2, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.2 ]
  br i1 false, label %for.body11.us.epil.preheader.2, label %for.cond9.for.inc77_crit_edge.us.2

for.body11.us.epil.preheader.2:                   ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.2
  br label %for.body11.us.epil.2

for.body11.us.epil.2:                             ; preds = %for.body11.us.epil.2, %for.body11.us.epil.preheader.2
  %indvars.iv.epil.2 = phi i64 [ %indvars.iv.unr.2, %for.body11.us.epil.preheader.2 ], [ %indvars.iv.next.epil.2, %for.body11.us.epil.2 ]
  %epil.iter.2 = phi i64 [ 0, %for.body11.us.epil.preheader.2 ], [ %epil.iter.sub.2, %for.body11.us.epil.2 ]
  %129 = trunc i64 %indvars.iv.epil.2 to i32
  %add13.us.epil.2 = add i32 %129, %96
  %add14.us.epil.2 = add i32 %add13.us.epil.2, 32
  %idxprom15.us.epil.2 = sext i32 %add14.us.epil.2 to i64
  %arrayidx16.us.epil.2 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.epil.2
  %130 = load float, float* %arrayidx16.us.epil.2, align 4, !tbaa !2
  %mul17.us.epil.2 = fmul float %92, %130
  %arrayidx23.us.epil.2 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.epil.2
  %131 = load float, float* %arrayidx23.us.epil.2, align 4, !tbaa !2
  %mul24.us.epil.2 = fmul float %93, %131
  %sub25.us.epil.2 = fsub float %mul17.us.epil.2, %mul24.us.epil.2
  %mul32.us.epil.2 = fmul float %93, %130
  %mul39.us.epil.2 = fmul float %92, %131
  %add40.us.epil.2 = fadd float %mul32.us.epil.2, %mul39.us.epil.2
  %132 = add nuw nsw i64 %indvars.iv.epil.2, %95
  %arrayidx45.us.epil.2 = getelementptr inbounds float, float* %data_real, i64 %132
  %133 = load float, float* %arrayidx45.us.epil.2, align 4, !tbaa !2
  %sub46.us.epil.2 = fsub float %133, %sub25.us.epil.2
  store float %sub46.us.epil.2, float* %arrayidx16.us.epil.2, align 4, !tbaa !2
  %134 = load float, float* %arrayidx45.us.epil.2, align 4, !tbaa !2
  %add58.us.epil.2 = fadd float %sub25.us.epil.2, %134
  store float %add58.us.epil.2, float* %arrayidx45.us.epil.2, align 4, !tbaa !2
  %arrayidx63.us.epil.2 = getelementptr inbounds float, float* %data_imag, i64 %132
  %135 = load float, float* %arrayidx63.us.epil.2, align 4, !tbaa !2
  %sub64.us.epil.2 = fsub float %135, %add40.us.epil.2
  store float %sub64.us.epil.2, float* %arrayidx23.us.epil.2, align 4, !tbaa !2
  %136 = load float, float* %arrayidx63.us.epil.2, align 4, !tbaa !2
  %add76.us.epil.2 = fadd float %add40.us.epil.2, %136
  store float %add76.us.epil.2, float* %arrayidx63.us.epil.2, align 4, !tbaa !2
  %indvars.iv.next.epil.2 = add nuw nsw i64 %indvars.iv.epil.2, 1
  %epil.iter.sub.2 = sub i64 %epil.iter.2, 1
  %epil.iter.cmp.2 = icmp ne i64 %epil.iter.sub.2, 0
  br i1 %epil.iter.cmp.2, label %for.body11.us.epil.2, label %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.2, !llvm.loop !11

for.cond9.for.inc77_crit_edge.us.epilog-lcssa.2:  ; preds = %for.body11.us.epil.2
  br label %for.cond9.for.inc77_crit_edge.us.2

for.cond9.for.inc77_crit_edge.us.2:               ; preds = %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.2, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.2
  %indvars.iv.next163.2 = add nuw nsw i64 %indvars.iv162.2, 1
  %exitcond168.2 = icmp eq i64 %indvars.iv.next163.2, 4
  br i1 %exitcond168.2, label %for.end79.loopexit.2, label %for.body3.us.2

for.end79.loopexit.2:                             ; preds = %for.cond9.for.inc77_crit_edge.us.2
  br label %for.end79.2

for.end79.2:                                      ; preds = %for.end79.loopexit.2, %for.end79.1
  br i1 true, label %for.body3.us.preheader.3, label %for.end79.3

for.body3.us.preheader.3:                         ; preds = %for.end79.2
  br label %for.body3.us.3

for.body3.us.3:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.3, %for.body3.us.preheader.3
  %indvars.iv162.3 = phi i64 [ 0, %for.body3.us.preheader.3 ], [ %indvars.iv.next163.3, %for.cond9.for.inc77_crit_edge.us.3 ]
  %137 = add nsw i64 %indvars.iv162.3, 7
  %arrayidx.us.3 = getelementptr inbounds float, float* %coef_real, i64 %137
  %138 = load float, float* %arrayidx.us.3, align 4, !tbaa !2
  %arrayidx8.us.3 = getelementptr inbounds float, float* %coef_imag, i64 %137
  %139 = load float, float* %arrayidx8.us.3, align 4, !tbaa !2
  %140 = shl nuw nsw i64 %indvars.iv162.3, 1
  %141 = mul nsw i64 %140, 16
  %142 = trunc i64 %141 to i32
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.3, label %for.body3.us.new.3

for.body3.us.new.3:                               ; preds = %for.body3.us.3
  br label %for.body11.us.3

for.body11.us.3:                                  ; preds = %for.body11.us.3, %for.body3.us.new.3
  %indvars.iv.3 = phi i64 [ 0, %for.body3.us.new.3 ], [ %indvars.iv.next.3.3, %for.body11.us.3 ]
  %niter.3 = phi i64 [ 16, %for.body3.us.new.3 ], [ %niter.nsub.3.3, %for.body11.us.3 ]
  %143 = trunc i64 %indvars.iv.3 to i32
  %add13.us.339 = add i32 %143, %142
  %add14.us.340 = add i32 %add13.us.339, 16
  %idxprom15.us.341 = sext i32 %add14.us.340 to i64
  %arrayidx16.us.342 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.341
  %144 = load float, float* %arrayidx16.us.342, align 4, !tbaa !2
  %mul17.us.343 = fmul float %138, %144
  %arrayidx23.us.344 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.341
  %145 = load float, float* %arrayidx23.us.344, align 4, !tbaa !2
  %mul24.us.345 = fmul float %139, %145
  %sub25.us.346 = fsub float %mul17.us.343, %mul24.us.345
  %mul32.us.347 = fmul float %139, %144
  %mul39.us.348 = fmul float %138, %145
  %add40.us.349 = fadd float %mul32.us.347, %mul39.us.348
  %146 = add nuw nsw i64 %indvars.iv.3, %141
  %arrayidx45.us.350 = getelementptr inbounds float, float* %data_real, i64 %146
  %147 = load float, float* %arrayidx45.us.350, align 4, !tbaa !2
  %sub46.us.351 = fsub float %147, %sub25.us.346
  store float %sub46.us.351, float* %arrayidx16.us.342, align 4, !tbaa !2
  %148 = load float, float* %arrayidx45.us.350, align 4, !tbaa !2
  %add58.us.352 = fadd float %sub25.us.346, %148
  store float %add58.us.352, float* %arrayidx45.us.350, align 4, !tbaa !2
  %arrayidx63.us.353 = getelementptr inbounds float, float* %data_imag, i64 %146
  %149 = load float, float* %arrayidx63.us.353, align 4, !tbaa !2
  %sub64.us.354 = fsub float %149, %add40.us.349
  store float %sub64.us.354, float* %arrayidx23.us.344, align 4, !tbaa !2
  %150 = load float, float* %arrayidx63.us.353, align 4, !tbaa !2
  %add76.us.355 = fadd float %add40.us.349, %150
  store float %add76.us.355, float* %arrayidx63.us.353, align 4, !tbaa !2
  %indvars.iv.next.356 = add nuw nsw i64 %indvars.iv.3, 1
  %niter.nsub.357 = sub i64 %niter.3, 1
  %151 = trunc i64 %indvars.iv.next.356 to i32
  %add13.us.1.3 = add i32 %151, %142
  %add14.us.1.3 = add i32 %add13.us.1.3, 16
  %idxprom15.us.1.3 = sext i32 %add14.us.1.3 to i64
  %arrayidx16.us.1.3 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.3
  %152 = load float, float* %arrayidx16.us.1.3, align 4, !tbaa !2
  %mul17.us.1.3 = fmul float %138, %152
  %arrayidx23.us.1.3 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.3
  %153 = load float, float* %arrayidx23.us.1.3, align 4, !tbaa !2
  %mul24.us.1.3 = fmul float %139, %153
  %sub25.us.1.3 = fsub float %mul17.us.1.3, %mul24.us.1.3
  %mul32.us.1.3 = fmul float %139, %152
  %mul39.us.1.3 = fmul float %138, %153
  %add40.us.1.3 = fadd float %mul32.us.1.3, %mul39.us.1.3
  %154 = add nuw nsw i64 %indvars.iv.next.356, %141
  %arrayidx45.us.1.3 = getelementptr inbounds float, float* %data_real, i64 %154
  %155 = load float, float* %arrayidx45.us.1.3, align 4, !tbaa !2
  %sub46.us.1.3 = fsub float %155, %sub25.us.1.3
  store float %sub46.us.1.3, float* %arrayidx16.us.1.3, align 4, !tbaa !2
  %156 = load float, float* %arrayidx45.us.1.3, align 4, !tbaa !2
  %add58.us.1.3 = fadd float %sub25.us.1.3, %156
  store float %add58.us.1.3, float* %arrayidx45.us.1.3, align 4, !tbaa !2
  %arrayidx63.us.1.3 = getelementptr inbounds float, float* %data_imag, i64 %154
  %157 = load float, float* %arrayidx63.us.1.3, align 4, !tbaa !2
  %sub64.us.1.3 = fsub float %157, %add40.us.1.3
  store float %sub64.us.1.3, float* %arrayidx23.us.1.3, align 4, !tbaa !2
  %158 = load float, float* %arrayidx63.us.1.3, align 4, !tbaa !2
  %add76.us.1.3 = fadd float %add40.us.1.3, %158
  store float %add76.us.1.3, float* %arrayidx63.us.1.3, align 4, !tbaa !2
  %indvars.iv.next.1.3 = add nuw nsw i64 %indvars.iv.next.356, 1
  %niter.nsub.1.3 = sub i64 %niter.nsub.357, 1
  %159 = trunc i64 %indvars.iv.next.1.3 to i32
  %add13.us.2.3 = add i32 %159, %142
  %add14.us.2.3 = add i32 %add13.us.2.3, 16
  %idxprom15.us.2.3 = sext i32 %add14.us.2.3 to i64
  %arrayidx16.us.2.3 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.3
  %160 = load float, float* %arrayidx16.us.2.3, align 4, !tbaa !2
  %mul17.us.2.3 = fmul float %138, %160
  %arrayidx23.us.2.3 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.3
  %161 = load float, float* %arrayidx23.us.2.3, align 4, !tbaa !2
  %mul24.us.2.3 = fmul float %139, %161
  %sub25.us.2.3 = fsub float %mul17.us.2.3, %mul24.us.2.3
  %mul32.us.2.3 = fmul float %139, %160
  %mul39.us.2.3 = fmul float %138, %161
  %add40.us.2.3 = fadd float %mul32.us.2.3, %mul39.us.2.3
  %162 = add nuw nsw i64 %indvars.iv.next.1.3, %141
  %arrayidx45.us.2.3 = getelementptr inbounds float, float* %data_real, i64 %162
  %163 = load float, float* %arrayidx45.us.2.3, align 4, !tbaa !2
  %sub46.us.2.3 = fsub float %163, %sub25.us.2.3
  store float %sub46.us.2.3, float* %arrayidx16.us.2.3, align 4, !tbaa !2
  %164 = load float, float* %arrayidx45.us.2.3, align 4, !tbaa !2
  %add58.us.2.3 = fadd float %sub25.us.2.3, %164
  store float %add58.us.2.3, float* %arrayidx45.us.2.3, align 4, !tbaa !2
  %arrayidx63.us.2.3 = getelementptr inbounds float, float* %data_imag, i64 %162
  %165 = load float, float* %arrayidx63.us.2.3, align 4, !tbaa !2
  %sub64.us.2.3 = fsub float %165, %add40.us.2.3
  store float %sub64.us.2.3, float* %arrayidx23.us.2.3, align 4, !tbaa !2
  %166 = load float, float* %arrayidx63.us.2.3, align 4, !tbaa !2
  %add76.us.2.3 = fadd float %add40.us.2.3, %166
  store float %add76.us.2.3, float* %arrayidx63.us.2.3, align 4, !tbaa !2
  %indvars.iv.next.2.3 = add nuw nsw i64 %indvars.iv.next.1.3, 1
  %niter.nsub.2.3 = sub i64 %niter.nsub.1.3, 1
  %167 = trunc i64 %indvars.iv.next.2.3 to i32
  %add13.us.3.3 = add i32 %167, %142
  %add14.us.3.3 = add i32 %add13.us.3.3, 16
  %idxprom15.us.3.3 = sext i32 %add14.us.3.3 to i64
  %arrayidx16.us.3.3 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.3
  %168 = load float, float* %arrayidx16.us.3.3, align 4, !tbaa !2
  %mul17.us.3.3 = fmul float %138, %168
  %arrayidx23.us.3.3 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.3
  %169 = load float, float* %arrayidx23.us.3.3, align 4, !tbaa !2
  %mul24.us.3.3 = fmul float %139, %169
  %sub25.us.3.3 = fsub float %mul17.us.3.3, %mul24.us.3.3
  %mul32.us.3.3 = fmul float %139, %168
  %mul39.us.3.3 = fmul float %138, %169
  %add40.us.3.3 = fadd float %mul32.us.3.3, %mul39.us.3.3
  %170 = add nuw nsw i64 %indvars.iv.next.2.3, %141
  %arrayidx45.us.3.3 = getelementptr inbounds float, float* %data_real, i64 %170
  %171 = load float, float* %arrayidx45.us.3.3, align 4, !tbaa !2
  %sub46.us.3.3 = fsub float %171, %sub25.us.3.3
  store float %sub46.us.3.3, float* %arrayidx16.us.3.3, align 4, !tbaa !2
  %172 = load float, float* %arrayidx45.us.3.3, align 4, !tbaa !2
  %add58.us.3.3 = fadd float %sub25.us.3.3, %172
  store float %add58.us.3.3, float* %arrayidx45.us.3.3, align 4, !tbaa !2
  %arrayidx63.us.3.3 = getelementptr inbounds float, float* %data_imag, i64 %170
  %173 = load float, float* %arrayidx63.us.3.3, align 4, !tbaa !2
  %sub64.us.3.3 = fsub float %173, %add40.us.3.3
  store float %sub64.us.3.3, float* %arrayidx23.us.3.3, align 4, !tbaa !2
  %174 = load float, float* %arrayidx63.us.3.3, align 4, !tbaa !2
  %add76.us.3.3 = fadd float %add40.us.3.3, %174
  store float %add76.us.3.3, float* %arrayidx63.us.3.3, align 4, !tbaa !2
  %indvars.iv.next.3.3 = add nuw nsw i64 %indvars.iv.next.2.3, 1
  %niter.nsub.3.3 = sub i64 %niter.nsub.2.3, 1
  %niter.ncmp.3.3 = icmp eq i64 %niter.nsub.3.3, 0
  br i1 %niter.ncmp.3.3, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.3, label %for.body11.us.3, !llvm.loop !10

for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.3: ; preds = %for.body11.us.3
  %indvars.iv.unr.ph.3 = phi i64 [ %indvars.iv.next.3.3, %for.body11.us.3 ]
  br label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.3

for.cond9.for.inc77_crit_edge.us.unr-lcssa.3:     ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.3, %for.body3.us.3
  %indvars.iv.unr.3 = phi i64 [ 0, %for.body3.us.3 ], [ %indvars.iv.unr.ph.3, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.3 ]
  br i1 false, label %for.body11.us.epil.preheader.3, label %for.cond9.for.inc77_crit_edge.us.3

for.body11.us.epil.preheader.3:                   ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.3
  br label %for.body11.us.epil.3

for.body11.us.epil.3:                             ; preds = %for.body11.us.epil.3, %for.body11.us.epil.preheader.3
  %indvars.iv.epil.3 = phi i64 [ %indvars.iv.unr.3, %for.body11.us.epil.preheader.3 ], [ %indvars.iv.next.epil.3, %for.body11.us.epil.3 ]
  %epil.iter.3 = phi i64 [ 0, %for.body11.us.epil.preheader.3 ], [ %epil.iter.sub.3, %for.body11.us.epil.3 ]
  %175 = trunc i64 %indvars.iv.epil.3 to i32
  %add13.us.epil.3 = add i32 %175, %142
  %add14.us.epil.3 = add i32 %add13.us.epil.3, 16
  %idxprom15.us.epil.3 = sext i32 %add14.us.epil.3 to i64
  %arrayidx16.us.epil.3 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.epil.3
  %176 = load float, float* %arrayidx16.us.epil.3, align 4, !tbaa !2
  %mul17.us.epil.3 = fmul float %138, %176
  %arrayidx23.us.epil.3 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.epil.3
  %177 = load float, float* %arrayidx23.us.epil.3, align 4, !tbaa !2
  %mul24.us.epil.3 = fmul float %139, %177
  %sub25.us.epil.3 = fsub float %mul17.us.epil.3, %mul24.us.epil.3
  %mul32.us.epil.3 = fmul float %139, %176
  %mul39.us.epil.3 = fmul float %138, %177
  %add40.us.epil.3 = fadd float %mul32.us.epil.3, %mul39.us.epil.3
  %178 = add nuw nsw i64 %indvars.iv.epil.3, %141
  %arrayidx45.us.epil.3 = getelementptr inbounds float, float* %data_real, i64 %178
  %179 = load float, float* %arrayidx45.us.epil.3, align 4, !tbaa !2
  %sub46.us.epil.3 = fsub float %179, %sub25.us.epil.3
  store float %sub46.us.epil.3, float* %arrayidx16.us.epil.3, align 4, !tbaa !2
  %180 = load float, float* %arrayidx45.us.epil.3, align 4, !tbaa !2
  %add58.us.epil.3 = fadd float %sub25.us.epil.3, %180
  store float %add58.us.epil.3, float* %arrayidx45.us.epil.3, align 4, !tbaa !2
  %arrayidx63.us.epil.3 = getelementptr inbounds float, float* %data_imag, i64 %178
  %181 = load float, float* %arrayidx63.us.epil.3, align 4, !tbaa !2
  %sub64.us.epil.3 = fsub float %181, %add40.us.epil.3
  store float %sub64.us.epil.3, float* %arrayidx23.us.epil.3, align 4, !tbaa !2
  %182 = load float, float* %arrayidx63.us.epil.3, align 4, !tbaa !2
  %add76.us.epil.3 = fadd float %add40.us.epil.3, %182
  store float %add76.us.epil.3, float* %arrayidx63.us.epil.3, align 4, !tbaa !2
  %indvars.iv.next.epil.3 = add nuw nsw i64 %indvars.iv.epil.3, 1
  %epil.iter.sub.3 = sub i64 %epil.iter.3, 1
  %epil.iter.cmp.3 = icmp ne i64 %epil.iter.sub.3, 0
  br i1 %epil.iter.cmp.3, label %for.body11.us.epil.3, label %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.3, !llvm.loop !11

for.cond9.for.inc77_crit_edge.us.epilog-lcssa.3:  ; preds = %for.body11.us.epil.3
  br label %for.cond9.for.inc77_crit_edge.us.3

for.cond9.for.inc77_crit_edge.us.3:               ; preds = %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.3, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.3
  %indvars.iv.next163.3 = add nuw nsw i64 %indvars.iv162.3, 1
  %exitcond168.3 = icmp eq i64 %indvars.iv.next163.3, 8
  br i1 %exitcond168.3, label %for.end79.loopexit.3, label %for.body3.us.3

for.end79.loopexit.3:                             ; preds = %for.cond9.for.inc77_crit_edge.us.3
  br label %for.end79.3

for.end79.3:                                      ; preds = %for.end79.loopexit.3, %for.end79.2
  br i1 true, label %for.body3.us.preheader.4, label %for.end79.4

for.body3.us.preheader.4:                         ; preds = %for.end79.3
  br label %for.body3.us.4

for.body3.us.4:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.4, %for.body3.us.preheader.4
  %indvars.iv162.4 = phi i64 [ 0, %for.body3.us.preheader.4 ], [ %indvars.iv.next163.4, %for.cond9.for.inc77_crit_edge.us.4 ]
  %183 = add nsw i64 %indvars.iv162.4, 15
  %arrayidx.us.4 = getelementptr inbounds float, float* %coef_real, i64 %183
  %184 = load float, float* %arrayidx.us.4, align 4, !tbaa !2
  %arrayidx8.us.4 = getelementptr inbounds float, float* %coef_imag, i64 %183
  %185 = load float, float* %arrayidx8.us.4, align 4, !tbaa !2
  %186 = shl nuw nsw i64 %indvars.iv162.4, 1
  %187 = mul nsw i64 %186, 8
  %188 = trunc i64 %187 to i32
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.4, label %for.body3.us.new.4

for.body3.us.new.4:                               ; preds = %for.body3.us.4
  br label %for.body11.us.4

for.body11.us.4:                                  ; preds = %for.body11.us.4, %for.body3.us.new.4
  %indvars.iv.4 = phi i64 [ 0, %for.body3.us.new.4 ], [ %indvars.iv.next.3.4, %for.body11.us.4 ]
  %niter.4 = phi i64 [ 8, %for.body3.us.new.4 ], [ %niter.nsub.3.4, %for.body11.us.4 ]
  %189 = trunc i64 %indvars.iv.4 to i32
  %add13.us.4 = add i32 %189, %188
  %add14.us.4 = add i32 %add13.us.4, 8
  %idxprom15.us.4 = sext i32 %add14.us.4 to i64
  %arrayidx16.us.4 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.4
  %190 = load float, float* %arrayidx16.us.4, align 4, !tbaa !2
  %mul17.us.4 = fmul float %184, %190
  %arrayidx23.us.4 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.4
  %191 = load float, float* %arrayidx23.us.4, align 4, !tbaa !2
  %mul24.us.4 = fmul float %185, %191
  %sub25.us.4 = fsub float %mul17.us.4, %mul24.us.4
  %mul32.us.4 = fmul float %185, %190
  %mul39.us.4 = fmul float %184, %191
  %add40.us.4 = fadd float %mul32.us.4, %mul39.us.4
  %192 = add nuw nsw i64 %indvars.iv.4, %187
  %arrayidx45.us.4 = getelementptr inbounds float, float* %data_real, i64 %192
  %193 = load float, float* %arrayidx45.us.4, align 4, !tbaa !2
  %sub46.us.4 = fsub float %193, %sub25.us.4
  store float %sub46.us.4, float* %arrayidx16.us.4, align 4, !tbaa !2
  %194 = load float, float* %arrayidx45.us.4, align 4, !tbaa !2
  %add58.us.4 = fadd float %sub25.us.4, %194
  store float %add58.us.4, float* %arrayidx45.us.4, align 4, !tbaa !2
  %arrayidx63.us.4 = getelementptr inbounds float, float* %data_imag, i64 %192
  %195 = load float, float* %arrayidx63.us.4, align 4, !tbaa !2
  %sub64.us.4 = fsub float %195, %add40.us.4
  store float %sub64.us.4, float* %arrayidx23.us.4, align 4, !tbaa !2
  %196 = load float, float* %arrayidx63.us.4, align 4, !tbaa !2
  %add76.us.4 = fadd float %add40.us.4, %196
  store float %add76.us.4, float* %arrayidx63.us.4, align 4, !tbaa !2
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv.4, 1
  %niter.nsub.4 = sub i64 %niter.4, 1
  %197 = trunc i64 %indvars.iv.next.4 to i32
  %add13.us.1.4 = add i32 %197, %188
  %add14.us.1.4 = add i32 %add13.us.1.4, 8
  %idxprom15.us.1.4 = sext i32 %add14.us.1.4 to i64
  %arrayidx16.us.1.4 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.4
  %198 = load float, float* %arrayidx16.us.1.4, align 4, !tbaa !2
  %mul17.us.1.4 = fmul float %184, %198
  %arrayidx23.us.1.4 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.4
  %199 = load float, float* %arrayidx23.us.1.4, align 4, !tbaa !2
  %mul24.us.1.4 = fmul float %185, %199
  %sub25.us.1.4 = fsub float %mul17.us.1.4, %mul24.us.1.4
  %mul32.us.1.4 = fmul float %185, %198
  %mul39.us.1.4 = fmul float %184, %199
  %add40.us.1.4 = fadd float %mul32.us.1.4, %mul39.us.1.4
  %200 = add nuw nsw i64 %indvars.iv.next.4, %187
  %arrayidx45.us.1.4 = getelementptr inbounds float, float* %data_real, i64 %200
  %201 = load float, float* %arrayidx45.us.1.4, align 4, !tbaa !2
  %sub46.us.1.4 = fsub float %201, %sub25.us.1.4
  store float %sub46.us.1.4, float* %arrayidx16.us.1.4, align 4, !tbaa !2
  %202 = load float, float* %arrayidx45.us.1.4, align 4, !tbaa !2
  %add58.us.1.4 = fadd float %sub25.us.1.4, %202
  store float %add58.us.1.4, float* %arrayidx45.us.1.4, align 4, !tbaa !2
  %arrayidx63.us.1.4 = getelementptr inbounds float, float* %data_imag, i64 %200
  %203 = load float, float* %arrayidx63.us.1.4, align 4, !tbaa !2
  %sub64.us.1.4 = fsub float %203, %add40.us.1.4
  store float %sub64.us.1.4, float* %arrayidx23.us.1.4, align 4, !tbaa !2
  %204 = load float, float* %arrayidx63.us.1.4, align 4, !tbaa !2
  %add76.us.1.4 = fadd float %add40.us.1.4, %204
  store float %add76.us.1.4, float* %arrayidx63.us.1.4, align 4, !tbaa !2
  %indvars.iv.next.1.4 = add nuw nsw i64 %indvars.iv.next.4, 1
  %niter.nsub.1.4 = sub i64 %niter.nsub.4, 1
  %205 = trunc i64 %indvars.iv.next.1.4 to i32
  %add13.us.2.4 = add i32 %205, %188
  %add14.us.2.4 = add i32 %add13.us.2.4, 8
  %idxprom15.us.2.4 = sext i32 %add14.us.2.4 to i64
  %arrayidx16.us.2.4 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.4
  %206 = load float, float* %arrayidx16.us.2.4, align 4, !tbaa !2
  %mul17.us.2.4 = fmul float %184, %206
  %arrayidx23.us.2.4 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.4
  %207 = load float, float* %arrayidx23.us.2.4, align 4, !tbaa !2
  %mul24.us.2.4 = fmul float %185, %207
  %sub25.us.2.4 = fsub float %mul17.us.2.4, %mul24.us.2.4
  %mul32.us.2.4 = fmul float %185, %206
  %mul39.us.2.4 = fmul float %184, %207
  %add40.us.2.4 = fadd float %mul32.us.2.4, %mul39.us.2.4
  %208 = add nuw nsw i64 %indvars.iv.next.1.4, %187
  %arrayidx45.us.2.4 = getelementptr inbounds float, float* %data_real, i64 %208
  %209 = load float, float* %arrayidx45.us.2.4, align 4, !tbaa !2
  %sub46.us.2.4 = fsub float %209, %sub25.us.2.4
  store float %sub46.us.2.4, float* %arrayidx16.us.2.4, align 4, !tbaa !2
  %210 = load float, float* %arrayidx45.us.2.4, align 4, !tbaa !2
  %add58.us.2.4 = fadd float %sub25.us.2.4, %210
  store float %add58.us.2.4, float* %arrayidx45.us.2.4, align 4, !tbaa !2
  %arrayidx63.us.2.4 = getelementptr inbounds float, float* %data_imag, i64 %208
  %211 = load float, float* %arrayidx63.us.2.4, align 4, !tbaa !2
  %sub64.us.2.4 = fsub float %211, %add40.us.2.4
  store float %sub64.us.2.4, float* %arrayidx23.us.2.4, align 4, !tbaa !2
  %212 = load float, float* %arrayidx63.us.2.4, align 4, !tbaa !2
  %add76.us.2.4 = fadd float %add40.us.2.4, %212
  store float %add76.us.2.4, float* %arrayidx63.us.2.4, align 4, !tbaa !2
  %indvars.iv.next.2.4 = add nuw nsw i64 %indvars.iv.next.1.4, 1
  %niter.nsub.2.4 = sub i64 %niter.nsub.1.4, 1
  %213 = trunc i64 %indvars.iv.next.2.4 to i32
  %add13.us.3.4 = add i32 %213, %188
  %add14.us.3.4 = add i32 %add13.us.3.4, 8
  %idxprom15.us.3.4 = sext i32 %add14.us.3.4 to i64
  %arrayidx16.us.3.4 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.4
  %214 = load float, float* %arrayidx16.us.3.4, align 4, !tbaa !2
  %mul17.us.3.4 = fmul float %184, %214
  %arrayidx23.us.3.4 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.4
  %215 = load float, float* %arrayidx23.us.3.4, align 4, !tbaa !2
  %mul24.us.3.4 = fmul float %185, %215
  %sub25.us.3.4 = fsub float %mul17.us.3.4, %mul24.us.3.4
  %mul32.us.3.4 = fmul float %185, %214
  %mul39.us.3.4 = fmul float %184, %215
  %add40.us.3.4 = fadd float %mul32.us.3.4, %mul39.us.3.4
  %216 = add nuw nsw i64 %indvars.iv.next.2.4, %187
  %arrayidx45.us.3.4 = getelementptr inbounds float, float* %data_real, i64 %216
  %217 = load float, float* %arrayidx45.us.3.4, align 4, !tbaa !2
  %sub46.us.3.4 = fsub float %217, %sub25.us.3.4
  store float %sub46.us.3.4, float* %arrayidx16.us.3.4, align 4, !tbaa !2
  %218 = load float, float* %arrayidx45.us.3.4, align 4, !tbaa !2
  %add58.us.3.4 = fadd float %sub25.us.3.4, %218
  store float %add58.us.3.4, float* %arrayidx45.us.3.4, align 4, !tbaa !2
  %arrayidx63.us.3.4 = getelementptr inbounds float, float* %data_imag, i64 %216
  %219 = load float, float* %arrayidx63.us.3.4, align 4, !tbaa !2
  %sub64.us.3.4 = fsub float %219, %add40.us.3.4
  store float %sub64.us.3.4, float* %arrayidx23.us.3.4, align 4, !tbaa !2
  %220 = load float, float* %arrayidx63.us.3.4, align 4, !tbaa !2
  %add76.us.3.4 = fadd float %add40.us.3.4, %220
  store float %add76.us.3.4, float* %arrayidx63.us.3.4, align 4, !tbaa !2
  %indvars.iv.next.3.4 = add nuw nsw i64 %indvars.iv.next.2.4, 1
  %niter.nsub.3.4 = sub i64 %niter.nsub.2.4, 1
  %niter.ncmp.3.4 = icmp eq i64 %niter.nsub.3.4, 0
  br i1 %niter.ncmp.3.4, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.4, label %for.body11.us.4, !llvm.loop !10

for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.4: ; preds = %for.body11.us.4
  %indvars.iv.unr.ph.4 = phi i64 [ %indvars.iv.next.3.4, %for.body11.us.4 ]
  br label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.4

for.cond9.for.inc77_crit_edge.us.unr-lcssa.4:     ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.4, %for.body3.us.4
  %indvars.iv.unr.4 = phi i64 [ 0, %for.body3.us.4 ], [ %indvars.iv.unr.ph.4, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.4 ]
  br i1 false, label %for.body11.us.epil.preheader.4, label %for.cond9.for.inc77_crit_edge.us.4

for.body11.us.epil.preheader.4:                   ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.4
  br label %for.body11.us.epil.4

for.body11.us.epil.4:                             ; preds = %for.body11.us.epil.4, %for.body11.us.epil.preheader.4
  %indvars.iv.epil.4 = phi i64 [ %indvars.iv.unr.4, %for.body11.us.epil.preheader.4 ], [ %indvars.iv.next.epil.4, %for.body11.us.epil.4 ]
  %epil.iter.4 = phi i64 [ 0, %for.body11.us.epil.preheader.4 ], [ %epil.iter.sub.4, %for.body11.us.epil.4 ]
  %221 = trunc i64 %indvars.iv.epil.4 to i32
  %add13.us.epil.4 = add i32 %221, %188
  %add14.us.epil.4 = add i32 %add13.us.epil.4, 8
  %idxprom15.us.epil.4 = sext i32 %add14.us.epil.4 to i64
  %arrayidx16.us.epil.4 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.epil.4
  %222 = load float, float* %arrayidx16.us.epil.4, align 4, !tbaa !2
  %mul17.us.epil.4 = fmul float %184, %222
  %arrayidx23.us.epil.4 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.epil.4
  %223 = load float, float* %arrayidx23.us.epil.4, align 4, !tbaa !2
  %mul24.us.epil.4 = fmul float %185, %223
  %sub25.us.epil.4 = fsub float %mul17.us.epil.4, %mul24.us.epil.4
  %mul32.us.epil.4 = fmul float %185, %222
  %mul39.us.epil.4 = fmul float %184, %223
  %add40.us.epil.4 = fadd float %mul32.us.epil.4, %mul39.us.epil.4
  %224 = add nuw nsw i64 %indvars.iv.epil.4, %187
  %arrayidx45.us.epil.4 = getelementptr inbounds float, float* %data_real, i64 %224
  %225 = load float, float* %arrayidx45.us.epil.4, align 4, !tbaa !2
  %sub46.us.epil.4 = fsub float %225, %sub25.us.epil.4
  store float %sub46.us.epil.4, float* %arrayidx16.us.epil.4, align 4, !tbaa !2
  %226 = load float, float* %arrayidx45.us.epil.4, align 4, !tbaa !2
  %add58.us.epil.4 = fadd float %sub25.us.epil.4, %226
  store float %add58.us.epil.4, float* %arrayidx45.us.epil.4, align 4, !tbaa !2
  %arrayidx63.us.epil.4 = getelementptr inbounds float, float* %data_imag, i64 %224
  %227 = load float, float* %arrayidx63.us.epil.4, align 4, !tbaa !2
  %sub64.us.epil.4 = fsub float %227, %add40.us.epil.4
  store float %sub64.us.epil.4, float* %arrayidx23.us.epil.4, align 4, !tbaa !2
  %228 = load float, float* %arrayidx63.us.epil.4, align 4, !tbaa !2
  %add76.us.epil.4 = fadd float %add40.us.epil.4, %228
  store float %add76.us.epil.4, float* %arrayidx63.us.epil.4, align 4, !tbaa !2
  %indvars.iv.next.epil.4 = add nuw nsw i64 %indvars.iv.epil.4, 1
  %epil.iter.sub.4 = sub i64 %epil.iter.4, 1
  %epil.iter.cmp.4 = icmp ne i64 %epil.iter.sub.4, 0
  br i1 %epil.iter.cmp.4, label %for.body11.us.epil.4, label %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.4, !llvm.loop !11

for.cond9.for.inc77_crit_edge.us.epilog-lcssa.4:  ; preds = %for.body11.us.epil.4
  br label %for.cond9.for.inc77_crit_edge.us.4

for.cond9.for.inc77_crit_edge.us.4:               ; preds = %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.4, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.4
  %indvars.iv.next163.4 = add nuw nsw i64 %indvars.iv162.4, 1
  %exitcond168.4 = icmp eq i64 %indvars.iv.next163.4, 16
  br i1 %exitcond168.4, label %for.end79.loopexit.4, label %for.body3.us.4

for.end79.loopexit.4:                             ; preds = %for.cond9.for.inc77_crit_edge.us.4
  br label %for.end79.4

for.end79.4:                                      ; preds = %for.end79.loopexit.4, %for.end79.3
  br i1 true, label %for.body3.us.preheader.5, label %for.end79.5

for.body3.us.preheader.5:                         ; preds = %for.end79.4
  br label %for.body3.us.5

for.body3.us.5:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.5, %for.body3.us.preheader.5
  %indvars.iv162.5 = phi i64 [ 0, %for.body3.us.preheader.5 ], [ %indvars.iv.next163.5, %for.cond9.for.inc77_crit_edge.us.5 ]
  %229 = add nsw i64 %indvars.iv162.5, 31
  %arrayidx.us.5 = getelementptr inbounds float, float* %coef_real, i64 %229
  %230 = load float, float* %arrayidx.us.5, align 4, !tbaa !2
  %arrayidx8.us.5 = getelementptr inbounds float, float* %coef_imag, i64 %229
  %231 = load float, float* %arrayidx8.us.5, align 4, !tbaa !2
  %232 = shl nuw nsw i64 %indvars.iv162.5, 1
  %233 = mul nsw i64 %232, 4
  %234 = trunc i64 %233 to i32
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.5, label %for.body3.us.new.5

for.body3.us.new.5:                               ; preds = %for.body3.us.5
  br label %for.body11.us.5

for.body11.us.5:                                  ; preds = %for.body11.us.5, %for.body3.us.new.5
  %indvars.iv.5 = phi i64 [ 0, %for.body3.us.new.5 ], [ %indvars.iv.next.3.5, %for.body11.us.5 ]
  %niter.5 = phi i64 [ 4, %for.body3.us.new.5 ], [ %niter.nsub.3.5, %for.body11.us.5 ]
  %235 = trunc i64 %indvars.iv.5 to i32
  %add13.us.5 = add i32 %235, %234
  %add14.us.5 = add i32 %add13.us.5, 4
  %idxprom15.us.5 = sext i32 %add14.us.5 to i64
  %arrayidx16.us.5 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.5
  %236 = load float, float* %arrayidx16.us.5, align 4, !tbaa !2
  %mul17.us.5 = fmul float %230, %236
  %arrayidx23.us.5 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.5
  %237 = load float, float* %arrayidx23.us.5, align 4, !tbaa !2
  %mul24.us.5 = fmul float %231, %237
  %sub25.us.5 = fsub float %mul17.us.5, %mul24.us.5
  %mul32.us.5 = fmul float %231, %236
  %mul39.us.5 = fmul float %230, %237
  %add40.us.5 = fadd float %mul32.us.5, %mul39.us.5
  %238 = add nuw nsw i64 %indvars.iv.5, %233
  %arrayidx45.us.5 = getelementptr inbounds float, float* %data_real, i64 %238
  %239 = load float, float* %arrayidx45.us.5, align 4, !tbaa !2
  %sub46.us.5 = fsub float %239, %sub25.us.5
  store float %sub46.us.5, float* %arrayidx16.us.5, align 4, !tbaa !2
  %240 = load float, float* %arrayidx45.us.5, align 4, !tbaa !2
  %add58.us.5 = fadd float %sub25.us.5, %240
  store float %add58.us.5, float* %arrayidx45.us.5, align 4, !tbaa !2
  %arrayidx63.us.5 = getelementptr inbounds float, float* %data_imag, i64 %238
  %241 = load float, float* %arrayidx63.us.5, align 4, !tbaa !2
  %sub64.us.5 = fsub float %241, %add40.us.5
  store float %sub64.us.5, float* %arrayidx23.us.5, align 4, !tbaa !2
  %242 = load float, float* %arrayidx63.us.5, align 4, !tbaa !2
  %add76.us.5 = fadd float %add40.us.5, %242
  store float %add76.us.5, float* %arrayidx63.us.5, align 4, !tbaa !2
  %indvars.iv.next.5 = add nuw nsw i64 %indvars.iv.5, 1
  %niter.nsub.5 = sub i64 %niter.5, 1
  %243 = trunc i64 %indvars.iv.next.5 to i32
  %add13.us.1.5 = add i32 %243, %234
  %add14.us.1.5 = add i32 %add13.us.1.5, 4
  %idxprom15.us.1.5 = sext i32 %add14.us.1.5 to i64
  %arrayidx16.us.1.5 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.5
  %244 = load float, float* %arrayidx16.us.1.5, align 4, !tbaa !2
  %mul17.us.1.5 = fmul float %230, %244
  %arrayidx23.us.1.5 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.5
  %245 = load float, float* %arrayidx23.us.1.5, align 4, !tbaa !2
  %mul24.us.1.5 = fmul float %231, %245
  %sub25.us.1.5 = fsub float %mul17.us.1.5, %mul24.us.1.5
  %mul32.us.1.5 = fmul float %231, %244
  %mul39.us.1.5 = fmul float %230, %245
  %add40.us.1.5 = fadd float %mul32.us.1.5, %mul39.us.1.5
  %246 = add nuw nsw i64 %indvars.iv.next.5, %233
  %arrayidx45.us.1.5 = getelementptr inbounds float, float* %data_real, i64 %246
  %247 = load float, float* %arrayidx45.us.1.5, align 4, !tbaa !2
  %sub46.us.1.5 = fsub float %247, %sub25.us.1.5
  store float %sub46.us.1.5, float* %arrayidx16.us.1.5, align 4, !tbaa !2
  %248 = load float, float* %arrayidx45.us.1.5, align 4, !tbaa !2
  %add58.us.1.5 = fadd float %sub25.us.1.5, %248
  store float %add58.us.1.5, float* %arrayidx45.us.1.5, align 4, !tbaa !2
  %arrayidx63.us.1.5 = getelementptr inbounds float, float* %data_imag, i64 %246
  %249 = load float, float* %arrayidx63.us.1.5, align 4, !tbaa !2
  %sub64.us.1.5 = fsub float %249, %add40.us.1.5
  store float %sub64.us.1.5, float* %arrayidx23.us.1.5, align 4, !tbaa !2
  %250 = load float, float* %arrayidx63.us.1.5, align 4, !tbaa !2
  %add76.us.1.5 = fadd float %add40.us.1.5, %250
  store float %add76.us.1.5, float* %arrayidx63.us.1.5, align 4, !tbaa !2
  %indvars.iv.next.1.5 = add nuw nsw i64 %indvars.iv.next.5, 1
  %niter.nsub.1.5 = sub i64 %niter.nsub.5, 1
  %251 = trunc i64 %indvars.iv.next.1.5 to i32
  %add13.us.2.5 = add i32 %251, %234
  %add14.us.2.5 = add i32 %add13.us.2.5, 4
  %idxprom15.us.2.5 = sext i32 %add14.us.2.5 to i64
  %arrayidx16.us.2.5 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.5
  %252 = load float, float* %arrayidx16.us.2.5, align 4, !tbaa !2
  %mul17.us.2.5 = fmul float %230, %252
  %arrayidx23.us.2.5 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.5
  %253 = load float, float* %arrayidx23.us.2.5, align 4, !tbaa !2
  %mul24.us.2.5 = fmul float %231, %253
  %sub25.us.2.5 = fsub float %mul17.us.2.5, %mul24.us.2.5
  %mul32.us.2.5 = fmul float %231, %252
  %mul39.us.2.5 = fmul float %230, %253
  %add40.us.2.5 = fadd float %mul32.us.2.5, %mul39.us.2.5
  %254 = add nuw nsw i64 %indvars.iv.next.1.5, %233
  %arrayidx45.us.2.5 = getelementptr inbounds float, float* %data_real, i64 %254
  %255 = load float, float* %arrayidx45.us.2.5, align 4, !tbaa !2
  %sub46.us.2.5 = fsub float %255, %sub25.us.2.5
  store float %sub46.us.2.5, float* %arrayidx16.us.2.5, align 4, !tbaa !2
  %256 = load float, float* %arrayidx45.us.2.5, align 4, !tbaa !2
  %add58.us.2.5 = fadd float %sub25.us.2.5, %256
  store float %add58.us.2.5, float* %arrayidx45.us.2.5, align 4, !tbaa !2
  %arrayidx63.us.2.5 = getelementptr inbounds float, float* %data_imag, i64 %254
  %257 = load float, float* %arrayidx63.us.2.5, align 4, !tbaa !2
  %sub64.us.2.5 = fsub float %257, %add40.us.2.5
  store float %sub64.us.2.5, float* %arrayidx23.us.2.5, align 4, !tbaa !2
  %258 = load float, float* %arrayidx63.us.2.5, align 4, !tbaa !2
  %add76.us.2.5 = fadd float %add40.us.2.5, %258
  store float %add76.us.2.5, float* %arrayidx63.us.2.5, align 4, !tbaa !2
  %indvars.iv.next.2.5 = add nuw nsw i64 %indvars.iv.next.1.5, 1
  %niter.nsub.2.5 = sub i64 %niter.nsub.1.5, 1
  %259 = trunc i64 %indvars.iv.next.2.5 to i32
  %add13.us.3.5 = add i32 %259, %234
  %add14.us.3.5 = add i32 %add13.us.3.5, 4
  %idxprom15.us.3.5 = sext i32 %add14.us.3.5 to i64
  %arrayidx16.us.3.5 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.5
  %260 = load float, float* %arrayidx16.us.3.5, align 4, !tbaa !2
  %mul17.us.3.5 = fmul float %230, %260
  %arrayidx23.us.3.5 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.5
  %261 = load float, float* %arrayidx23.us.3.5, align 4, !tbaa !2
  %mul24.us.3.5 = fmul float %231, %261
  %sub25.us.3.5 = fsub float %mul17.us.3.5, %mul24.us.3.5
  %mul32.us.3.5 = fmul float %231, %260
  %mul39.us.3.5 = fmul float %230, %261
  %add40.us.3.5 = fadd float %mul32.us.3.5, %mul39.us.3.5
  %262 = add nuw nsw i64 %indvars.iv.next.2.5, %233
  %arrayidx45.us.3.5 = getelementptr inbounds float, float* %data_real, i64 %262
  %263 = load float, float* %arrayidx45.us.3.5, align 4, !tbaa !2
  %sub46.us.3.5 = fsub float %263, %sub25.us.3.5
  store float %sub46.us.3.5, float* %arrayidx16.us.3.5, align 4, !tbaa !2
  %264 = load float, float* %arrayidx45.us.3.5, align 4, !tbaa !2
  %add58.us.3.5 = fadd float %sub25.us.3.5, %264
  store float %add58.us.3.5, float* %arrayidx45.us.3.5, align 4, !tbaa !2
  %arrayidx63.us.3.5 = getelementptr inbounds float, float* %data_imag, i64 %262
  %265 = load float, float* %arrayidx63.us.3.5, align 4, !tbaa !2
  %sub64.us.3.5 = fsub float %265, %add40.us.3.5
  store float %sub64.us.3.5, float* %arrayidx23.us.3.5, align 4, !tbaa !2
  %266 = load float, float* %arrayidx63.us.3.5, align 4, !tbaa !2
  %add76.us.3.5 = fadd float %add40.us.3.5, %266
  store float %add76.us.3.5, float* %arrayidx63.us.3.5, align 4, !tbaa !2
  %indvars.iv.next.3.5 = add nuw nsw i64 %indvars.iv.next.2.5, 1
  %niter.nsub.3.5 = sub i64 %niter.nsub.2.5, 1
  %niter.ncmp.3.5 = icmp eq i64 %niter.nsub.3.5, 0
  br i1 %niter.ncmp.3.5, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.5, label %for.body11.us.5, !llvm.loop !10

for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.5: ; preds = %for.body11.us.5
  %indvars.iv.unr.ph.5 = phi i64 [ %indvars.iv.next.3.5, %for.body11.us.5 ]
  br label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.5

for.cond9.for.inc77_crit_edge.us.unr-lcssa.5:     ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.5, %for.body3.us.5
  %indvars.iv.unr.5 = phi i64 [ 0, %for.body3.us.5 ], [ %indvars.iv.unr.ph.5, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.5 ]
  br i1 false, label %for.body11.us.epil.preheader.5, label %for.cond9.for.inc77_crit_edge.us.5

for.body11.us.epil.preheader.5:                   ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.5
  br label %for.body11.us.epil.5

for.body11.us.epil.5:                             ; preds = %for.body11.us.epil.5, %for.body11.us.epil.preheader.5
  %indvars.iv.epil.5 = phi i64 [ %indvars.iv.unr.5, %for.body11.us.epil.preheader.5 ], [ %indvars.iv.next.epil.5, %for.body11.us.epil.5 ]
  %epil.iter.5 = phi i64 [ 0, %for.body11.us.epil.preheader.5 ], [ %epil.iter.sub.5, %for.body11.us.epil.5 ]
  %267 = trunc i64 %indvars.iv.epil.5 to i32
  %add13.us.epil.5 = add i32 %267, %234
  %add14.us.epil.5 = add i32 %add13.us.epil.5, 4
  %idxprom15.us.epil.5 = sext i32 %add14.us.epil.5 to i64
  %arrayidx16.us.epil.5 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.epil.5
  %268 = load float, float* %arrayidx16.us.epil.5, align 4, !tbaa !2
  %mul17.us.epil.5 = fmul float %230, %268
  %arrayidx23.us.epil.5 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.epil.5
  %269 = load float, float* %arrayidx23.us.epil.5, align 4, !tbaa !2
  %mul24.us.epil.5 = fmul float %231, %269
  %sub25.us.epil.5 = fsub float %mul17.us.epil.5, %mul24.us.epil.5
  %mul32.us.epil.5 = fmul float %231, %268
  %mul39.us.epil.5 = fmul float %230, %269
  %add40.us.epil.5 = fadd float %mul32.us.epil.5, %mul39.us.epil.5
  %270 = add nuw nsw i64 %indvars.iv.epil.5, %233
  %arrayidx45.us.epil.5 = getelementptr inbounds float, float* %data_real, i64 %270
  %271 = load float, float* %arrayidx45.us.epil.5, align 4, !tbaa !2
  %sub46.us.epil.5 = fsub float %271, %sub25.us.epil.5
  store float %sub46.us.epil.5, float* %arrayidx16.us.epil.5, align 4, !tbaa !2
  %272 = load float, float* %arrayidx45.us.epil.5, align 4, !tbaa !2
  %add58.us.epil.5 = fadd float %sub25.us.epil.5, %272
  store float %add58.us.epil.5, float* %arrayidx45.us.epil.5, align 4, !tbaa !2
  %arrayidx63.us.epil.5 = getelementptr inbounds float, float* %data_imag, i64 %270
  %273 = load float, float* %arrayidx63.us.epil.5, align 4, !tbaa !2
  %sub64.us.epil.5 = fsub float %273, %add40.us.epil.5
  store float %sub64.us.epil.5, float* %arrayidx23.us.epil.5, align 4, !tbaa !2
  %274 = load float, float* %arrayidx63.us.epil.5, align 4, !tbaa !2
  %add76.us.epil.5 = fadd float %add40.us.epil.5, %274
  store float %add76.us.epil.5, float* %arrayidx63.us.epil.5, align 4, !tbaa !2
  %indvars.iv.next.epil.5 = add nuw nsw i64 %indvars.iv.epil.5, 1
  %epil.iter.sub.5 = sub i64 %epil.iter.5, 1
  %epil.iter.cmp.5 = icmp ne i64 %epil.iter.sub.5, 0
  br i1 %epil.iter.cmp.5, label %for.body11.us.epil.5, label %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.5, !llvm.loop !11

for.cond9.for.inc77_crit_edge.us.epilog-lcssa.5:  ; preds = %for.body11.us.epil.5
  br label %for.cond9.for.inc77_crit_edge.us.5

for.cond9.for.inc77_crit_edge.us.5:               ; preds = %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.5, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.5
  %indvars.iv.next163.5 = add nuw nsw i64 %indvars.iv162.5, 1
  %exitcond168.5 = icmp eq i64 %indvars.iv.next163.5, 32
  br i1 %exitcond168.5, label %for.end79.loopexit.5, label %for.body3.us.5

for.end79.loopexit.5:                             ; preds = %for.cond9.for.inc77_crit_edge.us.5
  br label %for.end79.5

for.end79.5:                                      ; preds = %for.end79.loopexit.5, %for.end79.4
  br i1 true, label %for.body3.us.preheader.6, label %for.end79.6

for.body3.us.preheader.6:                         ; preds = %for.end79.5
  br label %for.body3.us.6

for.body3.us.6:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.6, %for.body3.us.preheader.6
  %indvars.iv162.6 = phi i64 [ 0, %for.body3.us.preheader.6 ], [ %indvars.iv.next163.6, %for.cond9.for.inc77_crit_edge.us.6 ]
  %275 = add nsw i64 %indvars.iv162.6, 63
  %arrayidx.us.6 = getelementptr inbounds float, float* %coef_real, i64 %275
  %276 = load float, float* %arrayidx.us.6, align 4, !tbaa !2
  %arrayidx8.us.6 = getelementptr inbounds float, float* %coef_imag, i64 %275
  %277 = load float, float* %arrayidx8.us.6, align 4, !tbaa !2
  %278 = shl nuw nsw i64 %indvars.iv162.6, 1
  %279 = mul nsw i64 %278, 2
  %280 = trunc i64 %279 to i32
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.6, label %for.body3.us.new.6

for.body3.us.new.6:                               ; preds = %for.body3.us.6
  br label %for.body11.us.6

for.body11.us.6:                                  ; preds = %for.body11.us.6, %for.body3.us.new.6
  %indvars.iv.6 = phi i64 [ 0, %for.body3.us.new.6 ], [ %indvars.iv.next.3.6, %for.body11.us.6 ]
  %niter.6 = phi i64 [ 0, %for.body3.us.new.6 ], [ %niter.nsub.3.6, %for.body11.us.6 ]
  %281 = trunc i64 %indvars.iv.6 to i32
  %add13.us.6 = add i32 %281, %280
  %add14.us.6 = add i32 %add13.us.6, 2
  %idxprom15.us.6 = sext i32 %add14.us.6 to i64
  %arrayidx16.us.6 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.6
  %282 = load float, float* %arrayidx16.us.6, align 4, !tbaa !2
  %mul17.us.6 = fmul float %276, %282
  %arrayidx23.us.6 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.6
  %283 = load float, float* %arrayidx23.us.6, align 4, !tbaa !2
  %mul24.us.6 = fmul float %277, %283
  %sub25.us.6 = fsub float %mul17.us.6, %mul24.us.6
  %mul32.us.6 = fmul float %277, %282
  %mul39.us.6 = fmul float %276, %283
  %add40.us.6 = fadd float %mul32.us.6, %mul39.us.6
  %284 = add nuw nsw i64 %indvars.iv.6, %279
  %arrayidx45.us.6 = getelementptr inbounds float, float* %data_real, i64 %284
  %285 = load float, float* %arrayidx45.us.6, align 4, !tbaa !2
  %sub46.us.6 = fsub float %285, %sub25.us.6
  store float %sub46.us.6, float* %arrayidx16.us.6, align 4, !tbaa !2
  %286 = load float, float* %arrayidx45.us.6, align 4, !tbaa !2
  %add58.us.6 = fadd float %sub25.us.6, %286
  store float %add58.us.6, float* %arrayidx45.us.6, align 4, !tbaa !2
  %arrayidx63.us.6 = getelementptr inbounds float, float* %data_imag, i64 %284
  %287 = load float, float* %arrayidx63.us.6, align 4, !tbaa !2
  %sub64.us.6 = fsub float %287, %add40.us.6
  store float %sub64.us.6, float* %arrayidx23.us.6, align 4, !tbaa !2
  %288 = load float, float* %arrayidx63.us.6, align 4, !tbaa !2
  %add76.us.6 = fadd float %add40.us.6, %288
  store float %add76.us.6, float* %arrayidx63.us.6, align 4, !tbaa !2
  %indvars.iv.next.6 = add nuw nsw i64 %indvars.iv.6, 1
  %niter.nsub.6 = sub i64 %niter.6, 1
  %289 = trunc i64 %indvars.iv.next.6 to i32
  %add13.us.1.6 = add i32 %289, %280
  %add14.us.1.6 = add i32 %add13.us.1.6, 2
  %idxprom15.us.1.6 = sext i32 %add14.us.1.6 to i64
  %arrayidx16.us.1.6 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.6
  %290 = load float, float* %arrayidx16.us.1.6, align 4, !tbaa !2
  %mul17.us.1.6 = fmul float %276, %290
  %arrayidx23.us.1.6 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.6
  %291 = load float, float* %arrayidx23.us.1.6, align 4, !tbaa !2
  %mul24.us.1.6 = fmul float %277, %291
  %sub25.us.1.6 = fsub float %mul17.us.1.6, %mul24.us.1.6
  %mul32.us.1.6 = fmul float %277, %290
  %mul39.us.1.6 = fmul float %276, %291
  %add40.us.1.6 = fadd float %mul32.us.1.6, %mul39.us.1.6
  %292 = add nuw nsw i64 %indvars.iv.next.6, %279
  %arrayidx45.us.1.6 = getelementptr inbounds float, float* %data_real, i64 %292
  %293 = load float, float* %arrayidx45.us.1.6, align 4, !tbaa !2
  %sub46.us.1.6 = fsub float %293, %sub25.us.1.6
  store float %sub46.us.1.6, float* %arrayidx16.us.1.6, align 4, !tbaa !2
  %294 = load float, float* %arrayidx45.us.1.6, align 4, !tbaa !2
  %add58.us.1.6 = fadd float %sub25.us.1.6, %294
  store float %add58.us.1.6, float* %arrayidx45.us.1.6, align 4, !tbaa !2
  %arrayidx63.us.1.6 = getelementptr inbounds float, float* %data_imag, i64 %292
  %295 = load float, float* %arrayidx63.us.1.6, align 4, !tbaa !2
  %sub64.us.1.6 = fsub float %295, %add40.us.1.6
  store float %sub64.us.1.6, float* %arrayidx23.us.1.6, align 4, !tbaa !2
  %296 = load float, float* %arrayidx63.us.1.6, align 4, !tbaa !2
  %add76.us.1.6 = fadd float %add40.us.1.6, %296
  store float %add76.us.1.6, float* %arrayidx63.us.1.6, align 4, !tbaa !2
  %indvars.iv.next.1.6 = add nuw nsw i64 %indvars.iv.next.6, 1
  %niter.nsub.1.6 = sub i64 %niter.nsub.6, 1
  %297 = trunc i64 %indvars.iv.next.1.6 to i32
  %add13.us.2.6 = add i32 %297, %280
  %add14.us.2.6 = add i32 %add13.us.2.6, 2
  %idxprom15.us.2.6 = sext i32 %add14.us.2.6 to i64
  %arrayidx16.us.2.6 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.6
  %298 = load float, float* %arrayidx16.us.2.6, align 4, !tbaa !2
  %mul17.us.2.6 = fmul float %276, %298
  %arrayidx23.us.2.6 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.6
  %299 = load float, float* %arrayidx23.us.2.6, align 4, !tbaa !2
  %mul24.us.2.6 = fmul float %277, %299
  %sub25.us.2.6 = fsub float %mul17.us.2.6, %mul24.us.2.6
  %mul32.us.2.6 = fmul float %277, %298
  %mul39.us.2.6 = fmul float %276, %299
  %add40.us.2.6 = fadd float %mul32.us.2.6, %mul39.us.2.6
  %300 = add nuw nsw i64 %indvars.iv.next.1.6, %279
  %arrayidx45.us.2.6 = getelementptr inbounds float, float* %data_real, i64 %300
  %301 = load float, float* %arrayidx45.us.2.6, align 4, !tbaa !2
  %sub46.us.2.6 = fsub float %301, %sub25.us.2.6
  store float %sub46.us.2.6, float* %arrayidx16.us.2.6, align 4, !tbaa !2
  %302 = load float, float* %arrayidx45.us.2.6, align 4, !tbaa !2
  %add58.us.2.6 = fadd float %sub25.us.2.6, %302
  store float %add58.us.2.6, float* %arrayidx45.us.2.6, align 4, !tbaa !2
  %arrayidx63.us.2.6 = getelementptr inbounds float, float* %data_imag, i64 %300
  %303 = load float, float* %arrayidx63.us.2.6, align 4, !tbaa !2
  %sub64.us.2.6 = fsub float %303, %add40.us.2.6
  store float %sub64.us.2.6, float* %arrayidx23.us.2.6, align 4, !tbaa !2
  %304 = load float, float* %arrayidx63.us.2.6, align 4, !tbaa !2
  %add76.us.2.6 = fadd float %add40.us.2.6, %304
  store float %add76.us.2.6, float* %arrayidx63.us.2.6, align 4, !tbaa !2
  %indvars.iv.next.2.6 = add nuw nsw i64 %indvars.iv.next.1.6, 1
  %niter.nsub.2.6 = sub i64 %niter.nsub.1.6, 1
  %305 = trunc i64 %indvars.iv.next.2.6 to i32
  %add13.us.3.6 = add i32 %305, %280
  %add14.us.3.6 = add i32 %add13.us.3.6, 2
  %idxprom15.us.3.6 = sext i32 %add14.us.3.6 to i64
  %arrayidx16.us.3.6 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.6
  %306 = load float, float* %arrayidx16.us.3.6, align 4, !tbaa !2
  %mul17.us.3.6 = fmul float %276, %306
  %arrayidx23.us.3.6 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.6
  %307 = load float, float* %arrayidx23.us.3.6, align 4, !tbaa !2
  %mul24.us.3.6 = fmul float %277, %307
  %sub25.us.3.6 = fsub float %mul17.us.3.6, %mul24.us.3.6
  %mul32.us.3.6 = fmul float %277, %306
  %mul39.us.3.6 = fmul float %276, %307
  %add40.us.3.6 = fadd float %mul32.us.3.6, %mul39.us.3.6
  %308 = add nuw nsw i64 %indvars.iv.next.2.6, %279
  %arrayidx45.us.3.6 = getelementptr inbounds float, float* %data_real, i64 %308
  %309 = load float, float* %arrayidx45.us.3.6, align 4, !tbaa !2
  %sub46.us.3.6 = fsub float %309, %sub25.us.3.6
  store float %sub46.us.3.6, float* %arrayidx16.us.3.6, align 4, !tbaa !2
  %310 = load float, float* %arrayidx45.us.3.6, align 4, !tbaa !2
  %add58.us.3.6 = fadd float %sub25.us.3.6, %310
  store float %add58.us.3.6, float* %arrayidx45.us.3.6, align 4, !tbaa !2
  %arrayidx63.us.3.6 = getelementptr inbounds float, float* %data_imag, i64 %308
  %311 = load float, float* %arrayidx63.us.3.6, align 4, !tbaa !2
  %sub64.us.3.6 = fsub float %311, %add40.us.3.6
  store float %sub64.us.3.6, float* %arrayidx23.us.3.6, align 4, !tbaa !2
  %312 = load float, float* %arrayidx63.us.3.6, align 4, !tbaa !2
  %add76.us.3.6 = fadd float %add40.us.3.6, %312
  store float %add76.us.3.6, float* %arrayidx63.us.3.6, align 4, !tbaa !2
  %indvars.iv.next.3.6 = add nuw nsw i64 %indvars.iv.next.2.6, 1
  %niter.nsub.3.6 = sub i64 %niter.nsub.2.6, 1
  %niter.ncmp.3.6 = icmp eq i64 %niter.nsub.3.6, 0
  br i1 %niter.ncmp.3.6, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.6, label %for.body11.us.6, !llvm.loop !10

for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.6: ; preds = %for.body11.us.6
  %indvars.iv.unr.ph.6 = phi i64 [ %indvars.iv.next.3.6, %for.body11.us.6 ]
  br label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.6

for.cond9.for.inc77_crit_edge.us.unr-lcssa.6:     ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.6, %for.body3.us.6
  %indvars.iv.unr.6 = phi i64 [ 0, %for.body3.us.6 ], [ %indvars.iv.unr.ph.6, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.6 ]
  br i1 true, label %for.body11.us.epil.preheader.6, label %for.cond9.for.inc77_crit_edge.us.6

for.body11.us.epil.preheader.6:                   ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.6
  br label %for.body11.us.epil.6

for.body11.us.epil.6:                             ; preds = %for.body11.us.epil.6, %for.body11.us.epil.preheader.6
  %indvars.iv.epil.6 = phi i64 [ %indvars.iv.unr.6, %for.body11.us.epil.preheader.6 ], [ %indvars.iv.next.epil.6, %for.body11.us.epil.6 ]
  %epil.iter.6 = phi i64 [ 2, %for.body11.us.epil.preheader.6 ], [ %epil.iter.sub.6, %for.body11.us.epil.6 ]
  %313 = trunc i64 %indvars.iv.epil.6 to i32
  %add13.us.epil.6 = add i32 %313, %280
  %add14.us.epil.6 = add i32 %add13.us.epil.6, 2
  %idxprom15.us.epil.6 = sext i32 %add14.us.epil.6 to i64
  %arrayidx16.us.epil.6 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.epil.6
  %314 = load float, float* %arrayidx16.us.epil.6, align 4, !tbaa !2
  %mul17.us.epil.6 = fmul float %276, %314
  %arrayidx23.us.epil.6 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.epil.6
  %315 = load float, float* %arrayidx23.us.epil.6, align 4, !tbaa !2
  %mul24.us.epil.6 = fmul float %277, %315
  %sub25.us.epil.6 = fsub float %mul17.us.epil.6, %mul24.us.epil.6
  %mul32.us.epil.6 = fmul float %277, %314
  %mul39.us.epil.6 = fmul float %276, %315
  %add40.us.epil.6 = fadd float %mul32.us.epil.6, %mul39.us.epil.6
  %316 = add nuw nsw i64 %indvars.iv.epil.6, %279
  %arrayidx45.us.epil.6 = getelementptr inbounds float, float* %data_real, i64 %316
  %317 = load float, float* %arrayidx45.us.epil.6, align 4, !tbaa !2
  %sub46.us.epil.6 = fsub float %317, %sub25.us.epil.6
  store float %sub46.us.epil.6, float* %arrayidx16.us.epil.6, align 4, !tbaa !2
  %318 = load float, float* %arrayidx45.us.epil.6, align 4, !tbaa !2
  %add58.us.epil.6 = fadd float %sub25.us.epil.6, %318
  store float %add58.us.epil.6, float* %arrayidx45.us.epil.6, align 4, !tbaa !2
  %arrayidx63.us.epil.6 = getelementptr inbounds float, float* %data_imag, i64 %316
  %319 = load float, float* %arrayidx63.us.epil.6, align 4, !tbaa !2
  %sub64.us.epil.6 = fsub float %319, %add40.us.epil.6
  store float %sub64.us.epil.6, float* %arrayidx23.us.epil.6, align 4, !tbaa !2
  %320 = load float, float* %arrayidx63.us.epil.6, align 4, !tbaa !2
  %add76.us.epil.6 = fadd float %add40.us.epil.6, %320
  store float %add76.us.epil.6, float* %arrayidx63.us.epil.6, align 4, !tbaa !2
  %indvars.iv.next.epil.6 = add nuw nsw i64 %indvars.iv.epil.6, 1
  %epil.iter.sub.6 = sub i64 %epil.iter.6, 1
  %epil.iter.cmp.6 = icmp ne i64 %epil.iter.sub.6, 0
  br i1 %epil.iter.cmp.6, label %for.body11.us.epil.6, label %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.6, !llvm.loop !11

for.cond9.for.inc77_crit_edge.us.epilog-lcssa.6:  ; preds = %for.body11.us.epil.6
  br label %for.cond9.for.inc77_crit_edge.us.6

for.cond9.for.inc77_crit_edge.us.6:               ; preds = %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.6, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.6
  %indvars.iv.next163.6 = add nuw nsw i64 %indvars.iv162.6, 1
  %exitcond168.6 = icmp eq i64 %indvars.iv.next163.6, 64
  br i1 %exitcond168.6, label %for.end79.loopexit.6, label %for.body3.us.6

for.end79.loopexit.6:                             ; preds = %for.cond9.for.inc77_crit_edge.us.6
  br label %for.end79.6

for.end79.6:                                      ; preds = %for.end79.loopexit.6, %for.end79.5
  br i1 true, label %for.body3.us.preheader.7, label %for.end79.7

for.body3.us.preheader.7:                         ; preds = %for.end79.6
  br label %for.body3.us.7

for.body3.us.7:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.7, %for.body3.us.preheader.7
  %indvars.iv162.7 = phi i64 [ 0, %for.body3.us.preheader.7 ], [ %indvars.iv.next163.7, %for.cond9.for.inc77_crit_edge.us.7 ]
  %321 = add nsw i64 %indvars.iv162.7, 127
  %arrayidx.us.7 = getelementptr inbounds float, float* %coef_real, i64 %321
  %322 = load float, float* %arrayidx.us.7, align 4, !tbaa !2
  %arrayidx8.us.7 = getelementptr inbounds float, float* %coef_imag, i64 %321
  %323 = load float, float* %arrayidx8.us.7, align 4, !tbaa !2
  %324 = shl nuw nsw i64 %indvars.iv162.7, 1
  %325 = trunc i64 %324 to i32
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.7, label %for.body3.us.new.7

for.body3.us.new.7:                               ; preds = %for.body3.us.7
  br label %for.body11.us.7

for.body11.us.7:                                  ; preds = %for.body11.us.7, %for.body3.us.new.7
  %indvars.iv.7 = phi i64 [ 0, %for.body3.us.new.7 ], [ %indvars.iv.next.3.7, %for.body11.us.7 ]
  %niter.7 = phi i64 [ 0, %for.body3.us.new.7 ], [ %niter.nsub.3.7, %for.body11.us.7 ]
  %326 = trunc i64 %indvars.iv.7 to i32
  %add13.us.7 = add i32 %326, %325
  %add14.us.7 = add i32 %add13.us.7, 1
  %idxprom15.us.7 = sext i32 %add14.us.7 to i64
  %arrayidx16.us.7 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.7
  %327 = load float, float* %arrayidx16.us.7, align 4, !tbaa !2
  %mul17.us.7 = fmul float %322, %327
  %arrayidx23.us.7 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.7
  %328 = load float, float* %arrayidx23.us.7, align 4, !tbaa !2
  %mul24.us.7 = fmul float %323, %328
  %sub25.us.7 = fsub float %mul17.us.7, %mul24.us.7
  %mul32.us.7 = fmul float %323, %327
  %mul39.us.7 = fmul float %322, %328
  %add40.us.7 = fadd float %mul32.us.7, %mul39.us.7
  %329 = add nuw nsw i64 %indvars.iv.7, %324
  %arrayidx45.us.7 = getelementptr inbounds float, float* %data_real, i64 %329
  %330 = load float, float* %arrayidx45.us.7, align 4, !tbaa !2
  %sub46.us.7 = fsub float %330, %sub25.us.7
  store float %sub46.us.7, float* %arrayidx16.us.7, align 4, !tbaa !2
  %331 = load float, float* %arrayidx45.us.7, align 4, !tbaa !2
  %add58.us.7 = fadd float %sub25.us.7, %331
  store float %add58.us.7, float* %arrayidx45.us.7, align 4, !tbaa !2
  %arrayidx63.us.7 = getelementptr inbounds float, float* %data_imag, i64 %329
  %332 = load float, float* %arrayidx63.us.7, align 4, !tbaa !2
  %sub64.us.7 = fsub float %332, %add40.us.7
  store float %sub64.us.7, float* %arrayidx23.us.7, align 4, !tbaa !2
  %333 = load float, float* %arrayidx63.us.7, align 4, !tbaa !2
  %add76.us.7 = fadd float %add40.us.7, %333
  store float %add76.us.7, float* %arrayidx63.us.7, align 4, !tbaa !2
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv.7, 1
  %niter.nsub.7 = sub i64 %niter.7, 1
  %334 = trunc i64 %indvars.iv.next.7 to i32
  %add13.us.1.7 = add i32 %334, %325
  %add14.us.1.7 = add i32 %add13.us.1.7, 1
  %idxprom15.us.1.7 = sext i32 %add14.us.1.7 to i64
  %arrayidx16.us.1.7 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.7
  %335 = load float, float* %arrayidx16.us.1.7, align 4, !tbaa !2
  %mul17.us.1.7 = fmul float %322, %335
  %arrayidx23.us.1.7 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.7
  %336 = load float, float* %arrayidx23.us.1.7, align 4, !tbaa !2
  %mul24.us.1.7 = fmul float %323, %336
  %sub25.us.1.7 = fsub float %mul17.us.1.7, %mul24.us.1.7
  %mul32.us.1.7 = fmul float %323, %335
  %mul39.us.1.7 = fmul float %322, %336
  %add40.us.1.7 = fadd float %mul32.us.1.7, %mul39.us.1.7
  %337 = add nuw nsw i64 %indvars.iv.next.7, %324
  %arrayidx45.us.1.7 = getelementptr inbounds float, float* %data_real, i64 %337
  %338 = load float, float* %arrayidx45.us.1.7, align 4, !tbaa !2
  %sub46.us.1.7 = fsub float %338, %sub25.us.1.7
  store float %sub46.us.1.7, float* %arrayidx16.us.1.7, align 4, !tbaa !2
  %339 = load float, float* %arrayidx45.us.1.7, align 4, !tbaa !2
  %add58.us.1.7 = fadd float %sub25.us.1.7, %339
  store float %add58.us.1.7, float* %arrayidx45.us.1.7, align 4, !tbaa !2
  %arrayidx63.us.1.7 = getelementptr inbounds float, float* %data_imag, i64 %337
  %340 = load float, float* %arrayidx63.us.1.7, align 4, !tbaa !2
  %sub64.us.1.7 = fsub float %340, %add40.us.1.7
  store float %sub64.us.1.7, float* %arrayidx23.us.1.7, align 4, !tbaa !2
  %341 = load float, float* %arrayidx63.us.1.7, align 4, !tbaa !2
  %add76.us.1.7 = fadd float %add40.us.1.7, %341
  store float %add76.us.1.7, float* %arrayidx63.us.1.7, align 4, !tbaa !2
  %indvars.iv.next.1.7 = add nuw nsw i64 %indvars.iv.next.7, 1
  %niter.nsub.1.7 = sub i64 %niter.nsub.7, 1
  %342 = trunc i64 %indvars.iv.next.1.7 to i32
  %add13.us.2.7 = add i32 %342, %325
  %add14.us.2.7 = add i32 %add13.us.2.7, 1
  %idxprom15.us.2.7 = sext i32 %add14.us.2.7 to i64
  %arrayidx16.us.2.7 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.7
  %343 = load float, float* %arrayidx16.us.2.7, align 4, !tbaa !2
  %mul17.us.2.7 = fmul float %322, %343
  %arrayidx23.us.2.7 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.7
  %344 = load float, float* %arrayidx23.us.2.7, align 4, !tbaa !2
  %mul24.us.2.7 = fmul float %323, %344
  %sub25.us.2.7 = fsub float %mul17.us.2.7, %mul24.us.2.7
  %mul32.us.2.7 = fmul float %323, %343
  %mul39.us.2.7 = fmul float %322, %344
  %add40.us.2.7 = fadd float %mul32.us.2.7, %mul39.us.2.7
  %345 = add nuw nsw i64 %indvars.iv.next.1.7, %324
  %arrayidx45.us.2.7 = getelementptr inbounds float, float* %data_real, i64 %345
  %346 = load float, float* %arrayidx45.us.2.7, align 4, !tbaa !2
  %sub46.us.2.7 = fsub float %346, %sub25.us.2.7
  store float %sub46.us.2.7, float* %arrayidx16.us.2.7, align 4, !tbaa !2
  %347 = load float, float* %arrayidx45.us.2.7, align 4, !tbaa !2
  %add58.us.2.7 = fadd float %sub25.us.2.7, %347
  store float %add58.us.2.7, float* %arrayidx45.us.2.7, align 4, !tbaa !2
  %arrayidx63.us.2.7 = getelementptr inbounds float, float* %data_imag, i64 %345
  %348 = load float, float* %arrayidx63.us.2.7, align 4, !tbaa !2
  %sub64.us.2.7 = fsub float %348, %add40.us.2.7
  store float %sub64.us.2.7, float* %arrayidx23.us.2.7, align 4, !tbaa !2
  %349 = load float, float* %arrayidx63.us.2.7, align 4, !tbaa !2
  %add76.us.2.7 = fadd float %add40.us.2.7, %349
  store float %add76.us.2.7, float* %arrayidx63.us.2.7, align 4, !tbaa !2
  %indvars.iv.next.2.7 = add nuw nsw i64 %indvars.iv.next.1.7, 1
  %niter.nsub.2.7 = sub i64 %niter.nsub.1.7, 1
  %350 = trunc i64 %indvars.iv.next.2.7 to i32
  %add13.us.3.7 = add i32 %350, %325
  %add14.us.3.7 = add i32 %add13.us.3.7, 1
  %idxprom15.us.3.7 = sext i32 %add14.us.3.7 to i64
  %arrayidx16.us.3.7 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.7
  %351 = load float, float* %arrayidx16.us.3.7, align 4, !tbaa !2
  %mul17.us.3.7 = fmul float %322, %351
  %arrayidx23.us.3.7 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.7
  %352 = load float, float* %arrayidx23.us.3.7, align 4, !tbaa !2
  %mul24.us.3.7 = fmul float %323, %352
  %sub25.us.3.7 = fsub float %mul17.us.3.7, %mul24.us.3.7
  %mul32.us.3.7 = fmul float %323, %351
  %mul39.us.3.7 = fmul float %322, %352
  %add40.us.3.7 = fadd float %mul32.us.3.7, %mul39.us.3.7
  %353 = add nuw nsw i64 %indvars.iv.next.2.7, %324
  %arrayidx45.us.3.7 = getelementptr inbounds float, float* %data_real, i64 %353
  %354 = load float, float* %arrayidx45.us.3.7, align 4, !tbaa !2
  %sub46.us.3.7 = fsub float %354, %sub25.us.3.7
  store float %sub46.us.3.7, float* %arrayidx16.us.3.7, align 4, !tbaa !2
  %355 = load float, float* %arrayidx45.us.3.7, align 4, !tbaa !2
  %add58.us.3.7 = fadd float %sub25.us.3.7, %355
  store float %add58.us.3.7, float* %arrayidx45.us.3.7, align 4, !tbaa !2
  %arrayidx63.us.3.7 = getelementptr inbounds float, float* %data_imag, i64 %353
  %356 = load float, float* %arrayidx63.us.3.7, align 4, !tbaa !2
  %sub64.us.3.7 = fsub float %356, %add40.us.3.7
  store float %sub64.us.3.7, float* %arrayidx23.us.3.7, align 4, !tbaa !2
  %357 = load float, float* %arrayidx63.us.3.7, align 4, !tbaa !2
  %add76.us.3.7 = fadd float %add40.us.3.7, %357
  store float %add76.us.3.7, float* %arrayidx63.us.3.7, align 4, !tbaa !2
  %indvars.iv.next.3.7 = add nuw nsw i64 %indvars.iv.next.2.7, 1
  %niter.nsub.3.7 = sub i64 %niter.nsub.2.7, 1
  %niter.ncmp.3.7 = icmp eq i64 %niter.nsub.3.7, 0
  br i1 %niter.ncmp.3.7, label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.7, label %for.body11.us.7, !llvm.loop !10

for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.7: ; preds = %for.body11.us.7
  %indvars.iv.unr.ph.7 = phi i64 [ %indvars.iv.next.3.7, %for.body11.us.7 ]
  br label %for.cond9.for.inc77_crit_edge.us.unr-lcssa.7

for.cond9.for.inc77_crit_edge.us.unr-lcssa.7:     ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.7, %for.body3.us.7
  %indvars.iv.unr.7 = phi i64 [ 0, %for.body3.us.7 ], [ %indvars.iv.unr.ph.7, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.loopexit.7 ]
  br i1 true, label %for.body11.us.epil.preheader.7, label %for.cond9.for.inc77_crit_edge.us.7

for.body11.us.epil.preheader.7:                   ; preds = %for.cond9.for.inc77_crit_edge.us.unr-lcssa.7
  br label %for.body11.us.epil.7

for.body11.us.epil.7:                             ; preds = %for.body11.us.epil.7, %for.body11.us.epil.preheader.7
  %indvars.iv.epil.7 = phi i64 [ %indvars.iv.unr.7, %for.body11.us.epil.preheader.7 ], [ %indvars.iv.next.epil.7, %for.body11.us.epil.7 ]
  %epil.iter.7 = phi i64 [ 1, %for.body11.us.epil.preheader.7 ], [ %epil.iter.sub.7, %for.body11.us.epil.7 ]
  %358 = trunc i64 %indvars.iv.epil.7 to i32
  %add13.us.epil.7 = add i32 %358, %325
  %add14.us.epil.7 = add i32 %add13.us.epil.7, 1
  %idxprom15.us.epil.7 = sext i32 %add14.us.epil.7 to i64
  %arrayidx16.us.epil.7 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.epil.7
  %359 = load float, float* %arrayidx16.us.epil.7, align 4, !tbaa !2
  %mul17.us.epil.7 = fmul float %322, %359
  %arrayidx23.us.epil.7 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.epil.7
  %360 = load float, float* %arrayidx23.us.epil.7, align 4, !tbaa !2
  %mul24.us.epil.7 = fmul float %323, %360
  %sub25.us.epil.7 = fsub float %mul17.us.epil.7, %mul24.us.epil.7
  %mul32.us.epil.7 = fmul float %323, %359
  %mul39.us.epil.7 = fmul float %322, %360
  %add40.us.epil.7 = fadd float %mul32.us.epil.7, %mul39.us.epil.7
  %361 = add nuw nsw i64 %indvars.iv.epil.7, %324
  %arrayidx45.us.epil.7 = getelementptr inbounds float, float* %data_real, i64 %361
  %362 = load float, float* %arrayidx45.us.epil.7, align 4, !tbaa !2
  %sub46.us.epil.7 = fsub float %362, %sub25.us.epil.7
  store float %sub46.us.epil.7, float* %arrayidx16.us.epil.7, align 4, !tbaa !2
  %363 = load float, float* %arrayidx45.us.epil.7, align 4, !tbaa !2
  %add58.us.epil.7 = fadd float %sub25.us.epil.7, %363
  store float %add58.us.epil.7, float* %arrayidx45.us.epil.7, align 4, !tbaa !2
  %arrayidx63.us.epil.7 = getelementptr inbounds float, float* %data_imag, i64 %361
  %364 = load float, float* %arrayidx63.us.epil.7, align 4, !tbaa !2
  %sub64.us.epil.7 = fsub float %364, %add40.us.epil.7
  store float %sub64.us.epil.7, float* %arrayidx23.us.epil.7, align 4, !tbaa !2
  %365 = load float, float* %arrayidx63.us.epil.7, align 4, !tbaa !2
  %add76.us.epil.7 = fadd float %add40.us.epil.7, %365
  store float %add76.us.epil.7, float* %arrayidx63.us.epil.7, align 4, !tbaa !2
  %indvars.iv.next.epil.7 = add nuw nsw i64 %indvars.iv.epil.7, 1
  %epil.iter.sub.7 = sub i64 %epil.iter.7, 1
  %epil.iter.cmp.7 = icmp ne i64 %epil.iter.sub.7, 0
  br i1 %epil.iter.cmp.7, label %for.body11.us.epil.7, label %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.7, !llvm.loop !11

for.cond9.for.inc77_crit_edge.us.epilog-lcssa.7:  ; preds = %for.body11.us.epil.7
  br label %for.cond9.for.inc77_crit_edge.us.7

for.cond9.for.inc77_crit_edge.us.7:               ; preds = %for.cond9.for.inc77_crit_edge.us.epilog-lcssa.7, %for.cond9.for.inc77_crit_edge.us.unr-lcssa.7
  %indvars.iv.next163.7 = add nuw nsw i64 %indvars.iv162.7, 1
  %exitcond168.7 = icmp eq i64 %indvars.iv.next163.7, 128
  br i1 %exitcond168.7, label %for.end79.loopexit.7, label %for.body3.us.7

for.end79.loopexit.7:                             ; preds = %for.cond9.for.inc77_crit_edge.us.7
  br label %for.end79.7

for.end79.7:                                      ; preds = %for.end79.loopexit.7, %for.end79.6
  ret void
}

declare dso_local i32 @output_dsp(...) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"float", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
