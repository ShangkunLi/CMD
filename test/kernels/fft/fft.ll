; ModuleID = 'fft.bc'
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
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %0 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %index
  %1 = bitcast float* %0 to <4 x float>*
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %1, align 16, !tbaa !2
  %2 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %index
  %3 = bitcast float* %2 to <4 x float>*
  store <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float>* %3, align 16, !tbaa !2
  %4 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %index
  %5 = bitcast float* %4 to <4 x float>*
  store <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float>* %5, align 16, !tbaa !2
  %index.next = add i64 %index, 4
  %6 = icmp eq i64 %index.next, 256
  br i1 %6, label %for.cond1.preheader.i, label %vector.body, !llvm.loop !6

for.cond1.preheader.i:                            ; preds = %vector.body, %for.end79.i
  %buttersPerGroup.0158.i = phi i32 [ %shr.i, %for.end79.i ], [ 128, %vector.body ]
  %groupsPerStage.0157.i = phi i32 [ %shl80.i, %for.end79.i ], [ 1, %vector.body ]
  %i.0155.i = phi i32 [ %inc82.i, %for.end79.i ], [ 0, %vector.body ]
  %cmp2152.i = icmp sgt i32 %groupsPerStage.0157.i, 0
  %cmp10150.i = icmp sgt i32 %buttersPerGroup.0158.i, 0
  %or.cond.i = and i1 %cmp10150.i, %cmp2152.i
  br i1 %or.cond.i, label %for.body3.us.preheader.i, label %for.end79.i

for.body3.us.preheader.i:                         ; preds = %for.cond1.preheader.i
  %notmask.i = shl nsw i32 -1, %i.0155.i
  %sub.i = xor i32 %notmask.i, -1
  %7 = sext i32 %sub.i to i64
  %8 = zext i32 %buttersPerGroup.0158.i to i64
  %wide.trip.count167.i = zext i32 %groupsPerStage.0157.i to i64
  %9 = add nsw i64 %8, -1
  %10 = shl nsw i32 %buttersPerGroup.0158.i, 1
  %11 = shl nsw i32 %buttersPerGroup.0158.i, 1
  %scevgep22 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %8
  %12 = shl nuw nsw i64 %8, 1
  %scevgep31 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %8
  br label %for.body3.us.i

for.body3.us.i:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.i, %for.body3.us.preheader.i
  %indvars.iv162.i = phi i64 [ 0, %for.body3.us.preheader.i ], [ %indvars.iv.next163.i, %for.cond9.for.inc77_crit_edge.us.i ]
  %13 = trunc i64 %indvars.iv162.i to i32
  %14 = mul i32 %11, %13
  %15 = add i32 %buttersPerGroup.0158.i, %14
  %16 = sext i32 %15 to i64
  %scevgep = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %16
  %scevgep23 = getelementptr float, float* %scevgep22, i64 %16
  %17 = mul i64 %12, %indvars.iv162.i
  %scevgep25 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %17
  %18 = add i64 %17, %8
  %scevgep27 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %18
  %scevgep29 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %16
  %scevgep32 = getelementptr float, float* %scevgep31, i64 %16
  %scevgep34 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %17
  %scevgep36 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %18
  %19 = trunc i64 %indvars.iv162.i to i32
  %20 = mul i32 %10, %19
  %21 = add i32 %buttersPerGroup.0158.i, %20
  %22 = add nsw i64 %indvars.iv162.i, %7
  %arrayidx.us.i = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %22
  %23 = load float, float* %arrayidx.us.i, align 4, !tbaa !2
  %arrayidx8.us.i = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %22
  %24 = load float, float* %arrayidx8.us.i, align 4, !tbaa !2
  %25 = shl nuw nsw i64 %indvars.iv162.i, 1
  %26 = mul nuw nsw i64 %25, %8
  %27 = trunc i64 %26 to i32
  %add13.us.i = add i32 %buttersPerGroup.0158.i, %27
  %min.iters.check = icmp ult i32 %buttersPerGroup.0158.i, 4
  br i1 %min.iters.check, label %for.body11.us.i.preheader, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %for.body3.us.i
  %28 = trunc i64 %9 to i32
  %29 = add i32 %21, %28
  %30 = icmp slt i32 %29, %21
  %31 = icmp ugt i64 %9, 4294967295
  %32 = or i1 %30, %31
  br i1 %32, label %for.body11.us.i.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.scevcheck
  %bound0 = icmp ult float* %scevgep, %scevgep27
  %bound1 = icmp ult float* %scevgep25, %scevgep23
  %found.conflict = and i1 %bound0, %bound1
  %bound038 = icmp ult float* %scevgep29, %scevgep36
  %bound139 = icmp ult float* %scevgep34, %scevgep32
  %found.conflict40 = and i1 %bound038, %bound139
  %conflict.rdx = or i1 %found.conflict, %found.conflict40
  br i1 %conflict.rdx, label %for.body11.us.i.preheader, label %vector.ph41

