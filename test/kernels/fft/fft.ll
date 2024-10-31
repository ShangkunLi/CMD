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
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %indvars.iv
  store float 1.000000e+00, float* %arrayidx, align 4, !tbaa !2
  %arrayidx2 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %indvars.iv
  store float 2.000000e+00, float* %arrayidx2, align 4, !tbaa !2
  %arrayidx4 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %indvars.iv
  store float 2.000000e+00, float* %arrayidx4, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %for.cond1.preheader.i, label %for.body

for.cond1.preheader.i:                            ; preds = %for.body, %for.end79.i
  %buttersPerGroup.0158.i = phi i32 [ %shr.i, %for.end79.i ], [ 128, %for.body ]
  %groupsPerStage.0157.i = phi i32 [ %shl80.i, %for.end79.i ], [ 1, %for.body ]
  %i.0155.i = phi i32 [ %inc82.i, %for.end79.i ], [ 0, %for.body ]
  %cmp2152.i = icmp sgt i32 %groupsPerStage.0157.i, 0
  %cmp10150.i = icmp sgt i32 %buttersPerGroup.0158.i, 0
  %or.cond.i = and i1 %cmp10150.i, %cmp2152.i
  br i1 %or.cond.i, label %for.body3.us.preheader.i, label %for.end79.i

for.body3.us.preheader.i:                         ; preds = %for.cond1.preheader.i
  %notmask.i = shl nsw i32 -1, %i.0155.i
  %sub.i = xor i32 %notmask.i, -1
  %0 = sext i32 %sub.i to i64
  %1 = zext i32 %buttersPerGroup.0158.i to i64
  %wide.trip.count167.i = zext i32 %groupsPerStage.0157.i to i64
  br label %for.body3.us.i

for.body3.us.i:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.i, %for.body3.us.preheader.i
  %indvars.iv162.i = phi i64 [ 0, %for.body3.us.preheader.i ], [ %indvars.iv.next163.i, %for.cond9.for.inc77_crit_edge.us.i ]
  %2 = add nsw i64 %indvars.iv162.i, %0
  %arrayidx.us.i = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %2
  %3 = load float, float* %arrayidx.us.i, align 4, !tbaa !2
  %arrayidx8.us.i = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %2
  %4 = load float, float* %arrayidx8.us.i, align 4, !tbaa !2
  %5 = shl nuw nsw i64 %indvars.iv162.i, 1
  %6 = mul nuw nsw i64 %5, %1
  %7 = trunc i64 %6 to i32
  %add13.us.i = add i32 %buttersPerGroup.0158.i, %7
  br label %for.body11.us.i

for.body11.us.i:                                  ; preds = %for.body11.us.i, %for.body3.us.i
  %indvars.iv.i = phi i64 [ 0, %for.body3.us.i ], [ %indvars.iv.next.i, %for.body11.us.i ]
  %8 = trunc i64 %indvars.iv.i to i32
  %add14.us.i = add i32 %add13.us.i, %8
  %idxprom15.us.i = sext i32 %add14.us.i to i64
  %arrayidx16.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i
  %9 = load float, float* %arrayidx16.us.i, align 4, !tbaa !2
  %mul17.us.i = fmul float %3, %9
  %arrayidx23.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i
  %10 = load float, float* %arrayidx23.us.i, align 4, !tbaa !2
  %mul24.us.i = fmul float %4, %10
  %sub25.us.i = fsub float %mul17.us.i, %mul24.us.i
  %mul32.us.i = fmul float %4, %9
  %mul39.us.i = fmul float %3, %10
  %add40.us.i = fadd float %mul32.us.i, %mul39.us.i
  %11 = add nuw nsw i64 %indvars.iv.i, %6
  %arrayidx45.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %11
  %12 = load float, float* %arrayidx45.us.i, align 4, !tbaa !2
  %sub46.us.i = fsub float %12, %sub25.us.i
  store float %sub46.us.i, float* %arrayidx16.us.i, align 4, !tbaa !2
  %13 = load float, float* %arrayidx45.us.i, align 4, !tbaa !2
  %add58.us.i = fadd float %sub25.us.i, %13
  store float %add58.us.i, float* %arrayidx45.us.i, align 4, !tbaa !2
  %arrayidx63.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %11
  %14 = load float, float* %arrayidx63.us.i, align 4, !tbaa !2
  %sub64.us.i = fsub float %14, %add40.us.i
  store float %sub64.us.i, float* %arrayidx23.us.i, align 4, !tbaa !2
  %15 = load float, float* %arrayidx63.us.i, align 4, !tbaa !2
  %add76.us.i = fadd float %add40.us.i, %15
  store float %add76.us.i, float* %arrayidx63.us.i, align 4, !tbaa !2
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %1
  br i1 %exitcond.i, label %for.cond9.for.inc77_crit_edge.us.i, label %for.body11.us.i

