; ModuleID = 'fir.bc'
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
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x float> [ zeroinitializer, %entry ], [ %5, %vector.body ]
  %0 = getelementptr inbounds [32 x float], [32 x float]* @input, i64 0, i64 %index
  %1 = bitcast float* %0 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %1, align 16, !tbaa !2
  %2 = getelementptr inbounds [32 x float], [32 x float]* @coefficients, i64 0, i64 %index
  %3 = bitcast float* %2 to <4 x float>*
  %wide.load1 = load <4 x float>, <4 x float>* %3, align 16, !tbaa !2
  %4 = fmul <4 x float> %wide.load, %wide.load1
  %5 = fadd <4 x float> %vec.phi, %4
  %index.next = add i64 %index, 4
  %6 = icmp eq i64 %index.next, 32
  br i1 %6, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %rdx.shuf = shufflevector <4 x float> %5, <4 x float> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = fadd <4 x float> %5, %rdx.shuf
  %rdx.shuf2 = shufflevector <4 x float> %bin.rdx, <4 x float> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx3 = fadd <4 x float> %bin.rdx, %rdx.shuf2
  %7 = extractelement <4 x float> %bin.rdx3, i32 0
  store float %7, float* getelementptr inbounds ([32 x float], [32 x float]* @output, i64 0, i64 0), align 16, !tbaa !2
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @_Z6kernelPfS_S_(float* nocapture readonly %input, float* nocapture %output, float* nocapture readonly %coefficient) local_unnamed_addr #0 {
entry:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x float> [ zeroinitializer, %entry ], [ %5, %vector.body ]
  %0 = getelementptr inbounds float, float* %input, i64 %index
  %1 = bitcast float* %0 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %1, align 4, !tbaa !2
  %2 = getelementptr inbounds float, float* %coefficient, i64 %index
  %3 = bitcast float* %2 to <4 x float>*
  %wide.load12 = load <4 x float>, <4 x float>* %3, align 4, !tbaa !2
  %4 = fmul <4 x float> %wide.load, %wide.load12
  %5 = fadd <4 x float> %vec.phi, %4
  %index.next = add i64 %index, 4
  %6 = icmp eq i64 %index.next, 32
  br i1 %6, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %rdx.shuf = shufflevector <4 x float> %5, <4 x float> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = fadd <4 x float> %5, %rdx.shuf
  %rdx.shuf13 = shufflevector <4 x float> %bin.rdx, <4 x float> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx14 = fadd <4 x float> %bin.rdx, %rdx.shuf13
  %7 = extractelement <4 x float> %bin.rdx14, i32 0
  store float %7, float* %output, align 4, !tbaa !2
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
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized"}
!9 = !{!"llvm.loop.unroll.count", i32 4}
!10 = distinct !{!10, !7}