vector.ph41:                                      ; preds = %vector.memcheck
  %n.vec = and i64 %8, 4294967292
  %broadcast.splatinsert52 = insertelement <4 x float> undef, float %23, i32 0
  %broadcast.splat53 = shufflevector <4 x float> %broadcast.splatinsert52, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert55 = insertelement <4 x float> undef, float %24, i32 0
  %broadcast.splat56 = shufflevector <4 x float> %broadcast.splatinsert55, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body18

vector.body18:                                    ; preds = %vector.body18, %vector.ph41
  %index42 = phi i64 [ 0, %vector.ph41 ], [ %index.next43, %vector.body18 ]
  %33 = trunc i64 %index42 to i32
  %34 = add i32 %add13.us.i, %33
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %35
  %37 = bitcast float* %36 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %37, align 4, !tbaa !2, !alias.scope !8, !noalias !11
  %38 = fmul <4 x float> %broadcast.splat53, %wide.load
  %39 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %35
  %40 = bitcast float* %39 to <4 x float>*
  %wide.load54 = load <4 x float>, <4 x float>* %40, align 4, !tbaa !2, !alias.scope !13, !noalias !15
  %41 = fmul <4 x float> %broadcast.splat56, %wide.load54
  %42 = fsub <4 x float> %38, %41
  %43 = fmul <4 x float> %broadcast.splat56, %wide.load
  %44 = fmul <4 x float> %broadcast.splat53, %wide.load54
  %45 = fadd <4 x float> %43, %44
  %46 = add nuw nsw i64 %index42, %26
  %47 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %46
  %48 = bitcast float* %47 to <4 x float>*
  %wide.load57 = load <4 x float>, <4 x float>* %48, align 8, !tbaa !2, !alias.scope !11
  %49 = fsub <4 x float> %wide.load57, %42
  %50 = bitcast float* %36 to <4 x float>*
  store <4 x float> %49, <4 x float>* %50, align 4, !tbaa !2, !alias.scope !8, !noalias !11
  %51 = bitcast float* %47 to <4 x float>*
  %wide.load58 = load <4 x float>, <4 x float>* %51, align 8, !tbaa !2, !alias.scope !11
  %52 = fadd <4 x float> %42, %wide.load58
  %53 = bitcast float* %47 to <4 x float>*
  store <4 x float> %52, <4 x float>* %53, align 8, !tbaa !2, !alias.scope !11
  %54 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %46
  %55 = bitcast float* %54 to <4 x float>*
  %wide.load59 = load <4 x float>, <4 x float>* %55, align 8, !tbaa !2, !alias.scope !15
  %56 = fsub <4 x float> %wide.load59, %45
  %57 = bitcast float* %39 to <4 x float>*
  store <4 x float> %56, <4 x float>* %57, align 4, !tbaa !2, !alias.scope !13, !noalias !15
  %58 = bitcast float* %54 to <4 x float>*
  %wide.load60 = load <4 x float>, <4 x float>* %58, align 8, !tbaa !2, !alias.scope !15
  %59 = fadd <4 x float> %45, %wide.load60
  %60 = bitcast float* %54 to <4 x float>*
  store <4 x float> %59, <4 x float>* %60, align 8, !tbaa !2, !alias.scope !15
  %index.next43 = add i64 %index42, 4
  %61 = icmp eq i64 %index.next43, %n.vec
  br i1 %61, label %middle.block16, label %vector.body18, !llvm.loop !17