for.cond9.for.inc77_crit_edge.us.i:               ; preds = %for.body11.us.i
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
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond9.for.inc77_crit_edge.us, %for.body3.us.preheader
  %indvars.iv162 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next163, %for.cond9.for.inc77_crit_edge.us ]
  %2 = add nsw i64 %indvars.iv162, %0
  %arrayidx.us = getelementptr inbounds float, float* %coef_real, i64 %2
  %3 = load float, float* %arrayidx.us, align 4, !tbaa !2
  %arrayidx8.us = getelementptr inbounds float, float* %coef_imag, i64 %2
  %4 = load float, float* %arrayidx8.us, align 4, !tbaa !2
  %5 = shl nuw nsw i64 %indvars.iv162, 1
  %6 = mul nsw i64 %5, %1
  %7 = trunc i64 %6 to i32
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.body11.us ]
  %8 = trunc i64 %indvars.iv to i32
  %add13.us = add i32 %8, %7
  %add14.us = add i32 %add13.us, %buttersPerGroup.0158
  %idxprom15.us = sext i32 %add14.us to i64
  %arrayidx16.us = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us
  %9 = load float, float* %arrayidx16.us, align 4, !tbaa !2
  %mul17.us = fmul float %3, %9
  %arrayidx23.us = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us
  %10 = load float, float* %arrayidx23.us, align 4, !tbaa !2
  %mul24.us = fmul float %4, %10
  %sub25.us = fsub float %mul17.us, %mul24.us
  %mul32.us = fmul float %4, %9
  %mul39.us = fmul float %3, %10
  %add40.us = fadd float %mul32.us, %mul39.us
  %11 = add nuw nsw i64 %indvars.iv, %6
  %arrayidx45.us = getelementptr inbounds float, float* %data_real, i64 %11
  %12 = load float, float* %arrayidx45.us, align 4, !tbaa !2
  %sub46.us = fsub float %12, %sub25.us
  store float %sub46.us, float* %arrayidx16.us, align 4, !tbaa !2
  %13 = load float, float* %arrayidx45.us, align 4, !tbaa !2
  %add58.us = fadd float %sub25.us, %13
  store float %add58.us, float* %arrayidx45.us, align 4, !tbaa !2
  %arrayidx63.us = getelementptr inbounds float, float* %data_imag, i64 %11
  %14 = load float, float* %arrayidx63.us, align 4, !tbaa !2
  %sub64.us = fsub float %14, %add40.us
  store float %sub64.us, float* %arrayidx23.us, align 4, !tbaa !2
  %15 = load float, float* %arrayidx63.us, align 4, !tbaa !2
  %add76.us = fadd float %add40.us, %15
  store float %add76.us, float* %arrayidx63.us, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond9.for.inc77_crit_edge.us, label %for.body11.us

for.cond9.for.inc77_crit_edge.us:                 ; preds = %for.body11.us
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
