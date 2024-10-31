; ModuleID = 'fir_unroll.bc'
source_filename = "fir.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@input = dso_local local_unnamed_addr global [32 x float] zeroinitializer, align 16
@output = dso_local local_unnamed_addr global [32 x float] zeroinitializer, align 16
@coefficients = dso_local local_unnamed_addr global [32 x float] [float 2.500000e-01, float 1.500000e+00, float 3.750000e+00, float -2.250000e+00, float 5.000000e-01, float 7.500000e-01, float -3.000000e+00, float 1.250000e+00, float 2.500000e-01, float 1.500000e+00, float 3.750000e+00, float -2.250000e+00, float 5.000000e-01, float 7.500000e-01, float -3.000000e+00, float 1.250000e+00, float 2.500000e-01, float 1.500000e+00, float 3.750000e+00, float -2.250000e+00, float 5.000000e-01, float 7.500000e-01, float -3.000000e+00, float 1.250000e+00, float 2.500000e-01, float 1.500000e+00, float 3.750000e+00, float -2.250000e+00, float 5.000000e-01, float 7.500000e-01, float -3.000000e+00, float 1.250000e+00], align 16

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.3, %vector.body ]
  %vec.phi = phi <4 x float> [ zeroinitializer, %entry ], [ %23, %vector.body ]
  %0 = getelementptr inbounds [32 x float], [32 x float]* @input, i64 0, i64 %index
  %1 = bitcast float* %0 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %1, align 16, !tbaa !2
  %2 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %index
  %3 = bitcast float* %2 to <4 x float>*
  %wide.load1 = load <4 x float>, <4 x float>* %3, align 16, !tbaa !2
  %4 = fmul <4 x float> %wide.load, %wide.load1
  %5 = fadd <4 x float> %vec.phi, %4
  %index.next = add nuw nsw i64 %index, 4
  %6 = getelementptr inbounds [32 x float], [32 x float]* @input, i64 0, i64 %index.next
  %7 = bitcast float* %6 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %7, align 16, !tbaa !2
  %8 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %index.next
  %9 = bitcast float* %8 to <4 x float>*
  %wide.load1.1 = load <4 x float>, <4 x float>* %9, align 16, !tbaa !2
  %10 = fmul <4 x float> %wide.load.1, %wide.load1.1
  %11 = fadd <4 x float> %5, %10
  %index.next.1 = add nuw nsw i64 %index.next, 4
  %12 = getelementptr inbounds [32 x float], [32 x float]* @input, i64 0, i64 %index.next.1
  %13 = bitcast float* %12 to <4 x float>*
  %wide.load.2 = load <4 x float>, <4 x float>* %13, align 16, !tbaa !2
  %14 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %index.next.1
  %15 = bitcast float* %14 to <4 x float>*
  %wide.load1.2 = load <4 x float>, <4 x float>* %15, align 16, !tbaa !2
  %16 = fmul <4 x float> %wide.load.2, %wide.load1.2
  %17 = fadd <4 x float> %11, %16
  %index.next.2 = add nuw nsw i64 %index.next.1, 4
  %18 = getelementptr inbounds [32 x float], [32 x float]* @input, i64 0, i64 %index.next.2
  %19 = bitcast float* %18 to <4 x float>*
  %wide.load.3 = load <4 x float>, <4 x float>* %19, align 16, !tbaa !2
  %20 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %index.next.2
  %21 = bitcast float* %20 to <4 x float>*
  %wide.load1.3 = load <4 x float>, <4 x float>* %21, align 16, !tbaa !2
  %22 = fmul <4 x float> %wide.load.3, %wide.load1.3
  %23 = fadd <4 x float> %17, %22
  %index.next.3 = add nuw nsw i64 %index.next.2, 4
  %24 = icmp eq i64 %index.next.3, 32
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %.lcssa = phi <4 x float> [ %23, %vector.body ]
  %rdx.shuf = shufflevector <4 x float> %.lcssa, <4 x float> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = fadd <4 x float> %.lcssa, %rdx.shuf
  %rdx.shuf2 = shufflevector <4 x float> %bin.rdx, <4 x float> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx3 = fadd <4 x float> %bin.rdx, %rdx.shuf2
  %25 = extractelement <4 x float> %bin.rdx3, i32 0
  store float %25, float* getelementptr inbounds ([32 x float], [32 x float]* @output, i64 0, i64 0), align 16, !tbaa !2
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @_Z6kernelPfS_S_(float* nocapture readonly %input, float* nocapture %output, float* nocapture readonly %coefficient) local_unnamed_addr #0 {
entry:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.3, %vector.body ]
  %vec.phi = phi <4 x float> [ zeroinitializer, %entry ], [ %23, %vector.body ]
  %0 = getelementptr inbounds float, float* %input, i64 %index
  %1 = bitcast float* %0 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %1, align 4, !tbaa !2
  %2 = getelementptr inbounds float, float* %coefficient, i64 %index
  %3 = bitcast float* %2 to <4 x float>*
  %wide.load12 = load <4 x float>, <4 x float>* %3, align 4, !tbaa !2
  %4 = fmul <4 x float> %wide.load, %wide.load12
  %5 = fadd <4 x float> %vec.phi, %4
  %index.next = add nuw nsw i64 %index, 4
  %6 = getelementptr inbounds float, float* %input, i64 %index.next
  %7 = bitcast float* %6 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %7, align 4, !tbaa !2
  %8 = getelementptr inbounds float, float* %coefficient, i64 %index.next
  %9 = bitcast float* %8 to <4 x float>*
  %wide.load12.1 = load <4 x float>, <4 x float>* %9, align 4, !tbaa !2
  %10 = fmul <4 x float> %wide.load.1, %wide.load12.1
  %11 = fadd <4 x float> %5, %10
  %index.next.1 = add nuw nsw i64 %index.next, 4
  %12 = getelementptr inbounds float, float* %input, i64 %index.next.1
  %13 = bitcast float* %12 to <4 x float>*
  %wide.load.2 = load <4 x float>, <4 x float>* %13, align 4, !tbaa !2
  %14 = getelementptr inbounds float, float* %coefficient, i64 %index.next.1
  %15 = bitcast float* %14 to <4 x float>*
  %wide.load12.2 = load <4 x float>, <4 x float>* %15, align 4, !tbaa !2
  %16 = fmul <4 x float> %wide.load.2, %wide.load12.2
  %17 = fadd <4 x float> %11, %16
  %index.next.2 = add nuw nsw i64 %index.next.1, 4
  %18 = getelementptr inbounds float, float* %input, i64 %index.next.2
  %19 = bitcast float* %18 to <4 x float>*
  %wide.load.3 = load <4 x float>, <4 x float>* %19, align 4, !tbaa !2
  %20 = getelementptr inbounds float, float* %coefficient, i64 %index.next.2
  %21 = bitcast float* %20 to <4 x float>*
  %wide.load12.3 = load <4 x float>, <4 x float>* %21, align 4, !tbaa !2
  %22 = fmul <4 x float> %wide.load.3, %wide.load12.3
  %23 = fadd <4 x float> %17, %22
  %index.next.3 = add nuw nsw i64 %index.next.2, 4
  %24 = icmp eq i64 %index.next.3, 32
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  %.lcssa = phi <4 x float> [ %23, %vector.body ]
  %rdx.shuf = shufflevector <4 x float> %.lcssa, <4 x float> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = fadd <4 x float> %.lcssa, %rdx.shuf
  %rdx.shuf13 = shufflevector <4 x float> %bin.rdx, <4 x float> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx14 = fadd <4 x float> %bin.rdx, %rdx.shuf13
  %25 = extractelement <4 x float> %bin.rdx14, i32 0
  store float %25, float* %output, align 4, !tbaa !2
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
!6 = distinct !{!6, !7, !10}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized"}
!9 = !{!"llvm.loop.unroll.count", i32 4}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !7, !10}