middle.block16:                                   ; preds = %vector.body18
  %cmp.n45 = icmp eq i64 %n.vec, %8
  br i1 %cmp.n45, label %for.cond9.for.inc77_crit_edge.us.i, label %for.body11.us.i.preheader

for.body11.us.i.preheader:                        ; preds = %middle.block16, %vector.memcheck, %vector.scevcheck, %for.body3.us.i
  %indvars.iv.i.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %vector.scevcheck ], [ 0, %for.body3.us.i ], [ %n.vec, %middle.block16 ]
  br label %for.body11.us.i

for.body11.us.i:                                  ; preds = %for.body11.us.i.preheader, %for.body11.us.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body11.us.i ], [ %indvars.iv.i.ph, %for.body11.us.i.preheader ]
  %62 = trunc i64 %indvars.iv.i to i32
  %add14.us.i = add i32 %add13.us.i, %62
  %idxprom15.us.i = sext i32 %add14.us.i to i64
  %arrayidx16.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i
  %63 = load float, float* %arrayidx16.us.i, align 4, !tbaa !2
  %mul17.us.i = fmul float %23, %63
  %arrayidx23.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i
  %64 = load float, float* %arrayidx23.us.i, align 4, !tbaa !2
  %mul24.us.i = fmul float %24, %64
  %sub25.us.i = fsub float %mul17.us.i, %mul24.us.i
  %mul32.us.i = fmul float %24, %63
  %mul39.us.i = fmul float %23, %64
  %add40.us.i = fadd float %mul32.us.i, %mul39.us.i
  %65 = add nuw nsw i64 %indvars.iv.i, %26
  %arrayidx45.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %65
  %66 = load float, float* %arrayidx45.us.i, align 4, !tbaa !2
  %sub46.us.i = fsub float %66, %sub25.us.i
  store float %sub46.us.i, float* %arrayidx16.us.i, align 4, !tbaa !2
  %67 = load float, float* %arrayidx45.us.i, align 4, !tbaa !2
  %add58.us.i = fadd float %sub25.us.i, %67
  store float %add58.us.i, float* %arrayidx45.us.i, align 4, !tbaa !2
  %arrayidx63.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %65
  %68 = load float, float* %arrayidx63.us.i, align 4, !tbaa !2
  %sub64.us.i = fsub float %68, %add40.us.i
  store float %sub64.us.i, float* %arrayidx23.us.i, align 4, !tbaa !2
  %69 = load float, float* %arrayidx63.us.i, align 4, !tbaa !2
  %add76.us.i = fadd float %add40.us.i, %69
  store float %add76.us.i, float* %arrayidx63.us.i, align 4, !tbaa !2
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %8
  br i1 %exitcond.i, label %for.cond9.for.inc77_crit_edge.us.i, label %for.body11.us.i, !llvm.loop !21

for.cond9.for.inc77_crit_edge.us.i:               ; preds = %for.body11.us.i, %middle.block16
  %indvars.iv.next163.i = add nuw nsw i64 %indvars.iv162.i, 1
  %exitcond168.i = icmp eq i64 %indvars.iv.next163.i, %wide.trip.count167.i
  br i1 %exitcond168.i, label %for.end79.i, label %for.body3.us.i

for.end79.i:                                      ; preds = %for.cond9.for.inc77_crit_edge.us.i, %for.cond1.preheader.i
  %shl80.i = shl i32 %groupsPerStage.0157.i, 1
  %shr.i = ashr i32 %buttersPerGroup.0158.i, 1
  %inc82.i = add nuw nsw i32 %i.0155.i, 1
  %exitcond169.i = icmp eq i32 %inc82.i, 8
  br i1 %exitcond169.i, label %kernel.exit, label %for.cond1.preheader.i

kernel.exit:                                      ; preds = %for.end79.i
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

for.cond1.preheader:                              ; preds = %for.end79, %entry
  %buttersPerGroup.0158 = phi i32 [ 128, %entry ], [ %shr, %for.end79 ]
  %groupsPerStage.0157 = phi i32 [ 1, %entry ], [ %shl80, %for.end79 ]
  %i.0155 = phi i32 [ 0, %entry ], [ %inc82, %for.end79 ]
  %cmp2152 = icmp sgt i32 %groupsPerStage.0157, 0
  %cmp10150 = icmp sgt i32 %buttersPerGroup.0158, 0
  %or.cond = and i1 %cmp2152, %cmp10150
  br i1 %or.cond, label %for.body3.us.preheader, label %for.end79

for.body3.us.preheader:                           ; preds = %for.cond1.preheader
  %notmask = shl nsw i32 -1, %i.0155
  %sub = xor i32 %notmask, -1
  %0 = sext i32 %sub to i64
  %1 = zext i32 %buttersPerGroup.0158 to i64
  %wide.trip.count167 = zext i32 %groupsPerStage.0157 to i64
  %wide.trip.count = zext i32 %buttersPerGroup.0158 to i64
  %2 = add nsw i64 %wide.trip.count, -1
  %3 = shl nsw i32 %buttersPerGroup.0158, 1
  %4 = shl nsw i32 %buttersPerGroup.0158, 1
  %scevgep171 = getelementptr float, float* %data_real, i64 %wide.trip.count
  %5 = shl nuw nsw i64 %wide.trip.count, 1
  %scevgep180 = getelementptr float, float* %data_imag, i64 %wide.trip.count
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond9.for.inc77_crit_edge.us, %for.body3.us.preheader
  %indvars.iv162 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next163, %for.cond9.for.inc77_crit_edge.us ]
  %6 = trunc i64 %indvars.iv162 to i32
  %7 = mul i32 %4, %6
  %8 = add i32 %buttersPerGroup.0158, %7
  %9 = sext i32 %8 to i64
  %scevgep = getelementptr float, float* %data_real, i64 %9
  %scevgep172 = getelementptr float, float* %scevgep171, i64 %9
  %10 = mul i64 %5, %indvars.iv162
  %scevgep174 = getelementptr float, float* %data_real, i64 %10
  %11 = add i64 %10, %wide.trip.count
  %scevgep176 = getelementptr float, float* %data_real, i64 %11
  %scevgep178 = getelementptr float, float* %data_imag, i64 %9
  %scevgep181 = getelementptr float, float* %scevgep180, i64 %9
  %scevgep183 = getelementptr float, float* %data_imag, i64 %10
  %scevgep185 = getelementptr float, float* %data_imag, i64 %11
  %12 = trunc i64 %indvars.iv162 to i32
  %13 = mul i32 %3, %12
  %14 = add i32 %buttersPerGroup.0158, %13
  %15 = add nsw i64 %indvars.iv162, %0
  %arrayidx.us = getelementptr inbounds float, float* %coef_real, i64 %15
  %16 = load float, float* %arrayidx.us, align 4, !tbaa !2
  %arrayidx8.us = getelementptr inbounds float, float* %coef_imag, i64 %15
  %17 = load float, float* %arrayidx8.us, align 4, !tbaa !2
  %18 = shl nuw nsw i64 %indvars.iv162, 1
  %19 = mul nsw i64 %18, %1
  %20 = trunc i64 %19 to i32
  %min.iters.check = icmp ult i32 %buttersPerGroup.0158, 4
  br i1 %min.iters.check, label %for.body11.us.preheader, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %for.body3.us
  %21 = trunc i64 %2 to i32
  %22 = add i32 %14, %21
  %23 = icmp slt i32 %22, %14
  %24 = icmp ugt i64 %2, 4294967295
  %25 = or i1 %23, %24
  br i1 %25, label %for.body11.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.scevcheck
  %bound0 = icmp ult float* %scevgep, %scevgep176
  %bound1 = icmp ult float* %scevgep174, %scevgep172
  %found.conflict = and i1 %bound0, %bound1
  %bound0187 = icmp ugt float* %scevgep180, %data_real
  %bound1188 = icmp ugt float* %scevgep171, %data_imag
  %found.conflict189 = and i1 %bound0187, %bound1188
  %conflict.rdx = or i1 %found.conflict, %found.conflict189
  %bound0190 = icmp ult float* %scevgep, %scevgep185
  %bound1191 = icmp ult float* %scevgep183, %scevgep172
  %found.conflict192 = and i1 %bound0190, %bound1191
  %conflict.rdx193 = or i1 %conflict.rdx, %found.conflict192
  %bound0194 = icmp ult float* %scevgep174, %scevgep181
  %bound1195 = icmp ult float* %scevgep178, %scevgep176
  %found.conflict196 = and i1 %bound0194, %bound1195
  %conflict.rdx197 = or i1 %conflict.rdx193, %found.conflict196
  %bound0198 = icmp ult float* %scevgep174, %scevgep185
  %bound1199 = icmp ult float* %scevgep183, %scevgep176
  %found.conflict200 = and i1 %bound0198, %bound1199
  %conflict.rdx201 = or i1 %conflict.rdx197, %found.conflict200
  %bound0202 = icmp ult float* %scevgep178, %scevgep185
  %bound1203 = icmp ult float* %scevgep183, %scevgep181
  %found.conflict204 = and i1 %bound0202, %bound1203
  %conflict.rdx205 = or i1 %conflict.rdx201, %found.conflict204
  br i1 %conflict.rdx205, label %for.body11.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %wide.trip.count, 4294967292
  %broadcast.splatinsert209 = insertelement <4 x float> undef, float %16, i32 0
  %broadcast.splat210 = shufflevector <4 x float> %broadcast.splatinsert209, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert212 = insertelement <4 x float> undef, float %17, i32 0
  %broadcast.splat213 = shufflevector <4 x float> %broadcast.splatinsert212, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %26 = trunc i64 %index to i32
  %27 = add i32 %26, %20
  %28 = add i32 %27, %buttersPerGroup.0158
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float* %data_real, i64 %29
  %31 = bitcast float* %30 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %31, align 4, !tbaa !2, !alias.scope !22, !noalias !25
  %32 = fmul <4 x float> %broadcast.splat210, %wide.load
  %33 = getelementptr inbounds float, float* %data_imag, i64 %29
  %34 = bitcast float* %33 to <4 x float>*
  %wide.load211 = load <4 x float>, <4 x float>* %34, align 4, !tbaa !2, !alias.scope !29, !noalias !30
  %35 = fmul <4 x float> %broadcast.splat213, %wide.load211
  %36 = fsub <4 x float> %32, %35
  %37 = fmul <4 x float> %broadcast.splat213, %wide.load
  %38 = fmul <4 x float> %broadcast.splat210, %wide.load211
  %39 = fadd <4 x float> %37, %38
  %40 = add nuw nsw i64 %index, %19
  %41 = getelementptr inbounds float, float* %data_real, i64 %40
  %42 = bitcast float* %41 to <4 x float>*
  %wide.load214 = load <4 x float>, <4 x float>* %42, align 4, !tbaa !2, !alias.scope !31, !noalias !32
  %43 = fsub <4 x float> %wide.load214, %36
  %44 = bitcast float* %30 to <4 x float>*
  store <4 x float> %43, <4 x float>* %44, align 4, !tbaa !2, !alias.scope !22, !noalias !25
  %45 = bitcast float* %41 to <4 x float>*
  %wide.load215 = load <4 x float>, <4 x float>* %45, align 4, !tbaa !2, !alias.scope !31, !noalias !32
  %46 = fadd <4 x float> %36, %wide.load215
  %47 = bitcast float* %41 to <4 x float>*
  store <4 x float> %46, <4 x float>* %47, align 4, !tbaa !2, !alias.scope !31, !noalias !32
  %48 = getelementptr inbounds float, float* %data_imag, i64 %40
  %49 = bitcast float* %48 to <4 x float>*
  %wide.load216 = load <4 x float>, <4 x float>* %49, align 4, !tbaa !2, !alias.scope !30
  %50 = fsub <4 x float> %wide.load216, %39
  %51 = bitcast float* %33 to <4 x float>*
  store <4 x float> %50, <4 x float>* %51, align 4, !tbaa !2, !alias.scope !29, !noalias !30
  %52 = bitcast float* %48 to <4 x float>*
  %wide.load217 = load <4 x float>, <4 x float>* %52, align 4, !tbaa !2, !alias.scope !30
  %53 = fadd <4 x float> %39, %wide.load217
  %54 = bitcast float* %48 to <4 x float>*
  store <4 x float> %53, <4 x float>* %54, align 4, !tbaa !2, !alias.scope !30
  %index.next = add i64 %index, 4
  %55 = icmp eq i64 %index.next, %n.vec
  br i1 %55, label %middle.block, label %vector.body, !llvm.loop !33

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond9.for.inc77_crit_edge.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %vector.scevcheck, %for.body3.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %vector.scevcheck ], [ 0, %for.body3.us ], [ %n.vec, %middle.block ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11.us ], [ %indvars.iv.ph, %for.body11.us.preheader ]
  %56 = trunc i64 %indvars.iv to i32
  %add13.us = add i32 %56, %20
  %add14.us = add i32 %add13.us, %buttersPerGroup.0158
  %idxprom15.us = sext i32 %add14.us to i64
  %arrayidx16.us = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us
  %57 = load float, float* %arrayidx16.us, align 4, !tbaa !2
  %mul17.us = fmul float %16, %57
  %arrayidx23.us = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us
  %58 = load float, float* %arrayidx23.us, align 4, !tbaa !2
  %mul24.us = fmul float %17, %58
  %sub25.us = fsub float %mul17.us, %mul24.us
  %mul32.us = fmul float %17, %57
  %mul39.us = fmul float %16, %58
  %add40.us = fadd float %mul32.us, %mul39.us
  %59 = add nuw nsw i64 %indvars.iv, %19
  %arrayidx45.us = getelementptr inbounds float, float* %data_real, i64 %59
  %60 = load float, float* %arrayidx45.us, align 4, !tbaa !2
  %sub46.us = fsub float %60, %sub25.us
  store float %sub46.us, float* %arrayidx16.us, align 4, !tbaa !2
  %61 = load float, float* %arrayidx45.us, align 4, !tbaa !2
  %add58.us = fadd float %sub25.us, %61
  store float %add58.us, float* %arrayidx45.us, align 4, !tbaa !2
  %arrayidx63.us = getelementptr inbounds float, float* %data_imag, i64 %59
  %62 = load float, float* %arrayidx63.us, align 4, !tbaa !2
  %sub64.us = fsub float %62, %add40.us
  store float %sub64.us, float* %arrayidx23.us, align 4, !tbaa !2
  %63 = load float, float* %arrayidx63.us, align 4, !tbaa !2
  %add76.us = fadd float %add40.us, %63
  store float %add76.us, float* %arrayidx63.us, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond9.for.inc77_crit_edge.us, label %for.body11.us, !llvm.loop !34

for.cond9.for.inc77_crit_edge.us:                 ; preds = %for.body11.us, %middle.block
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next163, %wide.trip.count167
  br i1 %exitcond168, label %for.end79, label %for.body3.us

for.end79:                                        ; preds = %for.cond9.for.inc77_crit_edge.us, %for.cond1.preheader
  %shl80 = shl i32 %groupsPerStage.0157, 1
  %shr = ashr i32 %buttersPerGroup.0158, 1
  %inc82 = add nuw nsw i32 %i.0155, 1
  %exitcond169 = icmp eq i32 %inc82, 8
  br i1 %exitcond169, label %for.end83, label %for.cond1.preheader

for.end83:                                        ; preds = %for.end79
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
!7 = !{!"llvm.loop.isvectorized", i32 1}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!16}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !19, !20}
!19 = !{!"llvm.loop.isvectorized"}
!20 = !{!"llvm.loop.unroll.count", i32 4}
!21 = distinct !{!21, !18}
!22 = !{!23}
!23 = distinct !{!23, !24}
!24 = distinct !{!24, !"LVerDomain"}
!25 = !{!26, !27, !28}
!26 = distinct !{!26, !24}
!27 = distinct !{!27, !24}
!28 = distinct !{!28, !24}
!29 = !{!27}
!30 = !{!28}
!31 = !{!26}
!32 = !{!27, !28}
!33 = distinct !{!33, !18}
!34 = distinct !{!34, !18}
