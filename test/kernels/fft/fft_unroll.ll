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
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.3, %vector.body ]
  %0 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %index
  %1 = bitcast float* %0 to <4 x float>*
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %1, align 16, !tbaa !2
  %2 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %index
  %3 = bitcast float* %2 to <4 x float>*
  store <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float>* %3, align 16, !tbaa !2
  %4 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %index
  %5 = bitcast float* %4 to <4 x float>*
  store <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float>* %5, align 16, !tbaa !2
  %index.next = add nuw nsw i64 %index, 4
  %6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %index.next
  %7 = bitcast float* %6 to <4 x float>*
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %7, align 16, !tbaa !2
  %8 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %index.next
  %9 = bitcast float* %8 to <4 x float>*
  store <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float>* %9, align 16, !tbaa !2
  %10 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %index.next
  %11 = bitcast float* %10 to <4 x float>*
  store <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float>* %11, align 16, !tbaa !2
  %index.next.1 = add nuw nsw i64 %index.next, 4
  %12 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %index.next.1
  %13 = bitcast float* %12 to <4 x float>*
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %13, align 16, !tbaa !2
  %14 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %index.next.1
  %15 = bitcast float* %14 to <4 x float>*
  store <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float>* %15, align 16, !tbaa !2
  %16 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %index.next.1
  %17 = bitcast float* %16 to <4 x float>*
  store <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float>* %17, align 16, !tbaa !2
  %index.next.2 = add nuw nsw i64 %index.next.1, 4
  %18 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %index.next.2
  %19 = bitcast float* %18 to <4 x float>*
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %19, align 16, !tbaa !2
  %20 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %index.next.2
  %21 = bitcast float* %20 to <4 x float>*
  store <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float>* %21, align 16, !tbaa !2
  %22 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %index.next.2
  %23 = bitcast float* %22 to <4 x float>*
  store <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float>* %23, align 16, !tbaa !2
  %index.next.3 = add nuw nsw i64 %index.next.2, 4
  %24 = icmp eq i64 %index.next.3, 256
  br i1 %24, label %for.cond1.preheader.i.preheader, label %vector.body, !llvm.loop !6

for.cond1.preheader.i.preheader:                  ; preds = %vector.body
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i.preheader
  br i1 true, label %for.body3.us.preheader.i, label %for.end79.i

for.body3.us.preheader.i:                         ; preds = %for.cond1.preheader.i
  br label %for.body3.us.i

for.body3.us.i:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.i, %for.body3.us.preheader.i
  %indvars.iv162.i = phi i64 [ 0, %for.body3.us.preheader.i ], [ %indvars.iv.next163.i, %for.cond9.for.inc77_crit_edge.us.i ]
  %25 = trunc i64 %indvars.iv162.i to i32
  %26 = mul i32 256, %25
  %27 = add i32 128, %26
  %28 = sext i32 %27 to i64
  %scevgep = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %28
  %scevgep23 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_real, i64 0, i64 128), i64 %28
  %29 = mul i64 256, %indvars.iv162.i
  %scevgep25 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %29
  %30 = add i64 %29, 128
  %scevgep27 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %30
  %scevgep29 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %28
  %scevgep32 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_imag, i64 0, i64 128), i64 %28
  %scevgep34 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %29
  %scevgep36 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %30
  %31 = trunc i64 %indvars.iv162.i to i32
  %32 = mul i32 256, %31
  %33 = add i32 128, %32
  %arrayidx.us.i = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %indvars.iv162.i
  %34 = load float, float* %arrayidx.us.i, align 4, !tbaa !2
  %arrayidx8.us.i = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %indvars.iv162.i
  %35 = load float, float* %arrayidx8.us.i, align 4, !tbaa !2
  %36 = shl nuw nsw i64 %indvars.iv162.i, 1
  %37 = mul nuw nsw i64 %36, 128
  %38 = trunc i64 %37 to i32
  %add13.us.i = add i32 128, %38
  br i1 false, label %for.body11.us.i.preheader, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %for.body3.us.i
  %39 = add i32 %33, 127
  %40 = icmp slt i32 %39, %33
  br i1 %40, label %for.body11.us.i.preheader, label %vector.memcheck

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
  %broadcast.splatinsert52 = insertelement <4 x float> undef, float %34, i32 0
  %broadcast.splat53 = shufflevector <4 x float> %broadcast.splatinsert52, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert55 = insertelement <4 x float> undef, float %35, i32 0
  %broadcast.splat56 = shufflevector <4 x float> %broadcast.splatinsert55, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block16.unr-lcssa, label %vector.ph41.new

vector.ph41.new:                                  ; preds = %vector.ph41
  br label %vector.body18

vector.body18:                                    ; preds = %vector.body18, %vector.ph41.new
  %index42 = phi i64 [ 0, %vector.ph41.new ], [ %index.next43.3, %vector.body18 ]
  %niter = phi i64 [ 32, %vector.ph41.new ], [ %niter.nsub.3, %vector.body18 ]
  %41 = trunc i64 %index42 to i32
  %42 = add i32 %add13.us.i, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %43
  %45 = bitcast float* %44 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %45, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %46 = fmul <4 x float> %broadcast.splat53, %wide.load
  %47 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %43
  %48 = bitcast float* %47 to <4 x float>*
  %wide.load54 = load <4 x float>, <4 x float>* %48, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %49 = fmul <4 x float> %broadcast.splat56, %wide.load54
  %50 = fsub <4 x float> %46, %49
  %51 = fmul <4 x float> %broadcast.splat56, %wide.load
  %52 = fmul <4 x float> %broadcast.splat53, %wide.load54
  %53 = fadd <4 x float> %51, %52
  %54 = add nuw nsw i64 %index42, %37
  %55 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %54
  %56 = bitcast float* %55 to <4 x float>*
  %wide.load57 = load <4 x float>, <4 x float>* %56, align 8, !tbaa !2, !alias.scope !12
  %57 = fsub <4 x float> %wide.load57, %50
  %58 = bitcast float* %44 to <4 x float>*
  store <4 x float> %57, <4 x float>* %58, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %59 = bitcast float* %55 to <4 x float>*
  %wide.load58 = load <4 x float>, <4 x float>* %59, align 8, !tbaa !2, !alias.scope !12
  %60 = fadd <4 x float> %50, %wide.load58
  %61 = bitcast float* %55 to <4 x float>*
  store <4 x float> %60, <4 x float>* %61, align 8, !tbaa !2, !alias.scope !12
  %62 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %54
  %63 = bitcast float* %62 to <4 x float>*
  %wide.load59 = load <4 x float>, <4 x float>* %63, align 8, !tbaa !2, !alias.scope !16
  %64 = fsub <4 x float> %wide.load59, %53
  %65 = bitcast float* %47 to <4 x float>*
  store <4 x float> %64, <4 x float>* %65, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %66 = bitcast float* %62 to <4 x float>*
  %wide.load60 = load <4 x float>, <4 x float>* %66, align 8, !tbaa !2, !alias.scope !16
  %67 = fadd <4 x float> %53, %wide.load60
  %68 = bitcast float* %62 to <4 x float>*
  store <4 x float> %67, <4 x float>* %68, align 8, !tbaa !2, !alias.scope !16
  %index.next43 = add nuw nsw i64 %index42, 4
  %niter.nsub = sub i64 %niter, 1
  %69 = trunc i64 %index.next43 to i32
  %70 = add i32 %add13.us.i, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %71
  %73 = bitcast float* %72 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %73, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %74 = fmul <4 x float> %broadcast.splat53, %wide.load.1
  %75 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %71
  %76 = bitcast float* %75 to <4 x float>*
  %wide.load54.1 = load <4 x float>, <4 x float>* %76, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %77 = fmul <4 x float> %broadcast.splat56, %wide.load54.1
  %78 = fsub <4 x float> %74, %77
  %79 = fmul <4 x float> %broadcast.splat56, %wide.load.1
  %80 = fmul <4 x float> %broadcast.splat53, %wide.load54.1
  %81 = fadd <4 x float> %79, %80
  %82 = add nuw nsw i64 %index.next43, %37
  %83 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %82
  %84 = bitcast float* %83 to <4 x float>*
  %wide.load57.1 = load <4 x float>, <4 x float>* %84, align 8, !tbaa !2, !alias.scope !12
  %85 = fsub <4 x float> %wide.load57.1, %78
  %86 = bitcast float* %72 to <4 x float>*
  store <4 x float> %85, <4 x float>* %86, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %87 = bitcast float* %83 to <4 x float>*
  %wide.load58.1 = load <4 x float>, <4 x float>* %87, align 8, !tbaa !2, !alias.scope !12
  %88 = fadd <4 x float> %78, %wide.load58.1
  %89 = bitcast float* %83 to <4 x float>*
  store <4 x float> %88, <4 x float>* %89, align 8, !tbaa !2, !alias.scope !12
  %90 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %82
  %91 = bitcast float* %90 to <4 x float>*
  %wide.load59.1 = load <4 x float>, <4 x float>* %91, align 8, !tbaa !2, !alias.scope !16
  %92 = fsub <4 x float> %wide.load59.1, %81
  %93 = bitcast float* %75 to <4 x float>*
  store <4 x float> %92, <4 x float>* %93, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %94 = bitcast float* %90 to <4 x float>*
  %wide.load60.1 = load <4 x float>, <4 x float>* %94, align 8, !tbaa !2, !alias.scope !16
  %95 = fadd <4 x float> %81, %wide.load60.1
  %96 = bitcast float* %90 to <4 x float>*
  store <4 x float> %95, <4 x float>* %96, align 8, !tbaa !2, !alias.scope !16
  %index.next43.1 = add nuw nsw i64 %index.next43, 4
  %niter.nsub.1 = sub i64 %niter.nsub, 1
  %97 = trunc i64 %index.next43.1 to i32
  %98 = add i32 %add13.us.i, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %99
  %101 = bitcast float* %100 to <4 x float>*
  %wide.load.2 = load <4 x float>, <4 x float>* %101, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %102 = fmul <4 x float> %broadcast.splat53, %wide.load.2
  %103 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %99
  %104 = bitcast float* %103 to <4 x float>*
  %wide.load54.2 = load <4 x float>, <4 x float>* %104, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %105 = fmul <4 x float> %broadcast.splat56, %wide.load54.2
  %106 = fsub <4 x float> %102, %105
  %107 = fmul <4 x float> %broadcast.splat56, %wide.load.2
  %108 = fmul <4 x float> %broadcast.splat53, %wide.load54.2
  %109 = fadd <4 x float> %107, %108
  %110 = add nuw nsw i64 %index.next43.1, %37
  %111 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %110
  %112 = bitcast float* %111 to <4 x float>*
  %wide.load57.2 = load <4 x float>, <4 x float>* %112, align 8, !tbaa !2, !alias.scope !12
  %113 = fsub <4 x float> %wide.load57.2, %106
  %114 = bitcast float* %100 to <4 x float>*
  store <4 x float> %113, <4 x float>* %114, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %115 = bitcast float* %111 to <4 x float>*
  %wide.load58.2 = load <4 x float>, <4 x float>* %115, align 8, !tbaa !2, !alias.scope !12
  %116 = fadd <4 x float> %106, %wide.load58.2
  %117 = bitcast float* %111 to <4 x float>*
  store <4 x float> %116, <4 x float>* %117, align 8, !tbaa !2, !alias.scope !12
  %118 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %110
  %119 = bitcast float* %118 to <4 x float>*
  %wide.load59.2 = load <4 x float>, <4 x float>* %119, align 8, !tbaa !2, !alias.scope !16
  %120 = fsub <4 x float> %wide.load59.2, %109
  %121 = bitcast float* %103 to <4 x float>*
  store <4 x float> %120, <4 x float>* %121, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %122 = bitcast float* %118 to <4 x float>*
  %wide.load60.2 = load <4 x float>, <4 x float>* %122, align 8, !tbaa !2, !alias.scope !16
  %123 = fadd <4 x float> %109, %wide.load60.2
  %124 = bitcast float* %118 to <4 x float>*
  store <4 x float> %123, <4 x float>* %124, align 8, !tbaa !2, !alias.scope !16
  %index.next43.2 = add nuw nsw i64 %index.next43.1, 4
  %niter.nsub.2 = sub i64 %niter.nsub.1, 1
  %125 = trunc i64 %index.next43.2 to i32
  %126 = add i32 %add13.us.i, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %127
  %129 = bitcast float* %128 to <4 x float>*
  %wide.load.3 = load <4 x float>, <4 x float>* %129, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %130 = fmul <4 x float> %broadcast.splat53, %wide.load.3
  %131 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %127
  %132 = bitcast float* %131 to <4 x float>*
  %wide.load54.3 = load <4 x float>, <4 x float>* %132, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %133 = fmul <4 x float> %broadcast.splat56, %wide.load54.3
  %134 = fsub <4 x float> %130, %133
  %135 = fmul <4 x float> %broadcast.splat56, %wide.load.3
  %136 = fmul <4 x float> %broadcast.splat53, %wide.load54.3
  %137 = fadd <4 x float> %135, %136
  %138 = add nuw nsw i64 %index.next43.2, %37
  %139 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %138
  %140 = bitcast float* %139 to <4 x float>*
  %wide.load57.3 = load <4 x float>, <4 x float>* %140, align 8, !tbaa !2, !alias.scope !12
  %141 = fsub <4 x float> %wide.load57.3, %134
  %142 = bitcast float* %128 to <4 x float>*
  store <4 x float> %141, <4 x float>* %142, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %143 = bitcast float* %139 to <4 x float>*
  %wide.load58.3 = load <4 x float>, <4 x float>* %143, align 8, !tbaa !2, !alias.scope !12
  %144 = fadd <4 x float> %134, %wide.load58.3
  %145 = bitcast float* %139 to <4 x float>*
  store <4 x float> %144, <4 x float>* %145, align 8, !tbaa !2, !alias.scope !12
  %146 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %138
  %147 = bitcast float* %146 to <4 x float>*
  %wide.load59.3 = load <4 x float>, <4 x float>* %147, align 8, !tbaa !2, !alias.scope !16
  %148 = fsub <4 x float> %wide.load59.3, %137
  %149 = bitcast float* %131 to <4 x float>*
  store <4 x float> %148, <4 x float>* %149, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %150 = bitcast float* %146 to <4 x float>*
  %wide.load60.3 = load <4 x float>, <4 x float>* %150, align 8, !tbaa !2, !alias.scope !16
  %151 = fadd <4 x float> %137, %wide.load60.3
  %152 = bitcast float* %146 to <4 x float>*
  store <4 x float> %151, <4 x float>* %152, align 8, !tbaa !2, !alias.scope !16
  %index.next43.3 = add i64 %index.next43.2, 4
  %niter.nsub.3 = sub i64 %niter.nsub.2, 1
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %middle.block16.unr-lcssa.loopexit, label %vector.body18, !llvm.loop !18

middle.block16.unr-lcssa.loopexit:                ; preds = %vector.body18
  %index42.unr.ph = phi i64 [ %index.next43.3, %vector.body18 ]
  br label %middle.block16.unr-lcssa

middle.block16.unr-lcssa:                         ; preds = %middle.block16.unr-lcssa.loopexit, %vector.ph41
  %index42.unr = phi i64 [ 0, %vector.ph41 ], [ %index42.unr.ph, %middle.block16.unr-lcssa.loopexit ]
  br i1 false, label %vector.body18.epil.preheader, label %middle.block16

vector.body18.epil.preheader:                     ; preds = %middle.block16.unr-lcssa
  br label %vector.body18.epil

vector.body18.epil:                               ; preds = %vector.body18.epil, %vector.body18.epil.preheader
  %index42.epil = phi i64 [ %index42.unr, %vector.body18.epil.preheader ], [ %index.next43.epil, %vector.body18.epil ]
  %epil.iter = phi i64 [ 0, %vector.body18.epil.preheader ], [ %epil.iter.sub, %vector.body18.epil ]
  %153 = trunc i64 %index42.epil to i32
  %154 = add i32 %add13.us.i, %153
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %155
  %157 = bitcast float* %156 to <4 x float>*
  %wide.load.epil = load <4 x float>, <4 x float>* %157, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %158 = fmul <4 x float> %broadcast.splat53, %wide.load.epil
  %159 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %155
  %160 = bitcast float* %159 to <4 x float>*
  %wide.load54.epil = load <4 x float>, <4 x float>* %160, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %161 = fmul <4 x float> %broadcast.splat56, %wide.load54.epil
  %162 = fsub <4 x float> %158, %161
  %163 = fmul <4 x float> %broadcast.splat56, %wide.load.epil
  %164 = fmul <4 x float> %broadcast.splat53, %wide.load54.epil
  %165 = fadd <4 x float> %163, %164
  %166 = add nuw nsw i64 %index42.epil, %37
  %167 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %166
  %168 = bitcast float* %167 to <4 x float>*
  %wide.load57.epil = load <4 x float>, <4 x float>* %168, align 8, !tbaa !2, !alias.scope !12
  %169 = fsub <4 x float> %wide.load57.epil, %162
  %170 = bitcast float* %156 to <4 x float>*
  store <4 x float> %169, <4 x float>* %170, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %171 = bitcast float* %167 to <4 x float>*
  %wide.load58.epil = load <4 x float>, <4 x float>* %171, align 8, !tbaa !2, !alias.scope !12
  %172 = fadd <4 x float> %162, %wide.load58.epil
  %173 = bitcast float* %167 to <4 x float>*
  store <4 x float> %172, <4 x float>* %173, align 8, !tbaa !2, !alias.scope !12
  %174 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %166
  %175 = bitcast float* %174 to <4 x float>*
  %wide.load59.epil = load <4 x float>, <4 x float>* %175, align 8, !tbaa !2, !alias.scope !16
  %176 = fsub <4 x float> %wide.load59.epil, %165
  %177 = bitcast float* %159 to <4 x float>*
  store <4 x float> %176, <4 x float>* %177, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %178 = bitcast float* %174 to <4 x float>*
  %wide.load60.epil = load <4 x float>, <4 x float>* %178, align 8, !tbaa !2, !alias.scope !16
  %179 = fadd <4 x float> %165, %wide.load60.epil
  %180 = bitcast float* %174 to <4 x float>*
  store <4 x float> %179, <4 x float>* %180, align 8, !tbaa !2, !alias.scope !16
  %index.next43.epil = add i64 %index42.epil, 4
  %epil.iter.sub = sub i64 %epil.iter, 1
  %epil.iter.cmp = icmp ne i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %vector.body18.epil, label %middle.block16.epilog-lcssa, !llvm.loop !22

middle.block16.epilog-lcssa:                      ; preds = %vector.body18.epil
  br label %middle.block16

middle.block16:                                   ; preds = %middle.block16.unr-lcssa, %middle.block16.epilog-lcssa
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.i, label %for.body11.us.i.preheader

for.body11.us.i.preheader:                        ; preds = %middle.block16, %vector.memcheck, %vector.scevcheck, %for.body3.us.i
  %indvars.iv.i.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %vector.scevcheck ], [ 0, %for.body3.us.i ], [ 128, %middle.block16 ]
  %181 = sub i64 128, %indvars.iv.i.ph
  %182 = sub i64 127, %indvars.iv.i.ph
  br i1 false, label %for.body11.us.i.prol.preheader, label %for.body11.us.i.prol.loopexit

for.body11.us.i.prol.preheader:                   ; preds = %for.body11.us.i.preheader
  br label %for.body11.us.i.prol

for.body11.us.i.prol:                             ; preds = %for.body11.us.i.prol, %for.body11.us.i.prol.preheader
  %indvars.iv.i.prol = phi i64 [ %indvars.iv.next.i.prol, %for.body11.us.i.prol ], [ %indvars.iv.i.ph, %for.body11.us.i.prol.preheader ]
  %prol.iter = phi i64 [ 0, %for.body11.us.i.prol.preheader ], [ %prol.iter.sub, %for.body11.us.i.prol ]
  %183 = trunc i64 %indvars.iv.i.prol to i32
  %add14.us.i.prol = add i32 %add13.us.i, %183
  %idxprom15.us.i.prol = sext i32 %add14.us.i.prol to i64
  %arrayidx16.us.i.prol = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.prol
  %184 = load float, float* %arrayidx16.us.i.prol, align 4, !tbaa !2
  %mul17.us.i.prol = fmul float %34, %184
  %arrayidx23.us.i.prol = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.prol
  %185 = load float, float* %arrayidx23.us.i.prol, align 4, !tbaa !2
  %mul24.us.i.prol = fmul float %35, %185
  %sub25.us.i.prol = fsub float %mul17.us.i.prol, %mul24.us.i.prol
  %mul32.us.i.prol = fmul float %35, %184
  %mul39.us.i.prol = fmul float %34, %185
  %add40.us.i.prol = fadd float %mul32.us.i.prol, %mul39.us.i.prol
  %186 = add nuw nsw i64 %indvars.iv.i.prol, %37
  %arrayidx45.us.i.prol = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %186
  %187 = load float, float* %arrayidx45.us.i.prol, align 4, !tbaa !2
  %sub46.us.i.prol = fsub float %187, %sub25.us.i.prol
  store float %sub46.us.i.prol, float* %arrayidx16.us.i.prol, align 4, !tbaa !2
  %188 = load float, float* %arrayidx45.us.i.prol, align 4, !tbaa !2
  %add58.us.i.prol = fadd float %sub25.us.i.prol, %188
  store float %add58.us.i.prol, float* %arrayidx45.us.i.prol, align 4, !tbaa !2
  %arrayidx63.us.i.prol = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %186
  %189 = load float, float* %arrayidx63.us.i.prol, align 4, !tbaa !2
  %sub64.us.i.prol = fsub float %189, %add40.us.i.prol
  store float %sub64.us.i.prol, float* %arrayidx23.us.i.prol, align 4, !tbaa !2
  %190 = load float, float* %arrayidx63.us.i.prol, align 4, !tbaa !2
  %add76.us.i.prol = fadd float %add40.us.i.prol, %190
  store float %add76.us.i.prol, float* %arrayidx63.us.i.prol, align 4, !tbaa !2
  %indvars.iv.next.i.prol = add nuw nsw i64 %indvars.iv.i.prol, 1
  %prol.iter.sub = sub i64 %prol.iter, 1
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body11.us.i.prol, label %for.body11.us.i.prol.loopexit.unr-lcssa, !llvm.loop !23

for.body11.us.i.prol.loopexit.unr-lcssa:          ; preds = %for.body11.us.i.prol
  %indvars.iv.i.unr.ph = phi i64 [ %indvars.iv.next.i.prol, %for.body11.us.i.prol ]
  br label %for.body11.us.i.prol.loopexit

for.body11.us.i.prol.loopexit:                    ; preds = %for.body11.us.i.prol.loopexit.unr-lcssa, %for.body11.us.i.preheader
  %indvars.iv.i.unr = phi i64 [ %indvars.iv.i.ph, %for.body11.us.i.preheader ], [ %indvars.iv.i.unr.ph, %for.body11.us.i.prol.loopexit.unr-lcssa ]
  %191 = icmp ult i64 %182, 3
  br i1 %191, label %for.cond9.for.inc77_crit_edge.us.i.loopexit, label %for.body11.us.i.preheader.new

for.body11.us.i.preheader.new:                    ; preds = %for.body11.us.i.prol.loopexit
  br label %for.body11.us.i

for.body11.us.i:                                  ; preds = %for.body11.us.i, %for.body11.us.i.preheader.new
  %indvars.iv.i = phi i64 [ %indvars.iv.i.unr, %for.body11.us.i.preheader.new ], [ %indvars.iv.next.i.3, %for.body11.us.i ]
  %192 = trunc i64 %indvars.iv.i to i32
  %add14.us.i = add i32 %add13.us.i, %192
  %idxprom15.us.i = sext i32 %add14.us.i to i64
  %arrayidx16.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i
  %193 = load float, float* %arrayidx16.us.i, align 4, !tbaa !2
  %mul17.us.i = fmul float %34, %193
  %arrayidx23.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i
  %194 = load float, float* %arrayidx23.us.i, align 4, !tbaa !2
  %mul24.us.i = fmul float %35, %194
  %sub25.us.i = fsub float %mul17.us.i, %mul24.us.i
  %mul32.us.i = fmul float %35, %193
  %mul39.us.i = fmul float %34, %194
  %add40.us.i = fadd float %mul32.us.i, %mul39.us.i
  %195 = add nuw nsw i64 %indvars.iv.i, %37
  %arrayidx45.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %195
  %196 = load float, float* %arrayidx45.us.i, align 4, !tbaa !2
  %sub46.us.i = fsub float %196, %sub25.us.i
  store float %sub46.us.i, float* %arrayidx16.us.i, align 4, !tbaa !2
  %197 = load float, float* %arrayidx45.us.i, align 4, !tbaa !2
  %add58.us.i = fadd float %sub25.us.i, %197
  store float %add58.us.i, float* %arrayidx45.us.i, align 4, !tbaa !2
  %arrayidx63.us.i = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %195
  %198 = load float, float* %arrayidx63.us.i, align 4, !tbaa !2
  %sub64.us.i = fsub float %198, %add40.us.i
  store float %sub64.us.i, float* %arrayidx23.us.i, align 4, !tbaa !2
  %199 = load float, float* %arrayidx63.us.i, align 4, !tbaa !2
  %add76.us.i = fadd float %add40.us.i, %199
  store float %add76.us.i, float* %arrayidx63.us.i, align 4, !tbaa !2
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %200 = trunc i64 %indvars.iv.next.i to i32
  %add14.us.i.1 = add i32 %add13.us.i, %200
  %idxprom15.us.i.1 = sext i32 %add14.us.i.1 to i64
  %arrayidx16.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1
  %201 = load float, float* %arrayidx16.us.i.1, align 4, !tbaa !2
  %mul17.us.i.1 = fmul float %34, %201
  %arrayidx23.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1
  %202 = load float, float* %arrayidx23.us.i.1, align 4, !tbaa !2
  %mul24.us.i.1 = fmul float %35, %202
  %sub25.us.i.1 = fsub float %mul17.us.i.1, %mul24.us.i.1
  %mul32.us.i.1 = fmul float %35, %201
  %mul39.us.i.1 = fmul float %34, %202
  %add40.us.i.1 = fadd float %mul32.us.i.1, %mul39.us.i.1
  %203 = add nuw nsw i64 %indvars.iv.next.i, %37
  %arrayidx45.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %203
  %204 = load float, float* %arrayidx45.us.i.1, align 4, !tbaa !2
  %sub46.us.i.1 = fsub float %204, %sub25.us.i.1
  store float %sub46.us.i.1, float* %arrayidx16.us.i.1, align 4, !tbaa !2
  %205 = load float, float* %arrayidx45.us.i.1, align 4, !tbaa !2
  %add58.us.i.1 = fadd float %sub25.us.i.1, %205
  store float %add58.us.i.1, float* %arrayidx45.us.i.1, align 4, !tbaa !2
  %arrayidx63.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %203
  %206 = load float, float* %arrayidx63.us.i.1, align 4, !tbaa !2
  %sub64.us.i.1 = fsub float %206, %add40.us.i.1
  store float %sub64.us.i.1, float* %arrayidx23.us.i.1, align 4, !tbaa !2
  %207 = load float, float* %arrayidx63.us.i.1, align 4, !tbaa !2
  %add76.us.i.1 = fadd float %add40.us.i.1, %207
  store float %add76.us.i.1, float* %arrayidx63.us.i.1, align 4, !tbaa !2
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.next.i, 1
  %208 = trunc i64 %indvars.iv.next.i.1 to i32
  %add14.us.i.2 = add i32 %add13.us.i, %208
  %idxprom15.us.i.2 = sext i32 %add14.us.i.2 to i64
  %arrayidx16.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2
  %209 = load float, float* %arrayidx16.us.i.2, align 4, !tbaa !2
  %mul17.us.i.2 = fmul float %34, %209
  %arrayidx23.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2
  %210 = load float, float* %arrayidx23.us.i.2, align 4, !tbaa !2
  %mul24.us.i.2 = fmul float %35, %210
  %sub25.us.i.2 = fsub float %mul17.us.i.2, %mul24.us.i.2
  %mul32.us.i.2 = fmul float %35, %209
  %mul39.us.i.2 = fmul float %34, %210
  %add40.us.i.2 = fadd float %mul32.us.i.2, %mul39.us.i.2
  %211 = add nuw nsw i64 %indvars.iv.next.i.1, %37
  %arrayidx45.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %211
  %212 = load float, float* %arrayidx45.us.i.2, align 4, !tbaa !2
  %sub46.us.i.2 = fsub float %212, %sub25.us.i.2
  store float %sub46.us.i.2, float* %arrayidx16.us.i.2, align 4, !tbaa !2
  %213 = load float, float* %arrayidx45.us.i.2, align 4, !tbaa !2
  %add58.us.i.2 = fadd float %sub25.us.i.2, %213
  store float %add58.us.i.2, float* %arrayidx45.us.i.2, align 4, !tbaa !2
  %arrayidx63.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %211
  %214 = load float, float* %arrayidx63.us.i.2, align 4, !tbaa !2
  %sub64.us.i.2 = fsub float %214, %add40.us.i.2
  store float %sub64.us.i.2, float* %arrayidx23.us.i.2, align 4, !tbaa !2
  %215 = load float, float* %arrayidx63.us.i.2, align 4, !tbaa !2
  %add76.us.i.2 = fadd float %add40.us.i.2, %215
  store float %add76.us.i.2, float* %arrayidx63.us.i.2, align 4, !tbaa !2
  %indvars.iv.next.i.2 = add nuw nsw i64 %indvars.iv.next.i.1, 1
  %216 = trunc i64 %indvars.iv.next.i.2 to i32
  %add14.us.i.3 = add i32 %add13.us.i, %216
  %idxprom15.us.i.3 = sext i32 %add14.us.i.3 to i64
  %arrayidx16.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3
  %217 = load float, float* %arrayidx16.us.i.3, align 4, !tbaa !2
  %mul17.us.i.3 = fmul float %34, %217
  %arrayidx23.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3
  %218 = load float, float* %arrayidx23.us.i.3, align 4, !tbaa !2
  %mul24.us.i.3 = fmul float %35, %218
  %sub25.us.i.3 = fsub float %mul17.us.i.3, %mul24.us.i.3
  %mul32.us.i.3 = fmul float %35, %217
  %mul39.us.i.3 = fmul float %34, %218
  %add40.us.i.3 = fadd float %mul32.us.i.3, %mul39.us.i.3
  %219 = add nuw nsw i64 %indvars.iv.next.i.2, %37
  %arrayidx45.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %219
  %220 = load float, float* %arrayidx45.us.i.3, align 4, !tbaa !2
  %sub46.us.i.3 = fsub float %220, %sub25.us.i.3
  store float %sub46.us.i.3, float* %arrayidx16.us.i.3, align 4, !tbaa !2
  %221 = load float, float* %arrayidx45.us.i.3, align 4, !tbaa !2
  %add58.us.i.3 = fadd float %sub25.us.i.3, %221
  store float %add58.us.i.3, float* %arrayidx45.us.i.3, align 4, !tbaa !2
  %arrayidx63.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %219
  %222 = load float, float* %arrayidx63.us.i.3, align 4, !tbaa !2
  %sub64.us.i.3 = fsub float %222, %add40.us.i.3
  store float %sub64.us.i.3, float* %arrayidx23.us.i.3, align 4, !tbaa !2
  %223 = load float, float* %arrayidx63.us.i.3, align 4, !tbaa !2
  %add76.us.i.3 = fadd float %add40.us.i.3, %223
  store float %add76.us.i.3, float* %arrayidx63.us.i.3, align 4, !tbaa !2
  %indvars.iv.next.i.3 = add nuw nsw i64 %indvars.iv.next.i.2, 1
  %exitcond.i.3 = icmp eq i64 %indvars.iv.next.i.3, 128
  br i1 %exitcond.i.3, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa, label %for.body11.us.i, !llvm.loop !24

for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa: ; preds = %for.body11.us.i
  br label %for.cond9.for.inc77_crit_edge.us.i.loopexit

for.cond9.for.inc77_crit_edge.us.i.loopexit:      ; preds = %for.body11.us.i.prol.loopexit, %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa
  br label %for.cond9.for.inc77_crit_edge.us.i

for.cond9.for.inc77_crit_edge.us.i:               ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit, %middle.block16
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
  %224 = trunc i64 %indvars.iv162.i.1 to i32
  %225 = mul i32 128, %224
  %226 = add i32 64, %225
  %227 = sext i32 %226 to i64
  %scevgep.1 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %227
  %scevgep23.1 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_real, i64 0, i64 64), i64 %227
  %228 = mul i64 128, %indvars.iv162.i.1
  %scevgep25.1 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %228
  %229 = add i64 %228, 64
  %scevgep27.1 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %229
  %scevgep29.1 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %227
  %scevgep32.1 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_imag, i64 0, i64 64), i64 %227
  %scevgep34.1 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %228
  %scevgep36.1 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %229
  %230 = trunc i64 %indvars.iv162.i.1 to i32
  %231 = mul i32 128, %230
  %232 = add i32 64, %231
  %233 = add nsw i64 %indvars.iv162.i.1, 1
  %arrayidx.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %233
  %234 = load float, float* %arrayidx.us.i.1, align 4, !tbaa !2
  %arrayidx8.us.i.1 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %233
  %235 = load float, float* %arrayidx8.us.i.1, align 4, !tbaa !2
  %236 = shl nuw nsw i64 %indvars.iv162.i.1, 1
  %237 = mul nuw nsw i64 %236, 64
  %238 = trunc i64 %237 to i32
  %add13.us.i.1 = add i32 64, %238
  br i1 false, label %for.body11.us.i.preheader.1, label %vector.scevcheck.1

vector.scevcheck.1:                               ; preds = %for.body3.us.i.1
  %239 = add i32 %232, 63
  %240 = icmp slt i32 %239, %232
  br i1 %240, label %for.body11.us.i.preheader.1, label %vector.memcheck.1

vector.memcheck.1:                                ; preds = %vector.scevcheck.1
  %bound0.1 = icmp ult float* %scevgep.1, %scevgep27.1
  %bound1.1 = icmp ult float* %scevgep25.1, %scevgep23.1
  %found.conflict.1 = and i1 %bound0.1, %bound1.1
  %bound038.1 = icmp ult float* %scevgep29.1, %scevgep36.1
  %bound139.1 = icmp ult float* %scevgep34.1, %scevgep32.1
  %found.conflict40.1 = and i1 %bound038.1, %bound139.1
  %conflict.rdx.1 = or i1 %found.conflict.1, %found.conflict40.1
  br i1 %conflict.rdx.1, label %for.body11.us.i.preheader.1, label %vector.ph41.1

vector.ph41.1:                                    ; preds = %vector.memcheck.1
  %broadcast.splatinsert52.1 = insertelement <4 x float> undef, float %234, i32 0
  %broadcast.splat53.1 = shufflevector <4 x float> %broadcast.splatinsert52.1, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert55.1 = insertelement <4 x float> undef, float %235, i32 0
  %broadcast.splat56.1 = shufflevector <4 x float> %broadcast.splatinsert55.1, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block16.unr-lcssa.1, label %vector.ph41.new.1

vector.ph41.new.1:                                ; preds = %vector.ph41.1
  br label %vector.body18.1

vector.body18.1:                                  ; preds = %vector.body18.1, %vector.ph41.new.1
  %index42.1 = phi i64 [ 0, %vector.ph41.new.1 ], [ %index.next43.3.1, %vector.body18.1 ]
  %niter.1 = phi i64 [ 16, %vector.ph41.new.1 ], [ %niter.nsub.3.1, %vector.body18.1 ]
  %241 = trunc i64 %index42.1 to i32
  %242 = add i32 %add13.us.i.1, %241
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %243
  %245 = bitcast float* %244 to <4 x float>*
  %wide.load.13 = load <4 x float>, <4 x float>* %245, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %246 = fmul <4 x float> %broadcast.splat53.1, %wide.load.13
  %247 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %243
  %248 = bitcast float* %247 to <4 x float>*
  %wide.load54.14 = load <4 x float>, <4 x float>* %248, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %249 = fmul <4 x float> %broadcast.splat56.1, %wide.load54.14
  %250 = fsub <4 x float> %246, %249
  %251 = fmul <4 x float> %broadcast.splat56.1, %wide.load.13
  %252 = fmul <4 x float> %broadcast.splat53.1, %wide.load54.14
  %253 = fadd <4 x float> %251, %252
  %254 = add nuw nsw i64 %index42.1, %237
  %255 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %254
  %256 = bitcast float* %255 to <4 x float>*
  %wide.load57.15 = load <4 x float>, <4 x float>* %256, align 8, !tbaa !2, !alias.scope !12
  %257 = fsub <4 x float> %wide.load57.15, %250
  %258 = bitcast float* %244 to <4 x float>*
  store <4 x float> %257, <4 x float>* %258, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %259 = bitcast float* %255 to <4 x float>*
  %wide.load58.16 = load <4 x float>, <4 x float>* %259, align 8, !tbaa !2, !alias.scope !12
  %260 = fadd <4 x float> %250, %wide.load58.16
  %261 = bitcast float* %255 to <4 x float>*
  store <4 x float> %260, <4 x float>* %261, align 8, !tbaa !2, !alias.scope !12
  %262 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %254
  %263 = bitcast float* %262 to <4 x float>*
  %wide.load59.17 = load <4 x float>, <4 x float>* %263, align 8, !tbaa !2, !alias.scope !16
  %264 = fsub <4 x float> %wide.load59.17, %253
  %265 = bitcast float* %247 to <4 x float>*
  store <4 x float> %264, <4 x float>* %265, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %266 = bitcast float* %262 to <4 x float>*
  %wide.load60.18 = load <4 x float>, <4 x float>* %266, align 8, !tbaa !2, !alias.scope !16
  %267 = fadd <4 x float> %253, %wide.load60.18
  %268 = bitcast float* %262 to <4 x float>*
  store <4 x float> %267, <4 x float>* %268, align 8, !tbaa !2, !alias.scope !16
  %index.next43.19 = add nuw nsw i64 %index42.1, 4
  %niter.nsub.110 = sub i64 %niter.1, 1
  %269 = trunc i64 %index.next43.19 to i32
  %270 = add i32 %add13.us.i.1, %269
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %271
  %273 = bitcast float* %272 to <4 x float>*
  %wide.load.1.1 = load <4 x float>, <4 x float>* %273, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %274 = fmul <4 x float> %broadcast.splat53.1, %wide.load.1.1
  %275 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %271
  %276 = bitcast float* %275 to <4 x float>*
  %wide.load54.1.1 = load <4 x float>, <4 x float>* %276, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %277 = fmul <4 x float> %broadcast.splat56.1, %wide.load54.1.1
  %278 = fsub <4 x float> %274, %277
  %279 = fmul <4 x float> %broadcast.splat56.1, %wide.load.1.1
  %280 = fmul <4 x float> %broadcast.splat53.1, %wide.load54.1.1
  %281 = fadd <4 x float> %279, %280
  %282 = add nuw nsw i64 %index.next43.19, %237
  %283 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %282
  %284 = bitcast float* %283 to <4 x float>*
  %wide.load57.1.1 = load <4 x float>, <4 x float>* %284, align 8, !tbaa !2, !alias.scope !12
  %285 = fsub <4 x float> %wide.load57.1.1, %278
  %286 = bitcast float* %272 to <4 x float>*
  store <4 x float> %285, <4 x float>* %286, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %287 = bitcast float* %283 to <4 x float>*
  %wide.load58.1.1 = load <4 x float>, <4 x float>* %287, align 8, !tbaa !2, !alias.scope !12
  %288 = fadd <4 x float> %278, %wide.load58.1.1
  %289 = bitcast float* %283 to <4 x float>*
  store <4 x float> %288, <4 x float>* %289, align 8, !tbaa !2, !alias.scope !12
  %290 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %282
  %291 = bitcast float* %290 to <4 x float>*
  %wide.load59.1.1 = load <4 x float>, <4 x float>* %291, align 8, !tbaa !2, !alias.scope !16
  %292 = fsub <4 x float> %wide.load59.1.1, %281
  %293 = bitcast float* %275 to <4 x float>*
  store <4 x float> %292, <4 x float>* %293, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %294 = bitcast float* %290 to <4 x float>*
  %wide.load60.1.1 = load <4 x float>, <4 x float>* %294, align 8, !tbaa !2, !alias.scope !16
  %295 = fadd <4 x float> %281, %wide.load60.1.1
  %296 = bitcast float* %290 to <4 x float>*
  store <4 x float> %295, <4 x float>* %296, align 8, !tbaa !2, !alias.scope !16
  %index.next43.1.1 = add nuw nsw i64 %index.next43.19, 4
  %niter.nsub.1.1 = sub i64 %niter.nsub.110, 1
  %297 = trunc i64 %index.next43.1.1 to i32
  %298 = add i32 %add13.us.i.1, %297
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %299
  %301 = bitcast float* %300 to <4 x float>*
  %wide.load.2.1 = load <4 x float>, <4 x float>* %301, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %302 = fmul <4 x float> %broadcast.splat53.1, %wide.load.2.1
  %303 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %299
  %304 = bitcast float* %303 to <4 x float>*
  %wide.load54.2.1 = load <4 x float>, <4 x float>* %304, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %305 = fmul <4 x float> %broadcast.splat56.1, %wide.load54.2.1
  %306 = fsub <4 x float> %302, %305
  %307 = fmul <4 x float> %broadcast.splat56.1, %wide.load.2.1
  %308 = fmul <4 x float> %broadcast.splat53.1, %wide.load54.2.1
  %309 = fadd <4 x float> %307, %308
  %310 = add nuw nsw i64 %index.next43.1.1, %237
  %311 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %310
  %312 = bitcast float* %311 to <4 x float>*
  %wide.load57.2.1 = load <4 x float>, <4 x float>* %312, align 8, !tbaa !2, !alias.scope !12
  %313 = fsub <4 x float> %wide.load57.2.1, %306
  %314 = bitcast float* %300 to <4 x float>*
  store <4 x float> %313, <4 x float>* %314, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %315 = bitcast float* %311 to <4 x float>*
  %wide.load58.2.1 = load <4 x float>, <4 x float>* %315, align 8, !tbaa !2, !alias.scope !12
  %316 = fadd <4 x float> %306, %wide.load58.2.1
  %317 = bitcast float* %311 to <4 x float>*
  store <4 x float> %316, <4 x float>* %317, align 8, !tbaa !2, !alias.scope !12
  %318 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %310
  %319 = bitcast float* %318 to <4 x float>*
  %wide.load59.2.1 = load <4 x float>, <4 x float>* %319, align 8, !tbaa !2, !alias.scope !16
  %320 = fsub <4 x float> %wide.load59.2.1, %309
  %321 = bitcast float* %303 to <4 x float>*
  store <4 x float> %320, <4 x float>* %321, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %322 = bitcast float* %318 to <4 x float>*
  %wide.load60.2.1 = load <4 x float>, <4 x float>* %322, align 8, !tbaa !2, !alias.scope !16
  %323 = fadd <4 x float> %309, %wide.load60.2.1
  %324 = bitcast float* %318 to <4 x float>*
  store <4 x float> %323, <4 x float>* %324, align 8, !tbaa !2, !alias.scope !16
  %index.next43.2.1 = add nuw nsw i64 %index.next43.1.1, 4
  %niter.nsub.2.1 = sub i64 %niter.nsub.1.1, 1
  %325 = trunc i64 %index.next43.2.1 to i32
  %326 = add i32 %add13.us.i.1, %325
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %327
  %329 = bitcast float* %328 to <4 x float>*
  %wide.load.3.1 = load <4 x float>, <4 x float>* %329, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %330 = fmul <4 x float> %broadcast.splat53.1, %wide.load.3.1
  %331 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %327
  %332 = bitcast float* %331 to <4 x float>*
  %wide.load54.3.1 = load <4 x float>, <4 x float>* %332, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %333 = fmul <4 x float> %broadcast.splat56.1, %wide.load54.3.1
  %334 = fsub <4 x float> %330, %333
  %335 = fmul <4 x float> %broadcast.splat56.1, %wide.load.3.1
  %336 = fmul <4 x float> %broadcast.splat53.1, %wide.load54.3.1
  %337 = fadd <4 x float> %335, %336
  %338 = add nuw nsw i64 %index.next43.2.1, %237
  %339 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %338
  %340 = bitcast float* %339 to <4 x float>*
  %wide.load57.3.1 = load <4 x float>, <4 x float>* %340, align 8, !tbaa !2, !alias.scope !12
  %341 = fsub <4 x float> %wide.load57.3.1, %334
  %342 = bitcast float* %328 to <4 x float>*
  store <4 x float> %341, <4 x float>* %342, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %343 = bitcast float* %339 to <4 x float>*
  %wide.load58.3.1 = load <4 x float>, <4 x float>* %343, align 8, !tbaa !2, !alias.scope !12
  %344 = fadd <4 x float> %334, %wide.load58.3.1
  %345 = bitcast float* %339 to <4 x float>*
  store <4 x float> %344, <4 x float>* %345, align 8, !tbaa !2, !alias.scope !12
  %346 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %338
  %347 = bitcast float* %346 to <4 x float>*
  %wide.load59.3.1 = load <4 x float>, <4 x float>* %347, align 8, !tbaa !2, !alias.scope !16
  %348 = fsub <4 x float> %wide.load59.3.1, %337
  %349 = bitcast float* %331 to <4 x float>*
  store <4 x float> %348, <4 x float>* %349, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %350 = bitcast float* %346 to <4 x float>*
  %wide.load60.3.1 = load <4 x float>, <4 x float>* %350, align 8, !tbaa !2, !alias.scope !16
  %351 = fadd <4 x float> %337, %wide.load60.3.1
  %352 = bitcast float* %346 to <4 x float>*
  store <4 x float> %351, <4 x float>* %352, align 8, !tbaa !2, !alias.scope !16
  %index.next43.3.1 = add i64 %index.next43.2.1, 4
  %niter.nsub.3.1 = sub i64 %niter.nsub.2.1, 1
  %niter.ncmp.3.1 = icmp eq i64 %niter.nsub.3.1, 0
  br i1 %niter.ncmp.3.1, label %middle.block16.unr-lcssa.loopexit.1, label %vector.body18.1, !llvm.loop !18

middle.block16.unr-lcssa.loopexit.1:              ; preds = %vector.body18.1
  %index42.unr.ph.1 = phi i64 [ %index.next43.3.1, %vector.body18.1 ]
  br label %middle.block16.unr-lcssa.1

middle.block16.unr-lcssa.1:                       ; preds = %middle.block16.unr-lcssa.loopexit.1, %vector.ph41.1
  %index42.unr.1 = phi i64 [ 0, %vector.ph41.1 ], [ %index42.unr.ph.1, %middle.block16.unr-lcssa.loopexit.1 ]
  br i1 false, label %vector.body18.epil.preheader.1, label %middle.block16.1

vector.body18.epil.preheader.1:                   ; preds = %middle.block16.unr-lcssa.1
  br label %vector.body18.epil.1

vector.body18.epil.1:                             ; preds = %vector.body18.epil.1, %vector.body18.epil.preheader.1
  %index42.epil.1 = phi i64 [ %index42.unr.1, %vector.body18.epil.preheader.1 ], [ %index.next43.epil.1, %vector.body18.epil.1 ]
  %epil.iter.1 = phi i64 [ 0, %vector.body18.epil.preheader.1 ], [ %epil.iter.sub.1, %vector.body18.epil.1 ]
  %353 = trunc i64 %index42.epil.1 to i32
  %354 = add i32 %add13.us.i.1, %353
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %355
  %357 = bitcast float* %356 to <4 x float>*
  %wide.load.epil.1 = load <4 x float>, <4 x float>* %357, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %358 = fmul <4 x float> %broadcast.splat53.1, %wide.load.epil.1
  %359 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %355
  %360 = bitcast float* %359 to <4 x float>*
  %wide.load54.epil.1 = load <4 x float>, <4 x float>* %360, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %361 = fmul <4 x float> %broadcast.splat56.1, %wide.load54.epil.1
  %362 = fsub <4 x float> %358, %361
  %363 = fmul <4 x float> %broadcast.splat56.1, %wide.load.epil.1
  %364 = fmul <4 x float> %broadcast.splat53.1, %wide.load54.epil.1
  %365 = fadd <4 x float> %363, %364
  %366 = add nuw nsw i64 %index42.epil.1, %237
  %367 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %366
  %368 = bitcast float* %367 to <4 x float>*
  %wide.load57.epil.1 = load <4 x float>, <4 x float>* %368, align 8, !tbaa !2, !alias.scope !12
  %369 = fsub <4 x float> %wide.load57.epil.1, %362
  %370 = bitcast float* %356 to <4 x float>*
  store <4 x float> %369, <4 x float>* %370, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %371 = bitcast float* %367 to <4 x float>*
  %wide.load58.epil.1 = load <4 x float>, <4 x float>* %371, align 8, !tbaa !2, !alias.scope !12
  %372 = fadd <4 x float> %362, %wide.load58.epil.1
  %373 = bitcast float* %367 to <4 x float>*
  store <4 x float> %372, <4 x float>* %373, align 8, !tbaa !2, !alias.scope !12
  %374 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %366
  %375 = bitcast float* %374 to <4 x float>*
  %wide.load59.epil.1 = load <4 x float>, <4 x float>* %375, align 8, !tbaa !2, !alias.scope !16
  %376 = fsub <4 x float> %wide.load59.epil.1, %365
  %377 = bitcast float* %359 to <4 x float>*
  store <4 x float> %376, <4 x float>* %377, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %378 = bitcast float* %374 to <4 x float>*
  %wide.load60.epil.1 = load <4 x float>, <4 x float>* %378, align 8, !tbaa !2, !alias.scope !16
  %379 = fadd <4 x float> %365, %wide.load60.epil.1
  %380 = bitcast float* %374 to <4 x float>*
  store <4 x float> %379, <4 x float>* %380, align 8, !tbaa !2, !alias.scope !16
  %index.next43.epil.1 = add i64 %index42.epil.1, 4
  %epil.iter.sub.1 = sub i64 %epil.iter.1, 1
  %epil.iter.cmp.1 = icmp ne i64 %epil.iter.sub.1, 0
  br i1 %epil.iter.cmp.1, label %vector.body18.epil.1, label %middle.block16.epilog-lcssa.1, !llvm.loop !22

middle.block16.epilog-lcssa.1:                    ; preds = %vector.body18.epil.1
  br label %middle.block16.1

middle.block16.1:                                 ; preds = %middle.block16.epilog-lcssa.1, %middle.block16.unr-lcssa.1
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.i.1, label %for.body11.us.i.preheader.1

for.body11.us.i.preheader.1:                      ; preds = %middle.block16.1, %vector.memcheck.1, %vector.scevcheck.1, %for.body3.us.i.1
  %indvars.iv.i.ph.1 = phi i64 [ 0, %vector.memcheck.1 ], [ 0, %vector.scevcheck.1 ], [ 0, %for.body3.us.i.1 ], [ 64, %middle.block16.1 ]
  %381 = sub i64 64, %indvars.iv.i.ph.1
  %382 = sub i64 63, %indvars.iv.i.ph.1
  br i1 false, label %for.body11.us.i.prol.preheader.1, label %for.body11.us.i.prol.loopexit.1

for.body11.us.i.prol.preheader.1:                 ; preds = %for.body11.us.i.preheader.1
  br label %for.body11.us.i.prol.1

for.body11.us.i.prol.1:                           ; preds = %for.body11.us.i.prol.1, %for.body11.us.i.prol.preheader.1
  %indvars.iv.i.prol.1 = phi i64 [ %indvars.iv.next.i.prol.1, %for.body11.us.i.prol.1 ], [ %indvars.iv.i.ph.1, %for.body11.us.i.prol.preheader.1 ]
  %prol.iter.1 = phi i64 [ 0, %for.body11.us.i.prol.preheader.1 ], [ %prol.iter.sub.1, %for.body11.us.i.prol.1 ]
  %383 = trunc i64 %indvars.iv.i.prol.1 to i32
  %add14.us.i.prol.1 = add i32 %add13.us.i.1, %383
  %idxprom15.us.i.prol.1 = sext i32 %add14.us.i.prol.1 to i64
  %arrayidx16.us.i.prol.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.prol.1
  %384 = load float, float* %arrayidx16.us.i.prol.1, align 4, !tbaa !2
  %mul17.us.i.prol.1 = fmul float %234, %384
  %arrayidx23.us.i.prol.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.prol.1
  %385 = load float, float* %arrayidx23.us.i.prol.1, align 4, !tbaa !2
  %mul24.us.i.prol.1 = fmul float %235, %385
  %sub25.us.i.prol.1 = fsub float %mul17.us.i.prol.1, %mul24.us.i.prol.1
  %mul32.us.i.prol.1 = fmul float %235, %384
  %mul39.us.i.prol.1 = fmul float %234, %385
  %add40.us.i.prol.1 = fadd float %mul32.us.i.prol.1, %mul39.us.i.prol.1
  %386 = add nuw nsw i64 %indvars.iv.i.prol.1, %237
  %arrayidx45.us.i.prol.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %386
  %387 = load float, float* %arrayidx45.us.i.prol.1, align 4, !tbaa !2
  %sub46.us.i.prol.1 = fsub float %387, %sub25.us.i.prol.1
  store float %sub46.us.i.prol.1, float* %arrayidx16.us.i.prol.1, align 4, !tbaa !2
  %388 = load float, float* %arrayidx45.us.i.prol.1, align 4, !tbaa !2
  %add58.us.i.prol.1 = fadd float %sub25.us.i.prol.1, %388
  store float %add58.us.i.prol.1, float* %arrayidx45.us.i.prol.1, align 4, !tbaa !2
  %arrayidx63.us.i.prol.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %386
  %389 = load float, float* %arrayidx63.us.i.prol.1, align 4, !tbaa !2
  %sub64.us.i.prol.1 = fsub float %389, %add40.us.i.prol.1
  store float %sub64.us.i.prol.1, float* %arrayidx23.us.i.prol.1, align 4, !tbaa !2
  %390 = load float, float* %arrayidx63.us.i.prol.1, align 4, !tbaa !2
  %add76.us.i.prol.1 = fadd float %add40.us.i.prol.1, %390
  store float %add76.us.i.prol.1, float* %arrayidx63.us.i.prol.1, align 4, !tbaa !2
  %indvars.iv.next.i.prol.1 = add nuw nsw i64 %indvars.iv.i.prol.1, 1
  %prol.iter.sub.1 = sub i64 %prol.iter.1, 1
  %prol.iter.cmp.1 = icmp ne i64 %prol.iter.sub.1, 0
  br i1 %prol.iter.cmp.1, label %for.body11.us.i.prol.1, label %for.body11.us.i.prol.loopexit.unr-lcssa.1, !llvm.loop !23

for.body11.us.i.prol.loopexit.unr-lcssa.1:        ; preds = %for.body11.us.i.prol.1
  %indvars.iv.i.unr.ph.1 = phi i64 [ %indvars.iv.next.i.prol.1, %for.body11.us.i.prol.1 ]
  br label %for.body11.us.i.prol.loopexit.1

for.body11.us.i.prol.loopexit.1:                  ; preds = %for.body11.us.i.prol.loopexit.unr-lcssa.1, %for.body11.us.i.preheader.1
  %indvars.iv.i.unr.1 = phi i64 [ %indvars.iv.i.ph.1, %for.body11.us.i.preheader.1 ], [ %indvars.iv.i.unr.ph.1, %for.body11.us.i.prol.loopexit.unr-lcssa.1 ]
  %391 = icmp ult i64 %382, 3
  br i1 %391, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.1, label %for.body11.us.i.preheader.new.1

for.body11.us.i.preheader.new.1:                  ; preds = %for.body11.us.i.prol.loopexit.1
  br label %for.body11.us.i.1

for.body11.us.i.1:                                ; preds = %for.body11.us.i.1, %for.body11.us.i.preheader.new.1
  %indvars.iv.i.1 = phi i64 [ %indvars.iv.i.unr.1, %for.body11.us.i.preheader.new.1 ], [ %indvars.iv.next.i.3.1, %for.body11.us.i.1 ]
  %392 = trunc i64 %indvars.iv.i.1 to i32
  %add14.us.i.111 = add i32 %add13.us.i.1, %392
  %idxprom15.us.i.112 = sext i32 %add14.us.i.111 to i64
  %arrayidx16.us.i.113 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.112
  %393 = load float, float* %arrayidx16.us.i.113, align 4, !tbaa !2
  %mul17.us.i.114 = fmul float %234, %393
  %arrayidx23.us.i.115 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.112
  %394 = load float, float* %arrayidx23.us.i.115, align 4, !tbaa !2
  %mul24.us.i.116 = fmul float %235, %394
  %sub25.us.i.117 = fsub float %mul17.us.i.114, %mul24.us.i.116
  %mul32.us.i.118 = fmul float %235, %393
  %mul39.us.i.119 = fmul float %234, %394
  %add40.us.i.120 = fadd float %mul32.us.i.118, %mul39.us.i.119
  %395 = add nuw nsw i64 %indvars.iv.i.1, %237
  %arrayidx45.us.i.121 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %395
  %396 = load float, float* %arrayidx45.us.i.121, align 4, !tbaa !2
  %sub46.us.i.122 = fsub float %396, %sub25.us.i.117
  store float %sub46.us.i.122, float* %arrayidx16.us.i.113, align 4, !tbaa !2
  %397 = load float, float* %arrayidx45.us.i.121, align 4, !tbaa !2
  %add58.us.i.123 = fadd float %sub25.us.i.117, %397
  store float %add58.us.i.123, float* %arrayidx45.us.i.121, align 4, !tbaa !2
  %arrayidx63.us.i.124 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %395
  %398 = load float, float* %arrayidx63.us.i.124, align 4, !tbaa !2
  %sub64.us.i.125 = fsub float %398, %add40.us.i.120
  store float %sub64.us.i.125, float* %arrayidx23.us.i.115, align 4, !tbaa !2
  %399 = load float, float* %arrayidx63.us.i.124, align 4, !tbaa !2
  %add76.us.i.126 = fadd float %add40.us.i.120, %399
  store float %add76.us.i.126, float* %arrayidx63.us.i.124, align 4, !tbaa !2
  %indvars.iv.next.i.127 = add nuw nsw i64 %indvars.iv.i.1, 1
  %400 = trunc i64 %indvars.iv.next.i.127 to i32
  %add14.us.i.1.1 = add i32 %add13.us.i.1, %400
  %idxprom15.us.i.1.1 = sext i32 %add14.us.i.1.1 to i64
  %arrayidx16.us.i.1.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.1
  %401 = load float, float* %arrayidx16.us.i.1.1, align 4, !tbaa !2
  %mul17.us.i.1.1 = fmul float %234, %401
  %arrayidx23.us.i.1.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.1
  %402 = load float, float* %arrayidx23.us.i.1.1, align 4, !tbaa !2
  %mul24.us.i.1.1 = fmul float %235, %402
  %sub25.us.i.1.1 = fsub float %mul17.us.i.1.1, %mul24.us.i.1.1
  %mul32.us.i.1.1 = fmul float %235, %401
  %mul39.us.i.1.1 = fmul float %234, %402
  %add40.us.i.1.1 = fadd float %mul32.us.i.1.1, %mul39.us.i.1.1
  %403 = add nuw nsw i64 %indvars.iv.next.i.127, %237
  %arrayidx45.us.i.1.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %403
  %404 = load float, float* %arrayidx45.us.i.1.1, align 4, !tbaa !2
  %sub46.us.i.1.1 = fsub float %404, %sub25.us.i.1.1
  store float %sub46.us.i.1.1, float* %arrayidx16.us.i.1.1, align 4, !tbaa !2
  %405 = load float, float* %arrayidx45.us.i.1.1, align 4, !tbaa !2
  %add58.us.i.1.1 = fadd float %sub25.us.i.1.1, %405
  store float %add58.us.i.1.1, float* %arrayidx45.us.i.1.1, align 4, !tbaa !2
  %arrayidx63.us.i.1.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %403
  %406 = load float, float* %arrayidx63.us.i.1.1, align 4, !tbaa !2
  %sub64.us.i.1.1 = fsub float %406, %add40.us.i.1.1
  store float %sub64.us.i.1.1, float* %arrayidx23.us.i.1.1, align 4, !tbaa !2
  %407 = load float, float* %arrayidx63.us.i.1.1, align 4, !tbaa !2
  %add76.us.i.1.1 = fadd float %add40.us.i.1.1, %407
  store float %add76.us.i.1.1, float* %arrayidx63.us.i.1.1, align 4, !tbaa !2
  %indvars.iv.next.i.1.1 = add nuw nsw i64 %indvars.iv.next.i.127, 1
  %408 = trunc i64 %indvars.iv.next.i.1.1 to i32
  %add14.us.i.2.1 = add i32 %add13.us.i.1, %408
  %idxprom15.us.i.2.1 = sext i32 %add14.us.i.2.1 to i64
  %arrayidx16.us.i.2.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.1
  %409 = load float, float* %arrayidx16.us.i.2.1, align 4, !tbaa !2
  %mul17.us.i.2.1 = fmul float %234, %409
  %arrayidx23.us.i.2.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.1
  %410 = load float, float* %arrayidx23.us.i.2.1, align 4, !tbaa !2
  %mul24.us.i.2.1 = fmul float %235, %410
  %sub25.us.i.2.1 = fsub float %mul17.us.i.2.1, %mul24.us.i.2.1
  %mul32.us.i.2.1 = fmul float %235, %409
  %mul39.us.i.2.1 = fmul float %234, %410
  %add40.us.i.2.1 = fadd float %mul32.us.i.2.1, %mul39.us.i.2.1
  %411 = add nuw nsw i64 %indvars.iv.next.i.1.1, %237
  %arrayidx45.us.i.2.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %411
  %412 = load float, float* %arrayidx45.us.i.2.1, align 4, !tbaa !2
  %sub46.us.i.2.1 = fsub float %412, %sub25.us.i.2.1
  store float %sub46.us.i.2.1, float* %arrayidx16.us.i.2.1, align 4, !tbaa !2
  %413 = load float, float* %arrayidx45.us.i.2.1, align 4, !tbaa !2
  %add58.us.i.2.1 = fadd float %sub25.us.i.2.1, %413
  store float %add58.us.i.2.1, float* %arrayidx45.us.i.2.1, align 4, !tbaa !2
  %arrayidx63.us.i.2.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %411
  %414 = load float, float* %arrayidx63.us.i.2.1, align 4, !tbaa !2
  %sub64.us.i.2.1 = fsub float %414, %add40.us.i.2.1
  store float %sub64.us.i.2.1, float* %arrayidx23.us.i.2.1, align 4, !tbaa !2
  %415 = load float, float* %arrayidx63.us.i.2.1, align 4, !tbaa !2
  %add76.us.i.2.1 = fadd float %add40.us.i.2.1, %415
  store float %add76.us.i.2.1, float* %arrayidx63.us.i.2.1, align 4, !tbaa !2
  %indvars.iv.next.i.2.1 = add nuw nsw i64 %indvars.iv.next.i.1.1, 1
  %416 = trunc i64 %indvars.iv.next.i.2.1 to i32
  %add14.us.i.3.1 = add i32 %add13.us.i.1, %416
  %idxprom15.us.i.3.1 = sext i32 %add14.us.i.3.1 to i64
  %arrayidx16.us.i.3.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.1
  %417 = load float, float* %arrayidx16.us.i.3.1, align 4, !tbaa !2
  %mul17.us.i.3.1 = fmul float %234, %417
  %arrayidx23.us.i.3.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.1
  %418 = load float, float* %arrayidx23.us.i.3.1, align 4, !tbaa !2
  %mul24.us.i.3.1 = fmul float %235, %418
  %sub25.us.i.3.1 = fsub float %mul17.us.i.3.1, %mul24.us.i.3.1
  %mul32.us.i.3.1 = fmul float %235, %417
  %mul39.us.i.3.1 = fmul float %234, %418
  %add40.us.i.3.1 = fadd float %mul32.us.i.3.1, %mul39.us.i.3.1
  %419 = add nuw nsw i64 %indvars.iv.next.i.2.1, %237
  %arrayidx45.us.i.3.1 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %419
  %420 = load float, float* %arrayidx45.us.i.3.1, align 4, !tbaa !2
  %sub46.us.i.3.1 = fsub float %420, %sub25.us.i.3.1
  store float %sub46.us.i.3.1, float* %arrayidx16.us.i.3.1, align 4, !tbaa !2
  %421 = load float, float* %arrayidx45.us.i.3.1, align 4, !tbaa !2
  %add58.us.i.3.1 = fadd float %sub25.us.i.3.1, %421
  store float %add58.us.i.3.1, float* %arrayidx45.us.i.3.1, align 4, !tbaa !2
  %arrayidx63.us.i.3.1 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %419
  %422 = load float, float* %arrayidx63.us.i.3.1, align 4, !tbaa !2
  %sub64.us.i.3.1 = fsub float %422, %add40.us.i.3.1
  store float %sub64.us.i.3.1, float* %arrayidx23.us.i.3.1, align 4, !tbaa !2
  %423 = load float, float* %arrayidx63.us.i.3.1, align 4, !tbaa !2
  %add76.us.i.3.1 = fadd float %add40.us.i.3.1, %423
  store float %add76.us.i.3.1, float* %arrayidx63.us.i.3.1, align 4, !tbaa !2
  %indvars.iv.next.i.3.1 = add nuw nsw i64 %indvars.iv.next.i.2.1, 1
  %exitcond.i.3.1 = icmp eq i64 %indvars.iv.next.i.3.1, 64
  br i1 %exitcond.i.3.1, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.1, label %for.body11.us.i.1, !llvm.loop !24

for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.1: ; preds = %for.body11.us.i.1
  br label %for.cond9.for.inc77_crit_edge.us.i.loopexit.1

for.cond9.for.inc77_crit_edge.us.i.loopexit.1:    ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.1, %for.body11.us.i.prol.loopexit.1
  br label %for.cond9.for.inc77_crit_edge.us.i.1

for.cond9.for.inc77_crit_edge.us.i.1:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.1, %middle.block16.1
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
  %424 = trunc i64 %indvars.iv162.i.2 to i32
  %425 = mul i32 64, %424
  %426 = add i32 32, %425
  %427 = sext i32 %426 to i64
  %scevgep.2 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %427
  %scevgep23.2 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_real, i64 0, i64 32), i64 %427
  %428 = mul i64 64, %indvars.iv162.i.2
  %scevgep25.2 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %428
  %429 = add i64 %428, 32
  %scevgep27.2 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %429
  %scevgep29.2 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %427
  %scevgep32.2 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_imag, i64 0, i64 32), i64 %427
  %scevgep34.2 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %428
  %scevgep36.2 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %429
  %430 = trunc i64 %indvars.iv162.i.2 to i32
  %431 = mul i32 64, %430
  %432 = add i32 32, %431
  %433 = add nsw i64 %indvars.iv162.i.2, 3
  %arrayidx.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %433
  %434 = load float, float* %arrayidx.us.i.2, align 4, !tbaa !2
  %arrayidx8.us.i.2 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %433
  %435 = load float, float* %arrayidx8.us.i.2, align 4, !tbaa !2
  %436 = shl nuw nsw i64 %indvars.iv162.i.2, 1
  %437 = mul nuw nsw i64 %436, 32
  %438 = trunc i64 %437 to i32
  %add13.us.i.2 = add i32 32, %438
  br i1 false, label %for.body11.us.i.preheader.2, label %vector.scevcheck.2

vector.scevcheck.2:                               ; preds = %for.body3.us.i.2
  %439 = add i32 %432, 31
  %440 = icmp slt i32 %439, %432
  br i1 %440, label %for.body11.us.i.preheader.2, label %vector.memcheck.2

vector.memcheck.2:                                ; preds = %vector.scevcheck.2
  %bound0.2 = icmp ult float* %scevgep.2, %scevgep27.2
  %bound1.2 = icmp ult float* %scevgep25.2, %scevgep23.2
  %found.conflict.2 = and i1 %bound0.2, %bound1.2
  %bound038.2 = icmp ult float* %scevgep29.2, %scevgep36.2
  %bound139.2 = icmp ult float* %scevgep34.2, %scevgep32.2
  %found.conflict40.2 = and i1 %bound038.2, %bound139.2
  %conflict.rdx.2 = or i1 %found.conflict.2, %found.conflict40.2
  br i1 %conflict.rdx.2, label %for.body11.us.i.preheader.2, label %vector.ph41.2

vector.ph41.2:                                    ; preds = %vector.memcheck.2
  %broadcast.splatinsert52.2 = insertelement <4 x float> undef, float %434, i32 0
  %broadcast.splat53.2 = shufflevector <4 x float> %broadcast.splatinsert52.2, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert55.2 = insertelement <4 x float> undef, float %435, i32 0
  %broadcast.splat56.2 = shufflevector <4 x float> %broadcast.splatinsert55.2, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block16.unr-lcssa.2, label %vector.ph41.new.2

vector.ph41.new.2:                                ; preds = %vector.ph41.2
  br label %vector.body18.2

vector.body18.2:                                  ; preds = %vector.body18.2, %vector.ph41.new.2
  %index42.2 = phi i64 [ 0, %vector.ph41.new.2 ], [ %index.next43.3.2, %vector.body18.2 ]
  %niter.2 = phi i64 [ 8, %vector.ph41.new.2 ], [ %niter.nsub.3.2, %vector.body18.2 ]
  %441 = trunc i64 %index42.2 to i32
  %442 = add i32 %add13.us.i.2, %441
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %443
  %445 = bitcast float* %444 to <4 x float>*
  %wide.load.228 = load <4 x float>, <4 x float>* %445, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %446 = fmul <4 x float> %broadcast.splat53.2, %wide.load.228
  %447 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %443
  %448 = bitcast float* %447 to <4 x float>*
  %wide.load54.229 = load <4 x float>, <4 x float>* %448, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %449 = fmul <4 x float> %broadcast.splat56.2, %wide.load54.229
  %450 = fsub <4 x float> %446, %449
  %451 = fmul <4 x float> %broadcast.splat56.2, %wide.load.228
  %452 = fmul <4 x float> %broadcast.splat53.2, %wide.load54.229
  %453 = fadd <4 x float> %451, %452
  %454 = add nuw nsw i64 %index42.2, %437
  %455 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %454
  %456 = bitcast float* %455 to <4 x float>*
  %wide.load57.230 = load <4 x float>, <4 x float>* %456, align 8, !tbaa !2, !alias.scope !12
  %457 = fsub <4 x float> %wide.load57.230, %450
  %458 = bitcast float* %444 to <4 x float>*
  store <4 x float> %457, <4 x float>* %458, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %459 = bitcast float* %455 to <4 x float>*
  %wide.load58.231 = load <4 x float>, <4 x float>* %459, align 8, !tbaa !2, !alias.scope !12
  %460 = fadd <4 x float> %450, %wide.load58.231
  %461 = bitcast float* %455 to <4 x float>*
  store <4 x float> %460, <4 x float>* %461, align 8, !tbaa !2, !alias.scope !12
  %462 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %454
  %463 = bitcast float* %462 to <4 x float>*
  %wide.load59.232 = load <4 x float>, <4 x float>* %463, align 8, !tbaa !2, !alias.scope !16
  %464 = fsub <4 x float> %wide.load59.232, %453
  %465 = bitcast float* %447 to <4 x float>*
  store <4 x float> %464, <4 x float>* %465, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %466 = bitcast float* %462 to <4 x float>*
  %wide.load60.233 = load <4 x float>, <4 x float>* %466, align 8, !tbaa !2, !alias.scope !16
  %467 = fadd <4 x float> %453, %wide.load60.233
  %468 = bitcast float* %462 to <4 x float>*
  store <4 x float> %467, <4 x float>* %468, align 8, !tbaa !2, !alias.scope !16
  %index.next43.234 = add nuw nsw i64 %index42.2, 4
  %niter.nsub.235 = sub i64 %niter.2, 1
  %469 = trunc i64 %index.next43.234 to i32
  %470 = add i32 %add13.us.i.2, %469
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %471
  %473 = bitcast float* %472 to <4 x float>*
  %wide.load.1.2 = load <4 x float>, <4 x float>* %473, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %474 = fmul <4 x float> %broadcast.splat53.2, %wide.load.1.2
  %475 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %471
  %476 = bitcast float* %475 to <4 x float>*
  %wide.load54.1.2 = load <4 x float>, <4 x float>* %476, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %477 = fmul <4 x float> %broadcast.splat56.2, %wide.load54.1.2
  %478 = fsub <4 x float> %474, %477
  %479 = fmul <4 x float> %broadcast.splat56.2, %wide.load.1.2
  %480 = fmul <4 x float> %broadcast.splat53.2, %wide.load54.1.2
  %481 = fadd <4 x float> %479, %480
  %482 = add nuw nsw i64 %index.next43.234, %437
  %483 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %482
  %484 = bitcast float* %483 to <4 x float>*
  %wide.load57.1.2 = load <4 x float>, <4 x float>* %484, align 8, !tbaa !2, !alias.scope !12
  %485 = fsub <4 x float> %wide.load57.1.2, %478
  %486 = bitcast float* %472 to <4 x float>*
  store <4 x float> %485, <4 x float>* %486, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %487 = bitcast float* %483 to <4 x float>*
  %wide.load58.1.2 = load <4 x float>, <4 x float>* %487, align 8, !tbaa !2, !alias.scope !12
  %488 = fadd <4 x float> %478, %wide.load58.1.2
  %489 = bitcast float* %483 to <4 x float>*
  store <4 x float> %488, <4 x float>* %489, align 8, !tbaa !2, !alias.scope !12
  %490 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %482
  %491 = bitcast float* %490 to <4 x float>*
  %wide.load59.1.2 = load <4 x float>, <4 x float>* %491, align 8, !tbaa !2, !alias.scope !16
  %492 = fsub <4 x float> %wide.load59.1.2, %481
  %493 = bitcast float* %475 to <4 x float>*
  store <4 x float> %492, <4 x float>* %493, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %494 = bitcast float* %490 to <4 x float>*
  %wide.load60.1.2 = load <4 x float>, <4 x float>* %494, align 8, !tbaa !2, !alias.scope !16
  %495 = fadd <4 x float> %481, %wide.load60.1.2
  %496 = bitcast float* %490 to <4 x float>*
  store <4 x float> %495, <4 x float>* %496, align 8, !tbaa !2, !alias.scope !16
  %index.next43.1.2 = add nuw nsw i64 %index.next43.234, 4
  %niter.nsub.1.2 = sub i64 %niter.nsub.235, 1
  %497 = trunc i64 %index.next43.1.2 to i32
  %498 = add i32 %add13.us.i.2, %497
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %499
  %501 = bitcast float* %500 to <4 x float>*
  %wide.load.2.2 = load <4 x float>, <4 x float>* %501, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %502 = fmul <4 x float> %broadcast.splat53.2, %wide.load.2.2
  %503 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %499
  %504 = bitcast float* %503 to <4 x float>*
  %wide.load54.2.2 = load <4 x float>, <4 x float>* %504, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %505 = fmul <4 x float> %broadcast.splat56.2, %wide.load54.2.2
  %506 = fsub <4 x float> %502, %505
  %507 = fmul <4 x float> %broadcast.splat56.2, %wide.load.2.2
  %508 = fmul <4 x float> %broadcast.splat53.2, %wide.load54.2.2
  %509 = fadd <4 x float> %507, %508
  %510 = add nuw nsw i64 %index.next43.1.2, %437
  %511 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %510
  %512 = bitcast float* %511 to <4 x float>*
  %wide.load57.2.2 = load <4 x float>, <4 x float>* %512, align 8, !tbaa !2, !alias.scope !12
  %513 = fsub <4 x float> %wide.load57.2.2, %506
  %514 = bitcast float* %500 to <4 x float>*
  store <4 x float> %513, <4 x float>* %514, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %515 = bitcast float* %511 to <4 x float>*
  %wide.load58.2.2 = load <4 x float>, <4 x float>* %515, align 8, !tbaa !2, !alias.scope !12
  %516 = fadd <4 x float> %506, %wide.load58.2.2
  %517 = bitcast float* %511 to <4 x float>*
  store <4 x float> %516, <4 x float>* %517, align 8, !tbaa !2, !alias.scope !12
  %518 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %510
  %519 = bitcast float* %518 to <4 x float>*
  %wide.load59.2.2 = load <4 x float>, <4 x float>* %519, align 8, !tbaa !2, !alias.scope !16
  %520 = fsub <4 x float> %wide.load59.2.2, %509
  %521 = bitcast float* %503 to <4 x float>*
  store <4 x float> %520, <4 x float>* %521, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %522 = bitcast float* %518 to <4 x float>*
  %wide.load60.2.2 = load <4 x float>, <4 x float>* %522, align 8, !tbaa !2, !alias.scope !16
  %523 = fadd <4 x float> %509, %wide.load60.2.2
  %524 = bitcast float* %518 to <4 x float>*
  store <4 x float> %523, <4 x float>* %524, align 8, !tbaa !2, !alias.scope !16
  %index.next43.2.2 = add nuw nsw i64 %index.next43.1.2, 4
  %niter.nsub.2.2 = sub i64 %niter.nsub.1.2, 1
  %525 = trunc i64 %index.next43.2.2 to i32
  %526 = add i32 %add13.us.i.2, %525
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %527
  %529 = bitcast float* %528 to <4 x float>*
  %wide.load.3.2 = load <4 x float>, <4 x float>* %529, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %530 = fmul <4 x float> %broadcast.splat53.2, %wide.load.3.2
  %531 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %527
  %532 = bitcast float* %531 to <4 x float>*
  %wide.load54.3.2 = load <4 x float>, <4 x float>* %532, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %533 = fmul <4 x float> %broadcast.splat56.2, %wide.load54.3.2
  %534 = fsub <4 x float> %530, %533
  %535 = fmul <4 x float> %broadcast.splat56.2, %wide.load.3.2
  %536 = fmul <4 x float> %broadcast.splat53.2, %wide.load54.3.2
  %537 = fadd <4 x float> %535, %536
  %538 = add nuw nsw i64 %index.next43.2.2, %437
  %539 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %538
  %540 = bitcast float* %539 to <4 x float>*
  %wide.load57.3.2 = load <4 x float>, <4 x float>* %540, align 8, !tbaa !2, !alias.scope !12
  %541 = fsub <4 x float> %wide.load57.3.2, %534
  %542 = bitcast float* %528 to <4 x float>*
  store <4 x float> %541, <4 x float>* %542, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %543 = bitcast float* %539 to <4 x float>*
  %wide.load58.3.2 = load <4 x float>, <4 x float>* %543, align 8, !tbaa !2, !alias.scope !12
  %544 = fadd <4 x float> %534, %wide.load58.3.2
  %545 = bitcast float* %539 to <4 x float>*
  store <4 x float> %544, <4 x float>* %545, align 8, !tbaa !2, !alias.scope !12
  %546 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %538
  %547 = bitcast float* %546 to <4 x float>*
  %wide.load59.3.2 = load <4 x float>, <4 x float>* %547, align 8, !tbaa !2, !alias.scope !16
  %548 = fsub <4 x float> %wide.load59.3.2, %537
  %549 = bitcast float* %531 to <4 x float>*
  store <4 x float> %548, <4 x float>* %549, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %550 = bitcast float* %546 to <4 x float>*
  %wide.load60.3.2 = load <4 x float>, <4 x float>* %550, align 8, !tbaa !2, !alias.scope !16
  %551 = fadd <4 x float> %537, %wide.load60.3.2
  %552 = bitcast float* %546 to <4 x float>*
  store <4 x float> %551, <4 x float>* %552, align 8, !tbaa !2, !alias.scope !16
  %index.next43.3.2 = add i64 %index.next43.2.2, 4
  %niter.nsub.3.2 = sub i64 %niter.nsub.2.2, 1
  %niter.ncmp.3.2 = icmp eq i64 %niter.nsub.3.2, 0
  br i1 %niter.ncmp.3.2, label %middle.block16.unr-lcssa.loopexit.2, label %vector.body18.2, !llvm.loop !18

middle.block16.unr-lcssa.loopexit.2:              ; preds = %vector.body18.2
  %index42.unr.ph.2 = phi i64 [ %index.next43.3.2, %vector.body18.2 ]
  br label %middle.block16.unr-lcssa.2

middle.block16.unr-lcssa.2:                       ; preds = %middle.block16.unr-lcssa.loopexit.2, %vector.ph41.2
  %index42.unr.2 = phi i64 [ 0, %vector.ph41.2 ], [ %index42.unr.ph.2, %middle.block16.unr-lcssa.loopexit.2 ]
  br i1 false, label %vector.body18.epil.preheader.2, label %middle.block16.2

vector.body18.epil.preheader.2:                   ; preds = %middle.block16.unr-lcssa.2
  br label %vector.body18.epil.2

vector.body18.epil.2:                             ; preds = %vector.body18.epil.2, %vector.body18.epil.preheader.2
  %index42.epil.2 = phi i64 [ %index42.unr.2, %vector.body18.epil.preheader.2 ], [ %index.next43.epil.2, %vector.body18.epil.2 ]
  %epil.iter.2 = phi i64 [ 0, %vector.body18.epil.preheader.2 ], [ %epil.iter.sub.2, %vector.body18.epil.2 ]
  %553 = trunc i64 %index42.epil.2 to i32
  %554 = add i32 %add13.us.i.2, %553
  %555 = sext i32 %554 to i64
  %556 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %555
  %557 = bitcast float* %556 to <4 x float>*
  %wide.load.epil.2 = load <4 x float>, <4 x float>* %557, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %558 = fmul <4 x float> %broadcast.splat53.2, %wide.load.epil.2
  %559 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %555
  %560 = bitcast float* %559 to <4 x float>*
  %wide.load54.epil.2 = load <4 x float>, <4 x float>* %560, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %561 = fmul <4 x float> %broadcast.splat56.2, %wide.load54.epil.2
  %562 = fsub <4 x float> %558, %561
  %563 = fmul <4 x float> %broadcast.splat56.2, %wide.load.epil.2
  %564 = fmul <4 x float> %broadcast.splat53.2, %wide.load54.epil.2
  %565 = fadd <4 x float> %563, %564
  %566 = add nuw nsw i64 %index42.epil.2, %437
  %567 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %566
  %568 = bitcast float* %567 to <4 x float>*
  %wide.load57.epil.2 = load <4 x float>, <4 x float>* %568, align 8, !tbaa !2, !alias.scope !12
  %569 = fsub <4 x float> %wide.load57.epil.2, %562
  %570 = bitcast float* %556 to <4 x float>*
  store <4 x float> %569, <4 x float>* %570, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %571 = bitcast float* %567 to <4 x float>*
  %wide.load58.epil.2 = load <4 x float>, <4 x float>* %571, align 8, !tbaa !2, !alias.scope !12
  %572 = fadd <4 x float> %562, %wide.load58.epil.2
  %573 = bitcast float* %567 to <4 x float>*
  store <4 x float> %572, <4 x float>* %573, align 8, !tbaa !2, !alias.scope !12
  %574 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %566
  %575 = bitcast float* %574 to <4 x float>*
  %wide.load59.epil.2 = load <4 x float>, <4 x float>* %575, align 8, !tbaa !2, !alias.scope !16
  %576 = fsub <4 x float> %wide.load59.epil.2, %565
  %577 = bitcast float* %559 to <4 x float>*
  store <4 x float> %576, <4 x float>* %577, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %578 = bitcast float* %574 to <4 x float>*
  %wide.load60.epil.2 = load <4 x float>, <4 x float>* %578, align 8, !tbaa !2, !alias.scope !16
  %579 = fadd <4 x float> %565, %wide.load60.epil.2
  %580 = bitcast float* %574 to <4 x float>*
  store <4 x float> %579, <4 x float>* %580, align 8, !tbaa !2, !alias.scope !16
  %index.next43.epil.2 = add i64 %index42.epil.2, 4
  %epil.iter.sub.2 = sub i64 %epil.iter.2, 1
  %epil.iter.cmp.2 = icmp ne i64 %epil.iter.sub.2, 0
  br i1 %epil.iter.cmp.2, label %vector.body18.epil.2, label %middle.block16.epilog-lcssa.2, !llvm.loop !22

middle.block16.epilog-lcssa.2:                    ; preds = %vector.body18.epil.2
  br label %middle.block16.2

middle.block16.2:                                 ; preds = %middle.block16.epilog-lcssa.2, %middle.block16.unr-lcssa.2
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.i.2, label %for.body11.us.i.preheader.2

for.body11.us.i.preheader.2:                      ; preds = %middle.block16.2, %vector.memcheck.2, %vector.scevcheck.2, %for.body3.us.i.2
  %indvars.iv.i.ph.2 = phi i64 [ 0, %vector.memcheck.2 ], [ 0, %vector.scevcheck.2 ], [ 0, %for.body3.us.i.2 ], [ 32, %middle.block16.2 ]
  %581 = sub i64 32, %indvars.iv.i.ph.2
  %582 = sub i64 31, %indvars.iv.i.ph.2
  br i1 false, label %for.body11.us.i.prol.preheader.2, label %for.body11.us.i.prol.loopexit.2

for.body11.us.i.prol.preheader.2:                 ; preds = %for.body11.us.i.preheader.2
  br label %for.body11.us.i.prol.2

for.body11.us.i.prol.2:                           ; preds = %for.body11.us.i.prol.2, %for.body11.us.i.prol.preheader.2
  %indvars.iv.i.prol.2 = phi i64 [ %indvars.iv.next.i.prol.2, %for.body11.us.i.prol.2 ], [ %indvars.iv.i.ph.2, %for.body11.us.i.prol.preheader.2 ]
  %prol.iter.2 = phi i64 [ 0, %for.body11.us.i.prol.preheader.2 ], [ %prol.iter.sub.2, %for.body11.us.i.prol.2 ]
  %583 = trunc i64 %indvars.iv.i.prol.2 to i32
  %add14.us.i.prol.2 = add i32 %add13.us.i.2, %583
  %idxprom15.us.i.prol.2 = sext i32 %add14.us.i.prol.2 to i64
  %arrayidx16.us.i.prol.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.prol.2
  %584 = load float, float* %arrayidx16.us.i.prol.2, align 4, !tbaa !2
  %mul17.us.i.prol.2 = fmul float %434, %584
  %arrayidx23.us.i.prol.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.prol.2
  %585 = load float, float* %arrayidx23.us.i.prol.2, align 4, !tbaa !2
  %mul24.us.i.prol.2 = fmul float %435, %585
  %sub25.us.i.prol.2 = fsub float %mul17.us.i.prol.2, %mul24.us.i.prol.2
  %mul32.us.i.prol.2 = fmul float %435, %584
  %mul39.us.i.prol.2 = fmul float %434, %585
  %add40.us.i.prol.2 = fadd float %mul32.us.i.prol.2, %mul39.us.i.prol.2
  %586 = add nuw nsw i64 %indvars.iv.i.prol.2, %437
  %arrayidx45.us.i.prol.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %586
  %587 = load float, float* %arrayidx45.us.i.prol.2, align 4, !tbaa !2
  %sub46.us.i.prol.2 = fsub float %587, %sub25.us.i.prol.2
  store float %sub46.us.i.prol.2, float* %arrayidx16.us.i.prol.2, align 4, !tbaa !2
  %588 = load float, float* %arrayidx45.us.i.prol.2, align 4, !tbaa !2
  %add58.us.i.prol.2 = fadd float %sub25.us.i.prol.2, %588
  store float %add58.us.i.prol.2, float* %arrayidx45.us.i.prol.2, align 4, !tbaa !2
  %arrayidx63.us.i.prol.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %586
  %589 = load float, float* %arrayidx63.us.i.prol.2, align 4, !tbaa !2
  %sub64.us.i.prol.2 = fsub float %589, %add40.us.i.prol.2
  store float %sub64.us.i.prol.2, float* %arrayidx23.us.i.prol.2, align 4, !tbaa !2
  %590 = load float, float* %arrayidx63.us.i.prol.2, align 4, !tbaa !2
  %add76.us.i.prol.2 = fadd float %add40.us.i.prol.2, %590
  store float %add76.us.i.prol.2, float* %arrayidx63.us.i.prol.2, align 4, !tbaa !2
  %indvars.iv.next.i.prol.2 = add nuw nsw i64 %indvars.iv.i.prol.2, 1
  %prol.iter.sub.2 = sub i64 %prol.iter.2, 1
  %prol.iter.cmp.2 = icmp ne i64 %prol.iter.sub.2, 0
  br i1 %prol.iter.cmp.2, label %for.body11.us.i.prol.2, label %for.body11.us.i.prol.loopexit.unr-lcssa.2, !llvm.loop !23

for.body11.us.i.prol.loopexit.unr-lcssa.2:        ; preds = %for.body11.us.i.prol.2
  %indvars.iv.i.unr.ph.2 = phi i64 [ %indvars.iv.next.i.prol.2, %for.body11.us.i.prol.2 ]
  br label %for.body11.us.i.prol.loopexit.2

for.body11.us.i.prol.loopexit.2:                  ; preds = %for.body11.us.i.prol.loopexit.unr-lcssa.2, %for.body11.us.i.preheader.2
  %indvars.iv.i.unr.2 = phi i64 [ %indvars.iv.i.ph.2, %for.body11.us.i.preheader.2 ], [ %indvars.iv.i.unr.ph.2, %for.body11.us.i.prol.loopexit.unr-lcssa.2 ]
  %591 = icmp ult i64 %582, 3
  br i1 %591, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.2, label %for.body11.us.i.preheader.new.2

for.body11.us.i.preheader.new.2:                  ; preds = %for.body11.us.i.prol.loopexit.2
  br label %for.body11.us.i.2

for.body11.us.i.2:                                ; preds = %for.body11.us.i.2, %for.body11.us.i.preheader.new.2
  %indvars.iv.i.2 = phi i64 [ %indvars.iv.i.unr.2, %for.body11.us.i.preheader.new.2 ], [ %indvars.iv.next.i.3.2, %for.body11.us.i.2 ]
  %592 = trunc i64 %indvars.iv.i.2 to i32
  %add14.us.i.236 = add i32 %add13.us.i.2, %592
  %idxprom15.us.i.237 = sext i32 %add14.us.i.236 to i64
  %arrayidx16.us.i.238 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.237
  %593 = load float, float* %arrayidx16.us.i.238, align 4, !tbaa !2
  %mul17.us.i.239 = fmul float %434, %593
  %arrayidx23.us.i.240 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.237
  %594 = load float, float* %arrayidx23.us.i.240, align 4, !tbaa !2
  %mul24.us.i.241 = fmul float %435, %594
  %sub25.us.i.242 = fsub float %mul17.us.i.239, %mul24.us.i.241
  %mul32.us.i.243 = fmul float %435, %593
  %mul39.us.i.244 = fmul float %434, %594
  %add40.us.i.245 = fadd float %mul32.us.i.243, %mul39.us.i.244
  %595 = add nuw nsw i64 %indvars.iv.i.2, %437
  %arrayidx45.us.i.246 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %595
  %596 = load float, float* %arrayidx45.us.i.246, align 4, !tbaa !2
  %sub46.us.i.247 = fsub float %596, %sub25.us.i.242
  store float %sub46.us.i.247, float* %arrayidx16.us.i.238, align 4, !tbaa !2
  %597 = load float, float* %arrayidx45.us.i.246, align 4, !tbaa !2
  %add58.us.i.248 = fadd float %sub25.us.i.242, %597
  store float %add58.us.i.248, float* %arrayidx45.us.i.246, align 4, !tbaa !2
  %arrayidx63.us.i.249 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %595
  %598 = load float, float* %arrayidx63.us.i.249, align 4, !tbaa !2
  %sub64.us.i.250 = fsub float %598, %add40.us.i.245
  store float %sub64.us.i.250, float* %arrayidx23.us.i.240, align 4, !tbaa !2
  %599 = load float, float* %arrayidx63.us.i.249, align 4, !tbaa !2
  %add76.us.i.251 = fadd float %add40.us.i.245, %599
  store float %add76.us.i.251, float* %arrayidx63.us.i.249, align 4, !tbaa !2
  %indvars.iv.next.i.252 = add nuw nsw i64 %indvars.iv.i.2, 1
  %600 = trunc i64 %indvars.iv.next.i.252 to i32
  %add14.us.i.1.2 = add i32 %add13.us.i.2, %600
  %idxprom15.us.i.1.2 = sext i32 %add14.us.i.1.2 to i64
  %arrayidx16.us.i.1.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.2
  %601 = load float, float* %arrayidx16.us.i.1.2, align 4, !tbaa !2
  %mul17.us.i.1.2 = fmul float %434, %601
  %arrayidx23.us.i.1.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.2
  %602 = load float, float* %arrayidx23.us.i.1.2, align 4, !tbaa !2
  %mul24.us.i.1.2 = fmul float %435, %602
  %sub25.us.i.1.2 = fsub float %mul17.us.i.1.2, %mul24.us.i.1.2
  %mul32.us.i.1.2 = fmul float %435, %601
  %mul39.us.i.1.2 = fmul float %434, %602
  %add40.us.i.1.2 = fadd float %mul32.us.i.1.2, %mul39.us.i.1.2
  %603 = add nuw nsw i64 %indvars.iv.next.i.252, %437
  %arrayidx45.us.i.1.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %603
  %604 = load float, float* %arrayidx45.us.i.1.2, align 4, !tbaa !2
  %sub46.us.i.1.2 = fsub float %604, %sub25.us.i.1.2
  store float %sub46.us.i.1.2, float* %arrayidx16.us.i.1.2, align 4, !tbaa !2
  %605 = load float, float* %arrayidx45.us.i.1.2, align 4, !tbaa !2
  %add58.us.i.1.2 = fadd float %sub25.us.i.1.2, %605
  store float %add58.us.i.1.2, float* %arrayidx45.us.i.1.2, align 4, !tbaa !2
  %arrayidx63.us.i.1.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %603
  %606 = load float, float* %arrayidx63.us.i.1.2, align 4, !tbaa !2
  %sub64.us.i.1.2 = fsub float %606, %add40.us.i.1.2
  store float %sub64.us.i.1.2, float* %arrayidx23.us.i.1.2, align 4, !tbaa !2
  %607 = load float, float* %arrayidx63.us.i.1.2, align 4, !tbaa !2
  %add76.us.i.1.2 = fadd float %add40.us.i.1.2, %607
  store float %add76.us.i.1.2, float* %arrayidx63.us.i.1.2, align 4, !tbaa !2
  %indvars.iv.next.i.1.2 = add nuw nsw i64 %indvars.iv.next.i.252, 1
  %608 = trunc i64 %indvars.iv.next.i.1.2 to i32
  %add14.us.i.2.2 = add i32 %add13.us.i.2, %608
  %idxprom15.us.i.2.2 = sext i32 %add14.us.i.2.2 to i64
  %arrayidx16.us.i.2.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.2
  %609 = load float, float* %arrayidx16.us.i.2.2, align 4, !tbaa !2
  %mul17.us.i.2.2 = fmul float %434, %609
  %arrayidx23.us.i.2.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.2
  %610 = load float, float* %arrayidx23.us.i.2.2, align 4, !tbaa !2
  %mul24.us.i.2.2 = fmul float %435, %610
  %sub25.us.i.2.2 = fsub float %mul17.us.i.2.2, %mul24.us.i.2.2
  %mul32.us.i.2.2 = fmul float %435, %609
  %mul39.us.i.2.2 = fmul float %434, %610
  %add40.us.i.2.2 = fadd float %mul32.us.i.2.2, %mul39.us.i.2.2
  %611 = add nuw nsw i64 %indvars.iv.next.i.1.2, %437
  %arrayidx45.us.i.2.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %611
  %612 = load float, float* %arrayidx45.us.i.2.2, align 4, !tbaa !2
  %sub46.us.i.2.2 = fsub float %612, %sub25.us.i.2.2
  store float %sub46.us.i.2.2, float* %arrayidx16.us.i.2.2, align 4, !tbaa !2
  %613 = load float, float* %arrayidx45.us.i.2.2, align 4, !tbaa !2
  %add58.us.i.2.2 = fadd float %sub25.us.i.2.2, %613
  store float %add58.us.i.2.2, float* %arrayidx45.us.i.2.2, align 4, !tbaa !2
  %arrayidx63.us.i.2.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %611
  %614 = load float, float* %arrayidx63.us.i.2.2, align 4, !tbaa !2
  %sub64.us.i.2.2 = fsub float %614, %add40.us.i.2.2
  store float %sub64.us.i.2.2, float* %arrayidx23.us.i.2.2, align 4, !tbaa !2
  %615 = load float, float* %arrayidx63.us.i.2.2, align 4, !tbaa !2
  %add76.us.i.2.2 = fadd float %add40.us.i.2.2, %615
  store float %add76.us.i.2.2, float* %arrayidx63.us.i.2.2, align 4, !tbaa !2
  %indvars.iv.next.i.2.2 = add nuw nsw i64 %indvars.iv.next.i.1.2, 1
  %616 = trunc i64 %indvars.iv.next.i.2.2 to i32
  %add14.us.i.3.2 = add i32 %add13.us.i.2, %616
  %idxprom15.us.i.3.2 = sext i32 %add14.us.i.3.2 to i64
  %arrayidx16.us.i.3.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.2
  %617 = load float, float* %arrayidx16.us.i.3.2, align 4, !tbaa !2
  %mul17.us.i.3.2 = fmul float %434, %617
  %arrayidx23.us.i.3.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.2
  %618 = load float, float* %arrayidx23.us.i.3.2, align 4, !tbaa !2
  %mul24.us.i.3.2 = fmul float %435, %618
  %sub25.us.i.3.2 = fsub float %mul17.us.i.3.2, %mul24.us.i.3.2
  %mul32.us.i.3.2 = fmul float %435, %617
  %mul39.us.i.3.2 = fmul float %434, %618
  %add40.us.i.3.2 = fadd float %mul32.us.i.3.2, %mul39.us.i.3.2
  %619 = add nuw nsw i64 %indvars.iv.next.i.2.2, %437
  %arrayidx45.us.i.3.2 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %619
  %620 = load float, float* %arrayidx45.us.i.3.2, align 4, !tbaa !2
  %sub46.us.i.3.2 = fsub float %620, %sub25.us.i.3.2
  store float %sub46.us.i.3.2, float* %arrayidx16.us.i.3.2, align 4, !tbaa !2
  %621 = load float, float* %arrayidx45.us.i.3.2, align 4, !tbaa !2
  %add58.us.i.3.2 = fadd float %sub25.us.i.3.2, %621
  store float %add58.us.i.3.2, float* %arrayidx45.us.i.3.2, align 4, !tbaa !2
  %arrayidx63.us.i.3.2 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %619
  %622 = load float, float* %arrayidx63.us.i.3.2, align 4, !tbaa !2
  %sub64.us.i.3.2 = fsub float %622, %add40.us.i.3.2
  store float %sub64.us.i.3.2, float* %arrayidx23.us.i.3.2, align 4, !tbaa !2
  %623 = load float, float* %arrayidx63.us.i.3.2, align 4, !tbaa !2
  %add76.us.i.3.2 = fadd float %add40.us.i.3.2, %623
  store float %add76.us.i.3.2, float* %arrayidx63.us.i.3.2, align 4, !tbaa !2
  %indvars.iv.next.i.3.2 = add nuw nsw i64 %indvars.iv.next.i.2.2, 1
  %exitcond.i.3.2 = icmp eq i64 %indvars.iv.next.i.3.2, 32
  br i1 %exitcond.i.3.2, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.2, label %for.body11.us.i.2, !llvm.loop !24

for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.2: ; preds = %for.body11.us.i.2
  br label %for.cond9.for.inc77_crit_edge.us.i.loopexit.2

for.cond9.for.inc77_crit_edge.us.i.loopexit.2:    ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.2, %for.body11.us.i.prol.loopexit.2
  br label %for.cond9.for.inc77_crit_edge.us.i.2

for.cond9.for.inc77_crit_edge.us.i.2:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.2, %middle.block16.2
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
  %624 = trunc i64 %indvars.iv162.i.3 to i32
  %625 = mul i32 32, %624
  %626 = add i32 16, %625
  %627 = sext i32 %626 to i64
  %scevgep.3 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %627
  %scevgep23.3 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_real, i64 0, i64 16), i64 %627
  %628 = mul i64 32, %indvars.iv162.i.3
  %scevgep25.3 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %628
  %629 = add i64 %628, 16
  %scevgep27.3 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %629
  %scevgep29.3 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %627
  %scevgep32.3 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_imag, i64 0, i64 16), i64 %627
  %scevgep34.3 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %628
  %scevgep36.3 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %629
  %630 = trunc i64 %indvars.iv162.i.3 to i32
  %631 = mul i32 32, %630
  %632 = add i32 16, %631
  %633 = add nsw i64 %indvars.iv162.i.3, 7
  %arrayidx.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %633
  %634 = load float, float* %arrayidx.us.i.3, align 4, !tbaa !2
  %arrayidx8.us.i.3 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %633
  %635 = load float, float* %arrayidx8.us.i.3, align 4, !tbaa !2
  %636 = shl nuw nsw i64 %indvars.iv162.i.3, 1
  %637 = mul nuw nsw i64 %636, 16
  %638 = trunc i64 %637 to i32
  %add13.us.i.3 = add i32 16, %638
  br i1 false, label %for.body11.us.i.preheader.3, label %vector.scevcheck.3

vector.scevcheck.3:                               ; preds = %for.body3.us.i.3
  %639 = add i32 %632, 15
  %640 = icmp slt i32 %639, %632
  br i1 %640, label %for.body11.us.i.preheader.3, label %vector.memcheck.3

vector.memcheck.3:                                ; preds = %vector.scevcheck.3
  %bound0.3 = icmp ult float* %scevgep.3, %scevgep27.3
  %bound1.3 = icmp ult float* %scevgep25.3, %scevgep23.3
  %found.conflict.3 = and i1 %bound0.3, %bound1.3
  %bound038.3 = icmp ult float* %scevgep29.3, %scevgep36.3
  %bound139.3 = icmp ult float* %scevgep34.3, %scevgep32.3
  %found.conflict40.3 = and i1 %bound038.3, %bound139.3
  %conflict.rdx.3 = or i1 %found.conflict.3, %found.conflict40.3
  br i1 %conflict.rdx.3, label %for.body11.us.i.preheader.3, label %vector.ph41.3

vector.ph41.3:                                    ; preds = %vector.memcheck.3
  %broadcast.splatinsert52.3 = insertelement <4 x float> undef, float %634, i32 0
  %broadcast.splat53.3 = shufflevector <4 x float> %broadcast.splatinsert52.3, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert55.3 = insertelement <4 x float> undef, float %635, i32 0
  %broadcast.splat56.3 = shufflevector <4 x float> %broadcast.splatinsert55.3, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block16.unr-lcssa.3, label %vector.ph41.new.3

vector.ph41.new.3:                                ; preds = %vector.ph41.3
  br label %vector.body18.3

vector.body18.3:                                  ; preds = %vector.body18.3, %vector.ph41.new.3
  %index42.3 = phi i64 [ 0, %vector.ph41.new.3 ], [ %index.next43.3.3, %vector.body18.3 ]
  %niter.3 = phi i64 [ 4, %vector.ph41.new.3 ], [ %niter.nsub.3.3, %vector.body18.3 ]
  %641 = trunc i64 %index42.3 to i32
  %642 = add i32 %add13.us.i.3, %641
  %643 = sext i32 %642 to i64
  %644 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %643
  %645 = bitcast float* %644 to <4 x float>*
  %wide.load.353 = load <4 x float>, <4 x float>* %645, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %646 = fmul <4 x float> %broadcast.splat53.3, %wide.load.353
  %647 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %643
  %648 = bitcast float* %647 to <4 x float>*
  %wide.load54.354 = load <4 x float>, <4 x float>* %648, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %649 = fmul <4 x float> %broadcast.splat56.3, %wide.load54.354
  %650 = fsub <4 x float> %646, %649
  %651 = fmul <4 x float> %broadcast.splat56.3, %wide.load.353
  %652 = fmul <4 x float> %broadcast.splat53.3, %wide.load54.354
  %653 = fadd <4 x float> %651, %652
  %654 = add nuw nsw i64 %index42.3, %637
  %655 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %654
  %656 = bitcast float* %655 to <4 x float>*
  %wide.load57.355 = load <4 x float>, <4 x float>* %656, align 8, !tbaa !2, !alias.scope !12
  %657 = fsub <4 x float> %wide.load57.355, %650
  %658 = bitcast float* %644 to <4 x float>*
  store <4 x float> %657, <4 x float>* %658, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %659 = bitcast float* %655 to <4 x float>*
  %wide.load58.356 = load <4 x float>, <4 x float>* %659, align 8, !tbaa !2, !alias.scope !12
  %660 = fadd <4 x float> %650, %wide.load58.356
  %661 = bitcast float* %655 to <4 x float>*
  store <4 x float> %660, <4 x float>* %661, align 8, !tbaa !2, !alias.scope !12
  %662 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %654
  %663 = bitcast float* %662 to <4 x float>*
  %wide.load59.357 = load <4 x float>, <4 x float>* %663, align 8, !tbaa !2, !alias.scope !16
  %664 = fsub <4 x float> %wide.load59.357, %653
  %665 = bitcast float* %647 to <4 x float>*
  store <4 x float> %664, <4 x float>* %665, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %666 = bitcast float* %662 to <4 x float>*
  %wide.load60.358 = load <4 x float>, <4 x float>* %666, align 8, !tbaa !2, !alias.scope !16
  %667 = fadd <4 x float> %653, %wide.load60.358
  %668 = bitcast float* %662 to <4 x float>*
  store <4 x float> %667, <4 x float>* %668, align 8, !tbaa !2, !alias.scope !16
  %index.next43.359 = add nuw nsw i64 %index42.3, 4
  %niter.nsub.360 = sub i64 %niter.3, 1
  %669 = trunc i64 %index.next43.359 to i32
  %670 = add i32 %add13.us.i.3, %669
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %671
  %673 = bitcast float* %672 to <4 x float>*
  %wide.load.1.3 = load <4 x float>, <4 x float>* %673, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %674 = fmul <4 x float> %broadcast.splat53.3, %wide.load.1.3
  %675 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %671
  %676 = bitcast float* %675 to <4 x float>*
  %wide.load54.1.3 = load <4 x float>, <4 x float>* %676, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %677 = fmul <4 x float> %broadcast.splat56.3, %wide.load54.1.3
  %678 = fsub <4 x float> %674, %677
  %679 = fmul <4 x float> %broadcast.splat56.3, %wide.load.1.3
  %680 = fmul <4 x float> %broadcast.splat53.3, %wide.load54.1.3
  %681 = fadd <4 x float> %679, %680
  %682 = add nuw nsw i64 %index.next43.359, %637
  %683 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %682
  %684 = bitcast float* %683 to <4 x float>*
  %wide.load57.1.3 = load <4 x float>, <4 x float>* %684, align 8, !tbaa !2, !alias.scope !12
  %685 = fsub <4 x float> %wide.load57.1.3, %678
  %686 = bitcast float* %672 to <4 x float>*
  store <4 x float> %685, <4 x float>* %686, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %687 = bitcast float* %683 to <4 x float>*
  %wide.load58.1.3 = load <4 x float>, <4 x float>* %687, align 8, !tbaa !2, !alias.scope !12
  %688 = fadd <4 x float> %678, %wide.load58.1.3
  %689 = bitcast float* %683 to <4 x float>*
  store <4 x float> %688, <4 x float>* %689, align 8, !tbaa !2, !alias.scope !12
  %690 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %682
  %691 = bitcast float* %690 to <4 x float>*
  %wide.load59.1.3 = load <4 x float>, <4 x float>* %691, align 8, !tbaa !2, !alias.scope !16
  %692 = fsub <4 x float> %wide.load59.1.3, %681
  %693 = bitcast float* %675 to <4 x float>*
  store <4 x float> %692, <4 x float>* %693, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %694 = bitcast float* %690 to <4 x float>*
  %wide.load60.1.3 = load <4 x float>, <4 x float>* %694, align 8, !tbaa !2, !alias.scope !16
  %695 = fadd <4 x float> %681, %wide.load60.1.3
  %696 = bitcast float* %690 to <4 x float>*
  store <4 x float> %695, <4 x float>* %696, align 8, !tbaa !2, !alias.scope !16
  %index.next43.1.3 = add nuw nsw i64 %index.next43.359, 4
  %niter.nsub.1.3 = sub i64 %niter.nsub.360, 1
  %697 = trunc i64 %index.next43.1.3 to i32
  %698 = add i32 %add13.us.i.3, %697
  %699 = sext i32 %698 to i64
  %700 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %699
  %701 = bitcast float* %700 to <4 x float>*
  %wide.load.2.3 = load <4 x float>, <4 x float>* %701, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %702 = fmul <4 x float> %broadcast.splat53.3, %wide.load.2.3
  %703 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %699
  %704 = bitcast float* %703 to <4 x float>*
  %wide.load54.2.3 = load <4 x float>, <4 x float>* %704, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %705 = fmul <4 x float> %broadcast.splat56.3, %wide.load54.2.3
  %706 = fsub <4 x float> %702, %705
  %707 = fmul <4 x float> %broadcast.splat56.3, %wide.load.2.3
  %708 = fmul <4 x float> %broadcast.splat53.3, %wide.load54.2.3
  %709 = fadd <4 x float> %707, %708
  %710 = add nuw nsw i64 %index.next43.1.3, %637
  %711 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %710
  %712 = bitcast float* %711 to <4 x float>*
  %wide.load57.2.3 = load <4 x float>, <4 x float>* %712, align 8, !tbaa !2, !alias.scope !12
  %713 = fsub <4 x float> %wide.load57.2.3, %706
  %714 = bitcast float* %700 to <4 x float>*
  store <4 x float> %713, <4 x float>* %714, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %715 = bitcast float* %711 to <4 x float>*
  %wide.load58.2.3 = load <4 x float>, <4 x float>* %715, align 8, !tbaa !2, !alias.scope !12
  %716 = fadd <4 x float> %706, %wide.load58.2.3
  %717 = bitcast float* %711 to <4 x float>*
  store <4 x float> %716, <4 x float>* %717, align 8, !tbaa !2, !alias.scope !12
  %718 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %710
  %719 = bitcast float* %718 to <4 x float>*
  %wide.load59.2.3 = load <4 x float>, <4 x float>* %719, align 8, !tbaa !2, !alias.scope !16
  %720 = fsub <4 x float> %wide.load59.2.3, %709
  %721 = bitcast float* %703 to <4 x float>*
  store <4 x float> %720, <4 x float>* %721, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %722 = bitcast float* %718 to <4 x float>*
  %wide.load60.2.3 = load <4 x float>, <4 x float>* %722, align 8, !tbaa !2, !alias.scope !16
  %723 = fadd <4 x float> %709, %wide.load60.2.3
  %724 = bitcast float* %718 to <4 x float>*
  store <4 x float> %723, <4 x float>* %724, align 8, !tbaa !2, !alias.scope !16
  %index.next43.2.3 = add nuw nsw i64 %index.next43.1.3, 4
  %niter.nsub.2.3 = sub i64 %niter.nsub.1.3, 1
  %725 = trunc i64 %index.next43.2.3 to i32
  %726 = add i32 %add13.us.i.3, %725
  %727 = sext i32 %726 to i64
  %728 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %727
  %729 = bitcast float* %728 to <4 x float>*
  %wide.load.3.3 = load <4 x float>, <4 x float>* %729, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %730 = fmul <4 x float> %broadcast.splat53.3, %wide.load.3.3
  %731 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %727
  %732 = bitcast float* %731 to <4 x float>*
  %wide.load54.3.3 = load <4 x float>, <4 x float>* %732, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %733 = fmul <4 x float> %broadcast.splat56.3, %wide.load54.3.3
  %734 = fsub <4 x float> %730, %733
  %735 = fmul <4 x float> %broadcast.splat56.3, %wide.load.3.3
  %736 = fmul <4 x float> %broadcast.splat53.3, %wide.load54.3.3
  %737 = fadd <4 x float> %735, %736
  %738 = add nuw nsw i64 %index.next43.2.3, %637
  %739 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %738
  %740 = bitcast float* %739 to <4 x float>*
  %wide.load57.3.3 = load <4 x float>, <4 x float>* %740, align 8, !tbaa !2, !alias.scope !12
  %741 = fsub <4 x float> %wide.load57.3.3, %734
  %742 = bitcast float* %728 to <4 x float>*
  store <4 x float> %741, <4 x float>* %742, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %743 = bitcast float* %739 to <4 x float>*
  %wide.load58.3.3 = load <4 x float>, <4 x float>* %743, align 8, !tbaa !2, !alias.scope !12
  %744 = fadd <4 x float> %734, %wide.load58.3.3
  %745 = bitcast float* %739 to <4 x float>*
  store <4 x float> %744, <4 x float>* %745, align 8, !tbaa !2, !alias.scope !12
  %746 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %738
  %747 = bitcast float* %746 to <4 x float>*
  %wide.load59.3.3 = load <4 x float>, <4 x float>* %747, align 8, !tbaa !2, !alias.scope !16
  %748 = fsub <4 x float> %wide.load59.3.3, %737
  %749 = bitcast float* %731 to <4 x float>*
  store <4 x float> %748, <4 x float>* %749, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %750 = bitcast float* %746 to <4 x float>*
  %wide.load60.3.3 = load <4 x float>, <4 x float>* %750, align 8, !tbaa !2, !alias.scope !16
  %751 = fadd <4 x float> %737, %wide.load60.3.3
  %752 = bitcast float* %746 to <4 x float>*
  store <4 x float> %751, <4 x float>* %752, align 8, !tbaa !2, !alias.scope !16
  %index.next43.3.3 = add i64 %index.next43.2.3, 4
  %niter.nsub.3.3 = sub i64 %niter.nsub.2.3, 1
  %niter.ncmp.3.3 = icmp eq i64 %niter.nsub.3.3, 0
  br i1 %niter.ncmp.3.3, label %middle.block16.unr-lcssa.loopexit.3, label %vector.body18.3, !llvm.loop !18

middle.block16.unr-lcssa.loopexit.3:              ; preds = %vector.body18.3
  %index42.unr.ph.3 = phi i64 [ %index.next43.3.3, %vector.body18.3 ]
  br label %middle.block16.unr-lcssa.3

middle.block16.unr-lcssa.3:                       ; preds = %middle.block16.unr-lcssa.loopexit.3, %vector.ph41.3
  %index42.unr.3 = phi i64 [ 0, %vector.ph41.3 ], [ %index42.unr.ph.3, %middle.block16.unr-lcssa.loopexit.3 ]
  br i1 false, label %vector.body18.epil.preheader.3, label %middle.block16.3

vector.body18.epil.preheader.3:                   ; preds = %middle.block16.unr-lcssa.3
  br label %vector.body18.epil.3

vector.body18.epil.3:                             ; preds = %vector.body18.epil.3, %vector.body18.epil.preheader.3
  %index42.epil.3 = phi i64 [ %index42.unr.3, %vector.body18.epil.preheader.3 ], [ %index.next43.epil.3, %vector.body18.epil.3 ]
  %epil.iter.3 = phi i64 [ 0, %vector.body18.epil.preheader.3 ], [ %epil.iter.sub.3, %vector.body18.epil.3 ]
  %753 = trunc i64 %index42.epil.3 to i32
  %754 = add i32 %add13.us.i.3, %753
  %755 = sext i32 %754 to i64
  %756 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %755
  %757 = bitcast float* %756 to <4 x float>*
  %wide.load.epil.3 = load <4 x float>, <4 x float>* %757, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %758 = fmul <4 x float> %broadcast.splat53.3, %wide.load.epil.3
  %759 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %755
  %760 = bitcast float* %759 to <4 x float>*
  %wide.load54.epil.3 = load <4 x float>, <4 x float>* %760, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %761 = fmul <4 x float> %broadcast.splat56.3, %wide.load54.epil.3
  %762 = fsub <4 x float> %758, %761
  %763 = fmul <4 x float> %broadcast.splat56.3, %wide.load.epil.3
  %764 = fmul <4 x float> %broadcast.splat53.3, %wide.load54.epil.3
  %765 = fadd <4 x float> %763, %764
  %766 = add nuw nsw i64 %index42.epil.3, %637
  %767 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %766
  %768 = bitcast float* %767 to <4 x float>*
  %wide.load57.epil.3 = load <4 x float>, <4 x float>* %768, align 8, !tbaa !2, !alias.scope !12
  %769 = fsub <4 x float> %wide.load57.epil.3, %762
  %770 = bitcast float* %756 to <4 x float>*
  store <4 x float> %769, <4 x float>* %770, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %771 = bitcast float* %767 to <4 x float>*
  %wide.load58.epil.3 = load <4 x float>, <4 x float>* %771, align 8, !tbaa !2, !alias.scope !12
  %772 = fadd <4 x float> %762, %wide.load58.epil.3
  %773 = bitcast float* %767 to <4 x float>*
  store <4 x float> %772, <4 x float>* %773, align 8, !tbaa !2, !alias.scope !12
  %774 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %766
  %775 = bitcast float* %774 to <4 x float>*
  %wide.load59.epil.3 = load <4 x float>, <4 x float>* %775, align 8, !tbaa !2, !alias.scope !16
  %776 = fsub <4 x float> %wide.load59.epil.3, %765
  %777 = bitcast float* %759 to <4 x float>*
  store <4 x float> %776, <4 x float>* %777, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %778 = bitcast float* %774 to <4 x float>*
  %wide.load60.epil.3 = load <4 x float>, <4 x float>* %778, align 8, !tbaa !2, !alias.scope !16
  %779 = fadd <4 x float> %765, %wide.load60.epil.3
  %780 = bitcast float* %774 to <4 x float>*
  store <4 x float> %779, <4 x float>* %780, align 8, !tbaa !2, !alias.scope !16
  %index.next43.epil.3 = add i64 %index42.epil.3, 4
  %epil.iter.sub.3 = sub i64 %epil.iter.3, 1
  %epil.iter.cmp.3 = icmp ne i64 %epil.iter.sub.3, 0
  br i1 %epil.iter.cmp.3, label %vector.body18.epil.3, label %middle.block16.epilog-lcssa.3, !llvm.loop !22

middle.block16.epilog-lcssa.3:                    ; preds = %vector.body18.epil.3
  br label %middle.block16.3

middle.block16.3:                                 ; preds = %middle.block16.epilog-lcssa.3, %middle.block16.unr-lcssa.3
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.i.3, label %for.body11.us.i.preheader.3

for.body11.us.i.preheader.3:                      ; preds = %middle.block16.3, %vector.memcheck.3, %vector.scevcheck.3, %for.body3.us.i.3
  %indvars.iv.i.ph.3 = phi i64 [ 0, %vector.memcheck.3 ], [ 0, %vector.scevcheck.3 ], [ 0, %for.body3.us.i.3 ], [ 16, %middle.block16.3 ]
  %781 = sub i64 16, %indvars.iv.i.ph.3
  %782 = sub i64 15, %indvars.iv.i.ph.3
  br i1 false, label %for.body11.us.i.prol.preheader.3, label %for.body11.us.i.prol.loopexit.3

for.body11.us.i.prol.preheader.3:                 ; preds = %for.body11.us.i.preheader.3
  br label %for.body11.us.i.prol.3

for.body11.us.i.prol.3:                           ; preds = %for.body11.us.i.prol.3, %for.body11.us.i.prol.preheader.3
  %indvars.iv.i.prol.3 = phi i64 [ %indvars.iv.next.i.prol.3, %for.body11.us.i.prol.3 ], [ %indvars.iv.i.ph.3, %for.body11.us.i.prol.preheader.3 ]
  %prol.iter.3 = phi i64 [ 0, %for.body11.us.i.prol.preheader.3 ], [ %prol.iter.sub.3, %for.body11.us.i.prol.3 ]
  %783 = trunc i64 %indvars.iv.i.prol.3 to i32
  %add14.us.i.prol.3 = add i32 %add13.us.i.3, %783
  %idxprom15.us.i.prol.3 = sext i32 %add14.us.i.prol.3 to i64
  %arrayidx16.us.i.prol.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.prol.3
  %784 = load float, float* %arrayidx16.us.i.prol.3, align 4, !tbaa !2
  %mul17.us.i.prol.3 = fmul float %634, %784
  %arrayidx23.us.i.prol.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.prol.3
  %785 = load float, float* %arrayidx23.us.i.prol.3, align 4, !tbaa !2
  %mul24.us.i.prol.3 = fmul float %635, %785
  %sub25.us.i.prol.3 = fsub float %mul17.us.i.prol.3, %mul24.us.i.prol.3
  %mul32.us.i.prol.3 = fmul float %635, %784
  %mul39.us.i.prol.3 = fmul float %634, %785
  %add40.us.i.prol.3 = fadd float %mul32.us.i.prol.3, %mul39.us.i.prol.3
  %786 = add nuw nsw i64 %indvars.iv.i.prol.3, %637
  %arrayidx45.us.i.prol.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %786
  %787 = load float, float* %arrayidx45.us.i.prol.3, align 4, !tbaa !2
  %sub46.us.i.prol.3 = fsub float %787, %sub25.us.i.prol.3
  store float %sub46.us.i.prol.3, float* %arrayidx16.us.i.prol.3, align 4, !tbaa !2
  %788 = load float, float* %arrayidx45.us.i.prol.3, align 4, !tbaa !2
  %add58.us.i.prol.3 = fadd float %sub25.us.i.prol.3, %788
  store float %add58.us.i.prol.3, float* %arrayidx45.us.i.prol.3, align 4, !tbaa !2
  %arrayidx63.us.i.prol.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %786
  %789 = load float, float* %arrayidx63.us.i.prol.3, align 4, !tbaa !2
  %sub64.us.i.prol.3 = fsub float %789, %add40.us.i.prol.3
  store float %sub64.us.i.prol.3, float* %arrayidx23.us.i.prol.3, align 4, !tbaa !2
  %790 = load float, float* %arrayidx63.us.i.prol.3, align 4, !tbaa !2
  %add76.us.i.prol.3 = fadd float %add40.us.i.prol.3, %790
  store float %add76.us.i.prol.3, float* %arrayidx63.us.i.prol.3, align 4, !tbaa !2
  %indvars.iv.next.i.prol.3 = add nuw nsw i64 %indvars.iv.i.prol.3, 1
  %prol.iter.sub.3 = sub i64 %prol.iter.3, 1
  %prol.iter.cmp.3 = icmp ne i64 %prol.iter.sub.3, 0
  br i1 %prol.iter.cmp.3, label %for.body11.us.i.prol.3, label %for.body11.us.i.prol.loopexit.unr-lcssa.3, !llvm.loop !23

for.body11.us.i.prol.loopexit.unr-lcssa.3:        ; preds = %for.body11.us.i.prol.3
  %indvars.iv.i.unr.ph.3 = phi i64 [ %indvars.iv.next.i.prol.3, %for.body11.us.i.prol.3 ]
  br label %for.body11.us.i.prol.loopexit.3

for.body11.us.i.prol.loopexit.3:                  ; preds = %for.body11.us.i.prol.loopexit.unr-lcssa.3, %for.body11.us.i.preheader.3
  %indvars.iv.i.unr.3 = phi i64 [ %indvars.iv.i.ph.3, %for.body11.us.i.preheader.3 ], [ %indvars.iv.i.unr.ph.3, %for.body11.us.i.prol.loopexit.unr-lcssa.3 ]
  %791 = icmp ult i64 %782, 3
  br i1 %791, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.3, label %for.body11.us.i.preheader.new.3

for.body11.us.i.preheader.new.3:                  ; preds = %for.body11.us.i.prol.loopexit.3
  br label %for.body11.us.i.3

for.body11.us.i.3:                                ; preds = %for.body11.us.i.3, %for.body11.us.i.preheader.new.3
  %indvars.iv.i.3 = phi i64 [ %indvars.iv.i.unr.3, %for.body11.us.i.preheader.new.3 ], [ %indvars.iv.next.i.3.3, %for.body11.us.i.3 ]
  %792 = trunc i64 %indvars.iv.i.3 to i32
  %add14.us.i.361 = add i32 %add13.us.i.3, %792
  %idxprom15.us.i.362 = sext i32 %add14.us.i.361 to i64
  %arrayidx16.us.i.363 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.362
  %793 = load float, float* %arrayidx16.us.i.363, align 4, !tbaa !2
  %mul17.us.i.364 = fmul float %634, %793
  %arrayidx23.us.i.365 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.362
  %794 = load float, float* %arrayidx23.us.i.365, align 4, !tbaa !2
  %mul24.us.i.366 = fmul float %635, %794
  %sub25.us.i.367 = fsub float %mul17.us.i.364, %mul24.us.i.366
  %mul32.us.i.368 = fmul float %635, %793
  %mul39.us.i.369 = fmul float %634, %794
  %add40.us.i.370 = fadd float %mul32.us.i.368, %mul39.us.i.369
  %795 = add nuw nsw i64 %indvars.iv.i.3, %637
  %arrayidx45.us.i.371 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %795
  %796 = load float, float* %arrayidx45.us.i.371, align 4, !tbaa !2
  %sub46.us.i.372 = fsub float %796, %sub25.us.i.367
  store float %sub46.us.i.372, float* %arrayidx16.us.i.363, align 4, !tbaa !2
  %797 = load float, float* %arrayidx45.us.i.371, align 4, !tbaa !2
  %add58.us.i.373 = fadd float %sub25.us.i.367, %797
  store float %add58.us.i.373, float* %arrayidx45.us.i.371, align 4, !tbaa !2
  %arrayidx63.us.i.374 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %795
  %798 = load float, float* %arrayidx63.us.i.374, align 4, !tbaa !2
  %sub64.us.i.375 = fsub float %798, %add40.us.i.370
  store float %sub64.us.i.375, float* %arrayidx23.us.i.365, align 4, !tbaa !2
  %799 = load float, float* %arrayidx63.us.i.374, align 4, !tbaa !2
  %add76.us.i.376 = fadd float %add40.us.i.370, %799
  store float %add76.us.i.376, float* %arrayidx63.us.i.374, align 4, !tbaa !2
  %indvars.iv.next.i.377 = add nuw nsw i64 %indvars.iv.i.3, 1
  %800 = trunc i64 %indvars.iv.next.i.377 to i32
  %add14.us.i.1.3 = add i32 %add13.us.i.3, %800
  %idxprom15.us.i.1.3 = sext i32 %add14.us.i.1.3 to i64
  %arrayidx16.us.i.1.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.3
  %801 = load float, float* %arrayidx16.us.i.1.3, align 4, !tbaa !2
  %mul17.us.i.1.3 = fmul float %634, %801
  %arrayidx23.us.i.1.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.3
  %802 = load float, float* %arrayidx23.us.i.1.3, align 4, !tbaa !2
  %mul24.us.i.1.3 = fmul float %635, %802
  %sub25.us.i.1.3 = fsub float %mul17.us.i.1.3, %mul24.us.i.1.3
  %mul32.us.i.1.3 = fmul float %635, %801
  %mul39.us.i.1.3 = fmul float %634, %802
  %add40.us.i.1.3 = fadd float %mul32.us.i.1.3, %mul39.us.i.1.3
  %803 = add nuw nsw i64 %indvars.iv.next.i.377, %637
  %arrayidx45.us.i.1.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %803
  %804 = load float, float* %arrayidx45.us.i.1.3, align 4, !tbaa !2
  %sub46.us.i.1.3 = fsub float %804, %sub25.us.i.1.3
  store float %sub46.us.i.1.3, float* %arrayidx16.us.i.1.3, align 4, !tbaa !2
  %805 = load float, float* %arrayidx45.us.i.1.3, align 4, !tbaa !2
  %add58.us.i.1.3 = fadd float %sub25.us.i.1.3, %805
  store float %add58.us.i.1.3, float* %arrayidx45.us.i.1.3, align 4, !tbaa !2
  %arrayidx63.us.i.1.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %803
  %806 = load float, float* %arrayidx63.us.i.1.3, align 4, !tbaa !2
  %sub64.us.i.1.3 = fsub float %806, %add40.us.i.1.3
  store float %sub64.us.i.1.3, float* %arrayidx23.us.i.1.3, align 4, !tbaa !2
  %807 = load float, float* %arrayidx63.us.i.1.3, align 4, !tbaa !2
  %add76.us.i.1.3 = fadd float %add40.us.i.1.3, %807
  store float %add76.us.i.1.3, float* %arrayidx63.us.i.1.3, align 4, !tbaa !2
  %indvars.iv.next.i.1.3 = add nuw nsw i64 %indvars.iv.next.i.377, 1
  %808 = trunc i64 %indvars.iv.next.i.1.3 to i32
  %add14.us.i.2.3 = add i32 %add13.us.i.3, %808
  %idxprom15.us.i.2.3 = sext i32 %add14.us.i.2.3 to i64
  %arrayidx16.us.i.2.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.3
  %809 = load float, float* %arrayidx16.us.i.2.3, align 4, !tbaa !2
  %mul17.us.i.2.3 = fmul float %634, %809
  %arrayidx23.us.i.2.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.3
  %810 = load float, float* %arrayidx23.us.i.2.3, align 4, !tbaa !2
  %mul24.us.i.2.3 = fmul float %635, %810
  %sub25.us.i.2.3 = fsub float %mul17.us.i.2.3, %mul24.us.i.2.3
  %mul32.us.i.2.3 = fmul float %635, %809
  %mul39.us.i.2.3 = fmul float %634, %810
  %add40.us.i.2.3 = fadd float %mul32.us.i.2.3, %mul39.us.i.2.3
  %811 = add nuw nsw i64 %indvars.iv.next.i.1.3, %637
  %arrayidx45.us.i.2.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %811
  %812 = load float, float* %arrayidx45.us.i.2.3, align 4, !tbaa !2
  %sub46.us.i.2.3 = fsub float %812, %sub25.us.i.2.3
  store float %sub46.us.i.2.3, float* %arrayidx16.us.i.2.3, align 4, !tbaa !2
  %813 = load float, float* %arrayidx45.us.i.2.3, align 4, !tbaa !2
  %add58.us.i.2.3 = fadd float %sub25.us.i.2.3, %813
  store float %add58.us.i.2.3, float* %arrayidx45.us.i.2.3, align 4, !tbaa !2
  %arrayidx63.us.i.2.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %811
  %814 = load float, float* %arrayidx63.us.i.2.3, align 4, !tbaa !2
  %sub64.us.i.2.3 = fsub float %814, %add40.us.i.2.3
  store float %sub64.us.i.2.3, float* %arrayidx23.us.i.2.3, align 4, !tbaa !2
  %815 = load float, float* %arrayidx63.us.i.2.3, align 4, !tbaa !2
  %add76.us.i.2.3 = fadd float %add40.us.i.2.3, %815
  store float %add76.us.i.2.3, float* %arrayidx63.us.i.2.3, align 4, !tbaa !2
  %indvars.iv.next.i.2.3 = add nuw nsw i64 %indvars.iv.next.i.1.3, 1
  %816 = trunc i64 %indvars.iv.next.i.2.3 to i32
  %add14.us.i.3.3 = add i32 %add13.us.i.3, %816
  %idxprom15.us.i.3.3 = sext i32 %add14.us.i.3.3 to i64
  %arrayidx16.us.i.3.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.3
  %817 = load float, float* %arrayidx16.us.i.3.3, align 4, !tbaa !2
  %mul17.us.i.3.3 = fmul float %634, %817
  %arrayidx23.us.i.3.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.3
  %818 = load float, float* %arrayidx23.us.i.3.3, align 4, !tbaa !2
  %mul24.us.i.3.3 = fmul float %635, %818
  %sub25.us.i.3.3 = fsub float %mul17.us.i.3.3, %mul24.us.i.3.3
  %mul32.us.i.3.3 = fmul float %635, %817
  %mul39.us.i.3.3 = fmul float %634, %818
  %add40.us.i.3.3 = fadd float %mul32.us.i.3.3, %mul39.us.i.3.3
  %819 = add nuw nsw i64 %indvars.iv.next.i.2.3, %637
  %arrayidx45.us.i.3.3 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %819
  %820 = load float, float* %arrayidx45.us.i.3.3, align 4, !tbaa !2
  %sub46.us.i.3.3 = fsub float %820, %sub25.us.i.3.3
  store float %sub46.us.i.3.3, float* %arrayidx16.us.i.3.3, align 4, !tbaa !2
  %821 = load float, float* %arrayidx45.us.i.3.3, align 4, !tbaa !2
  %add58.us.i.3.3 = fadd float %sub25.us.i.3.3, %821
  store float %add58.us.i.3.3, float* %arrayidx45.us.i.3.3, align 4, !tbaa !2
  %arrayidx63.us.i.3.3 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %819
  %822 = load float, float* %arrayidx63.us.i.3.3, align 4, !tbaa !2
  %sub64.us.i.3.3 = fsub float %822, %add40.us.i.3.3
  store float %sub64.us.i.3.3, float* %arrayidx23.us.i.3.3, align 4, !tbaa !2
  %823 = load float, float* %arrayidx63.us.i.3.3, align 4, !tbaa !2
  %add76.us.i.3.3 = fadd float %add40.us.i.3.3, %823
  store float %add76.us.i.3.3, float* %arrayidx63.us.i.3.3, align 4, !tbaa !2
  %indvars.iv.next.i.3.3 = add nuw nsw i64 %indvars.iv.next.i.2.3, 1
  %exitcond.i.3.3 = icmp eq i64 %indvars.iv.next.i.3.3, 16
  br i1 %exitcond.i.3.3, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.3, label %for.body11.us.i.3, !llvm.loop !24

for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.3: ; preds = %for.body11.us.i.3
  br label %for.cond9.for.inc77_crit_edge.us.i.loopexit.3

for.cond9.for.inc77_crit_edge.us.i.loopexit.3:    ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.3, %for.body11.us.i.prol.loopexit.3
  br label %for.cond9.for.inc77_crit_edge.us.i.3

for.cond9.for.inc77_crit_edge.us.i.3:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.3, %middle.block16.3
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
  %824 = trunc i64 %indvars.iv162.i.4 to i32
  %825 = mul i32 16, %824
  %826 = add i32 8, %825
  %827 = sext i32 %826 to i64
  %scevgep.4 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %827
  %scevgep23.4 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_real, i64 0, i64 8), i64 %827
  %828 = mul i64 16, %indvars.iv162.i.4
  %scevgep25.4 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %828
  %829 = add i64 %828, 8
  %scevgep27.4 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %829
  %scevgep29.4 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %827
  %scevgep32.4 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_imag, i64 0, i64 8), i64 %827
  %scevgep34.4 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %828
  %scevgep36.4 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %829
  %830 = trunc i64 %indvars.iv162.i.4 to i32
  %831 = mul i32 16, %830
  %832 = add i32 8, %831
  %833 = add nsw i64 %indvars.iv162.i.4, 15
  %arrayidx.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %833
  %834 = load float, float* %arrayidx.us.i.4, align 4, !tbaa !2
  %arrayidx8.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %833
  %835 = load float, float* %arrayidx8.us.i.4, align 4, !tbaa !2
  %836 = shl nuw nsw i64 %indvars.iv162.i.4, 1
  %837 = mul nuw nsw i64 %836, 8
  %838 = trunc i64 %837 to i32
  %add13.us.i.4 = add i32 8, %838
  br i1 false, label %for.body11.us.i.preheader.4, label %vector.scevcheck.4

vector.scevcheck.4:                               ; preds = %for.body3.us.i.4
  %839 = add i32 %832, 7
  %840 = icmp slt i32 %839, %832
  br i1 %840, label %for.body11.us.i.preheader.4, label %vector.memcheck.4

vector.memcheck.4:                                ; preds = %vector.scevcheck.4
  %bound0.4 = icmp ult float* %scevgep.4, %scevgep27.4
  %bound1.4 = icmp ult float* %scevgep25.4, %scevgep23.4
  %found.conflict.4 = and i1 %bound0.4, %bound1.4
  %bound038.4 = icmp ult float* %scevgep29.4, %scevgep36.4
  %bound139.4 = icmp ult float* %scevgep34.4, %scevgep32.4
  %found.conflict40.4 = and i1 %bound038.4, %bound139.4
  %conflict.rdx.4 = or i1 %found.conflict.4, %found.conflict40.4
  br i1 %conflict.rdx.4, label %for.body11.us.i.preheader.4, label %vector.ph41.4

vector.ph41.4:                                    ; preds = %vector.memcheck.4
  %broadcast.splatinsert52.4 = insertelement <4 x float> undef, float %834, i32 0
  %broadcast.splat53.4 = shufflevector <4 x float> %broadcast.splatinsert52.4, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert55.4 = insertelement <4 x float> undef, float %835, i32 0
  %broadcast.splat56.4 = shufflevector <4 x float> %broadcast.splatinsert55.4, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 true, label %middle.block16.unr-lcssa.4, label %vector.ph41.new.4

vector.ph41.new.4:                                ; preds = %vector.ph41.4
  br label %vector.body18.4

vector.body18.4:                                  ; preds = %vector.body18.4, %vector.ph41.new.4
  %index42.4 = phi i64 [ 0, %vector.ph41.new.4 ], [ %index.next43.3.4, %vector.body18.4 ]
  %niter.4 = phi i64 [ 0, %vector.ph41.new.4 ], [ %niter.nsub.3.4, %vector.body18.4 ]
  %841 = trunc i64 %index42.4 to i32
  %842 = add i32 %add13.us.i.4, %841
  %843 = sext i32 %842 to i64
  %844 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %843
  %845 = bitcast float* %844 to <4 x float>*
  %wide.load.4 = load <4 x float>, <4 x float>* %845, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %846 = fmul <4 x float> %broadcast.splat53.4, %wide.load.4
  %847 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %843
  %848 = bitcast float* %847 to <4 x float>*
  %wide.load54.4 = load <4 x float>, <4 x float>* %848, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %849 = fmul <4 x float> %broadcast.splat56.4, %wide.load54.4
  %850 = fsub <4 x float> %846, %849
  %851 = fmul <4 x float> %broadcast.splat56.4, %wide.load.4
  %852 = fmul <4 x float> %broadcast.splat53.4, %wide.load54.4
  %853 = fadd <4 x float> %851, %852
  %854 = add nuw nsw i64 %index42.4, %837
  %855 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %854
  %856 = bitcast float* %855 to <4 x float>*
  %wide.load57.4 = load <4 x float>, <4 x float>* %856, align 8, !tbaa !2, !alias.scope !12
  %857 = fsub <4 x float> %wide.load57.4, %850
  %858 = bitcast float* %844 to <4 x float>*
  store <4 x float> %857, <4 x float>* %858, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %859 = bitcast float* %855 to <4 x float>*
  %wide.load58.4 = load <4 x float>, <4 x float>* %859, align 8, !tbaa !2, !alias.scope !12
  %860 = fadd <4 x float> %850, %wide.load58.4
  %861 = bitcast float* %855 to <4 x float>*
  store <4 x float> %860, <4 x float>* %861, align 8, !tbaa !2, !alias.scope !12
  %862 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %854
  %863 = bitcast float* %862 to <4 x float>*
  %wide.load59.4 = load <4 x float>, <4 x float>* %863, align 8, !tbaa !2, !alias.scope !16
  %864 = fsub <4 x float> %wide.load59.4, %853
  %865 = bitcast float* %847 to <4 x float>*
  store <4 x float> %864, <4 x float>* %865, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %866 = bitcast float* %862 to <4 x float>*
  %wide.load60.4 = load <4 x float>, <4 x float>* %866, align 8, !tbaa !2, !alias.scope !16
  %867 = fadd <4 x float> %853, %wide.load60.4
  %868 = bitcast float* %862 to <4 x float>*
  store <4 x float> %867, <4 x float>* %868, align 8, !tbaa !2, !alias.scope !16
  %index.next43.4 = add nuw nsw i64 %index42.4, 4
  %niter.nsub.4 = sub i64 %niter.4, 1
  %869 = trunc i64 %index.next43.4 to i32
  %870 = add i32 %add13.us.i.4, %869
  %871 = sext i32 %870 to i64
  %872 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %871
  %873 = bitcast float* %872 to <4 x float>*
  %wide.load.1.4 = load <4 x float>, <4 x float>* %873, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %874 = fmul <4 x float> %broadcast.splat53.4, %wide.load.1.4
  %875 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %871
  %876 = bitcast float* %875 to <4 x float>*
  %wide.load54.1.4 = load <4 x float>, <4 x float>* %876, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %877 = fmul <4 x float> %broadcast.splat56.4, %wide.load54.1.4
  %878 = fsub <4 x float> %874, %877
  %879 = fmul <4 x float> %broadcast.splat56.4, %wide.load.1.4
  %880 = fmul <4 x float> %broadcast.splat53.4, %wide.load54.1.4
  %881 = fadd <4 x float> %879, %880
  %882 = add nuw nsw i64 %index.next43.4, %837
  %883 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %882
  %884 = bitcast float* %883 to <4 x float>*
  %wide.load57.1.4 = load <4 x float>, <4 x float>* %884, align 8, !tbaa !2, !alias.scope !12
  %885 = fsub <4 x float> %wide.load57.1.4, %878
  %886 = bitcast float* %872 to <4 x float>*
  store <4 x float> %885, <4 x float>* %886, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %887 = bitcast float* %883 to <4 x float>*
  %wide.load58.1.4 = load <4 x float>, <4 x float>* %887, align 8, !tbaa !2, !alias.scope !12
  %888 = fadd <4 x float> %878, %wide.load58.1.4
  %889 = bitcast float* %883 to <4 x float>*
  store <4 x float> %888, <4 x float>* %889, align 8, !tbaa !2, !alias.scope !12
  %890 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %882
  %891 = bitcast float* %890 to <4 x float>*
  %wide.load59.1.4 = load <4 x float>, <4 x float>* %891, align 8, !tbaa !2, !alias.scope !16
  %892 = fsub <4 x float> %wide.load59.1.4, %881
  %893 = bitcast float* %875 to <4 x float>*
  store <4 x float> %892, <4 x float>* %893, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %894 = bitcast float* %890 to <4 x float>*
  %wide.load60.1.4 = load <4 x float>, <4 x float>* %894, align 8, !tbaa !2, !alias.scope !16
  %895 = fadd <4 x float> %881, %wide.load60.1.4
  %896 = bitcast float* %890 to <4 x float>*
  store <4 x float> %895, <4 x float>* %896, align 8, !tbaa !2, !alias.scope !16
  %index.next43.1.4 = add nuw nsw i64 %index.next43.4, 4
  %niter.nsub.1.4 = sub i64 %niter.nsub.4, 1
  %897 = trunc i64 %index.next43.1.4 to i32
  %898 = add i32 %add13.us.i.4, %897
  %899 = sext i32 %898 to i64
  %900 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %899
  %901 = bitcast float* %900 to <4 x float>*
  %wide.load.2.4 = load <4 x float>, <4 x float>* %901, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %902 = fmul <4 x float> %broadcast.splat53.4, %wide.load.2.4
  %903 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %899
  %904 = bitcast float* %903 to <4 x float>*
  %wide.load54.2.4 = load <4 x float>, <4 x float>* %904, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %905 = fmul <4 x float> %broadcast.splat56.4, %wide.load54.2.4
  %906 = fsub <4 x float> %902, %905
  %907 = fmul <4 x float> %broadcast.splat56.4, %wide.load.2.4
  %908 = fmul <4 x float> %broadcast.splat53.4, %wide.load54.2.4
  %909 = fadd <4 x float> %907, %908
  %910 = add nuw nsw i64 %index.next43.1.4, %837
  %911 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %910
  %912 = bitcast float* %911 to <4 x float>*
  %wide.load57.2.4 = load <4 x float>, <4 x float>* %912, align 8, !tbaa !2, !alias.scope !12
  %913 = fsub <4 x float> %wide.load57.2.4, %906
  %914 = bitcast float* %900 to <4 x float>*
  store <4 x float> %913, <4 x float>* %914, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %915 = bitcast float* %911 to <4 x float>*
  %wide.load58.2.4 = load <4 x float>, <4 x float>* %915, align 8, !tbaa !2, !alias.scope !12
  %916 = fadd <4 x float> %906, %wide.load58.2.4
  %917 = bitcast float* %911 to <4 x float>*
  store <4 x float> %916, <4 x float>* %917, align 8, !tbaa !2, !alias.scope !12
  %918 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %910
  %919 = bitcast float* %918 to <4 x float>*
  %wide.load59.2.4 = load <4 x float>, <4 x float>* %919, align 8, !tbaa !2, !alias.scope !16
  %920 = fsub <4 x float> %wide.load59.2.4, %909
  %921 = bitcast float* %903 to <4 x float>*
  store <4 x float> %920, <4 x float>* %921, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %922 = bitcast float* %918 to <4 x float>*
  %wide.load60.2.4 = load <4 x float>, <4 x float>* %922, align 8, !tbaa !2, !alias.scope !16
  %923 = fadd <4 x float> %909, %wide.load60.2.4
  %924 = bitcast float* %918 to <4 x float>*
  store <4 x float> %923, <4 x float>* %924, align 8, !tbaa !2, !alias.scope !16
  %index.next43.2.4 = add nuw nsw i64 %index.next43.1.4, 4
  %niter.nsub.2.4 = sub i64 %niter.nsub.1.4, 1
  %925 = trunc i64 %index.next43.2.4 to i32
  %926 = add i32 %add13.us.i.4, %925
  %927 = sext i32 %926 to i64
  %928 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %927
  %929 = bitcast float* %928 to <4 x float>*
  %wide.load.3.4 = load <4 x float>, <4 x float>* %929, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %930 = fmul <4 x float> %broadcast.splat53.4, %wide.load.3.4
  %931 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %927
  %932 = bitcast float* %931 to <4 x float>*
  %wide.load54.3.4 = load <4 x float>, <4 x float>* %932, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %933 = fmul <4 x float> %broadcast.splat56.4, %wide.load54.3.4
  %934 = fsub <4 x float> %930, %933
  %935 = fmul <4 x float> %broadcast.splat56.4, %wide.load.3.4
  %936 = fmul <4 x float> %broadcast.splat53.4, %wide.load54.3.4
  %937 = fadd <4 x float> %935, %936
  %938 = add nuw nsw i64 %index.next43.2.4, %837
  %939 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %938
  %940 = bitcast float* %939 to <4 x float>*
  %wide.load57.3.4 = load <4 x float>, <4 x float>* %940, align 8, !tbaa !2, !alias.scope !12
  %941 = fsub <4 x float> %wide.load57.3.4, %934
  %942 = bitcast float* %928 to <4 x float>*
  store <4 x float> %941, <4 x float>* %942, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %943 = bitcast float* %939 to <4 x float>*
  %wide.load58.3.4 = load <4 x float>, <4 x float>* %943, align 8, !tbaa !2, !alias.scope !12
  %944 = fadd <4 x float> %934, %wide.load58.3.4
  %945 = bitcast float* %939 to <4 x float>*
  store <4 x float> %944, <4 x float>* %945, align 8, !tbaa !2, !alias.scope !12
  %946 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %938
  %947 = bitcast float* %946 to <4 x float>*
  %wide.load59.3.4 = load <4 x float>, <4 x float>* %947, align 8, !tbaa !2, !alias.scope !16
  %948 = fsub <4 x float> %wide.load59.3.4, %937
  %949 = bitcast float* %931 to <4 x float>*
  store <4 x float> %948, <4 x float>* %949, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %950 = bitcast float* %946 to <4 x float>*
  %wide.load60.3.4 = load <4 x float>, <4 x float>* %950, align 8, !tbaa !2, !alias.scope !16
  %951 = fadd <4 x float> %937, %wide.load60.3.4
  %952 = bitcast float* %946 to <4 x float>*
  store <4 x float> %951, <4 x float>* %952, align 8, !tbaa !2, !alias.scope !16
  %index.next43.3.4 = add i64 %index.next43.2.4, 4
  %niter.nsub.3.4 = sub i64 %niter.nsub.2.4, 1
  %niter.ncmp.3.4 = icmp eq i64 %niter.nsub.3.4, 0
  br i1 %niter.ncmp.3.4, label %middle.block16.unr-lcssa.loopexit.4, label %vector.body18.4, !llvm.loop !18

middle.block16.unr-lcssa.loopexit.4:              ; preds = %vector.body18.4
  %index42.unr.ph.4 = phi i64 [ %index.next43.3.4, %vector.body18.4 ]
  br label %middle.block16.unr-lcssa.4

middle.block16.unr-lcssa.4:                       ; preds = %middle.block16.unr-lcssa.loopexit.4, %vector.ph41.4
  %index42.unr.4 = phi i64 [ 0, %vector.ph41.4 ], [ %index42.unr.ph.4, %middle.block16.unr-lcssa.loopexit.4 ]
  br i1 true, label %vector.body18.epil.preheader.4, label %middle.block16.4

vector.body18.epil.preheader.4:                   ; preds = %middle.block16.unr-lcssa.4
  br label %vector.body18.epil.4

vector.body18.epil.4:                             ; preds = %vector.body18.epil.4, %vector.body18.epil.preheader.4
  %index42.epil.4 = phi i64 [ %index42.unr.4, %vector.body18.epil.preheader.4 ], [ %index.next43.epil.4, %vector.body18.epil.4 ]
  %epil.iter.4 = phi i64 [ 2, %vector.body18.epil.preheader.4 ], [ %epil.iter.sub.4, %vector.body18.epil.4 ]
  %953 = trunc i64 %index42.epil.4 to i32
  %954 = add i32 %add13.us.i.4, %953
  %955 = sext i32 %954 to i64
  %956 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %955
  %957 = bitcast float* %956 to <4 x float>*
  %wide.load.epil.4 = load <4 x float>, <4 x float>* %957, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %958 = fmul <4 x float> %broadcast.splat53.4, %wide.load.epil.4
  %959 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %955
  %960 = bitcast float* %959 to <4 x float>*
  %wide.load54.epil.4 = load <4 x float>, <4 x float>* %960, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %961 = fmul <4 x float> %broadcast.splat56.4, %wide.load54.epil.4
  %962 = fsub <4 x float> %958, %961
  %963 = fmul <4 x float> %broadcast.splat56.4, %wide.load.epil.4
  %964 = fmul <4 x float> %broadcast.splat53.4, %wide.load54.epil.4
  %965 = fadd <4 x float> %963, %964
  %966 = add nuw nsw i64 %index42.epil.4, %837
  %967 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %966
  %968 = bitcast float* %967 to <4 x float>*
  %wide.load57.epil.4 = load <4 x float>, <4 x float>* %968, align 8, !tbaa !2, !alias.scope !12
  %969 = fsub <4 x float> %wide.load57.epil.4, %962
  %970 = bitcast float* %956 to <4 x float>*
  store <4 x float> %969, <4 x float>* %970, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %971 = bitcast float* %967 to <4 x float>*
  %wide.load58.epil.4 = load <4 x float>, <4 x float>* %971, align 8, !tbaa !2, !alias.scope !12
  %972 = fadd <4 x float> %962, %wide.load58.epil.4
  %973 = bitcast float* %967 to <4 x float>*
  store <4 x float> %972, <4 x float>* %973, align 8, !tbaa !2, !alias.scope !12
  %974 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %966
  %975 = bitcast float* %974 to <4 x float>*
  %wide.load59.epil.4 = load <4 x float>, <4 x float>* %975, align 8, !tbaa !2, !alias.scope !16
  %976 = fsub <4 x float> %wide.load59.epil.4, %965
  %977 = bitcast float* %959 to <4 x float>*
  store <4 x float> %976, <4 x float>* %977, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %978 = bitcast float* %974 to <4 x float>*
  %wide.load60.epil.4 = load <4 x float>, <4 x float>* %978, align 8, !tbaa !2, !alias.scope !16
  %979 = fadd <4 x float> %965, %wide.load60.epil.4
  %980 = bitcast float* %974 to <4 x float>*
  store <4 x float> %979, <4 x float>* %980, align 8, !tbaa !2, !alias.scope !16
  %index.next43.epil.4 = add i64 %index42.epil.4, 4
  %epil.iter.sub.4 = sub i64 %epil.iter.4, 1
  %epil.iter.cmp.4 = icmp ne i64 %epil.iter.sub.4, 0
  br i1 %epil.iter.cmp.4, label %vector.body18.epil.4, label %middle.block16.epilog-lcssa.4, !llvm.loop !22

middle.block16.epilog-lcssa.4:                    ; preds = %vector.body18.epil.4
  br label %middle.block16.4

middle.block16.4:                                 ; preds = %middle.block16.epilog-lcssa.4, %middle.block16.unr-lcssa.4
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.i.4, label %for.body11.us.i.preheader.4

for.body11.us.i.preheader.4:                      ; preds = %middle.block16.4, %vector.memcheck.4, %vector.scevcheck.4, %for.body3.us.i.4
  %indvars.iv.i.ph.4 = phi i64 [ 0, %vector.memcheck.4 ], [ 0, %vector.scevcheck.4 ], [ 0, %for.body3.us.i.4 ], [ 8, %middle.block16.4 ]
  %981 = sub i64 8, %indvars.iv.i.ph.4
  %982 = sub i64 7, %indvars.iv.i.ph.4
  br i1 false, label %for.body11.us.i.prol.preheader.4, label %for.body11.us.i.prol.loopexit.4

for.body11.us.i.prol.preheader.4:                 ; preds = %for.body11.us.i.preheader.4
  br label %for.body11.us.i.prol.4

for.body11.us.i.prol.4:                           ; preds = %for.body11.us.i.prol.4, %for.body11.us.i.prol.preheader.4
  %indvars.iv.i.prol.4 = phi i64 [ %indvars.iv.next.i.prol.4, %for.body11.us.i.prol.4 ], [ %indvars.iv.i.ph.4, %for.body11.us.i.prol.preheader.4 ]
  %prol.iter.4 = phi i64 [ 0, %for.body11.us.i.prol.preheader.4 ], [ %prol.iter.sub.4, %for.body11.us.i.prol.4 ]
  %983 = trunc i64 %indvars.iv.i.prol.4 to i32
  %add14.us.i.prol.4 = add i32 %add13.us.i.4, %983
  %idxprom15.us.i.prol.4 = sext i32 %add14.us.i.prol.4 to i64
  %arrayidx16.us.i.prol.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.prol.4
  %984 = load float, float* %arrayidx16.us.i.prol.4, align 4, !tbaa !2
  %mul17.us.i.prol.4 = fmul float %834, %984
  %arrayidx23.us.i.prol.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.prol.4
  %985 = load float, float* %arrayidx23.us.i.prol.4, align 4, !tbaa !2
  %mul24.us.i.prol.4 = fmul float %835, %985
  %sub25.us.i.prol.4 = fsub float %mul17.us.i.prol.4, %mul24.us.i.prol.4
  %mul32.us.i.prol.4 = fmul float %835, %984
  %mul39.us.i.prol.4 = fmul float %834, %985
  %add40.us.i.prol.4 = fadd float %mul32.us.i.prol.4, %mul39.us.i.prol.4
  %986 = add nuw nsw i64 %indvars.iv.i.prol.4, %837
  %arrayidx45.us.i.prol.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %986
  %987 = load float, float* %arrayidx45.us.i.prol.4, align 4, !tbaa !2
  %sub46.us.i.prol.4 = fsub float %987, %sub25.us.i.prol.4
  store float %sub46.us.i.prol.4, float* %arrayidx16.us.i.prol.4, align 4, !tbaa !2
  %988 = load float, float* %arrayidx45.us.i.prol.4, align 4, !tbaa !2
  %add58.us.i.prol.4 = fadd float %sub25.us.i.prol.4, %988
  store float %add58.us.i.prol.4, float* %arrayidx45.us.i.prol.4, align 4, !tbaa !2
  %arrayidx63.us.i.prol.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %986
  %989 = load float, float* %arrayidx63.us.i.prol.4, align 4, !tbaa !2
  %sub64.us.i.prol.4 = fsub float %989, %add40.us.i.prol.4
  store float %sub64.us.i.prol.4, float* %arrayidx23.us.i.prol.4, align 4, !tbaa !2
  %990 = load float, float* %arrayidx63.us.i.prol.4, align 4, !tbaa !2
  %add76.us.i.prol.4 = fadd float %add40.us.i.prol.4, %990
  store float %add76.us.i.prol.4, float* %arrayidx63.us.i.prol.4, align 4, !tbaa !2
  %indvars.iv.next.i.prol.4 = add nuw nsw i64 %indvars.iv.i.prol.4, 1
  %prol.iter.sub.4 = sub i64 %prol.iter.4, 1
  %prol.iter.cmp.4 = icmp ne i64 %prol.iter.sub.4, 0
  br i1 %prol.iter.cmp.4, label %for.body11.us.i.prol.4, label %for.body11.us.i.prol.loopexit.unr-lcssa.4, !llvm.loop !23

for.body11.us.i.prol.loopexit.unr-lcssa.4:        ; preds = %for.body11.us.i.prol.4
  %indvars.iv.i.unr.ph.4 = phi i64 [ %indvars.iv.next.i.prol.4, %for.body11.us.i.prol.4 ]
  br label %for.body11.us.i.prol.loopexit.4

for.body11.us.i.prol.loopexit.4:                  ; preds = %for.body11.us.i.prol.loopexit.unr-lcssa.4, %for.body11.us.i.preheader.4
  %indvars.iv.i.unr.4 = phi i64 [ %indvars.iv.i.ph.4, %for.body11.us.i.preheader.4 ], [ %indvars.iv.i.unr.ph.4, %for.body11.us.i.prol.loopexit.unr-lcssa.4 ]
  %991 = icmp ult i64 %982, 3
  br i1 %991, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.4, label %for.body11.us.i.preheader.new.4

for.body11.us.i.preheader.new.4:                  ; preds = %for.body11.us.i.prol.loopexit.4
  br label %for.body11.us.i.4

for.body11.us.i.4:                                ; preds = %for.body11.us.i.4, %for.body11.us.i.preheader.new.4
  %indvars.iv.i.4 = phi i64 [ %indvars.iv.i.unr.4, %for.body11.us.i.preheader.new.4 ], [ %indvars.iv.next.i.3.4, %for.body11.us.i.4 ]
  %992 = trunc i64 %indvars.iv.i.4 to i32
  %add14.us.i.4 = add i32 %add13.us.i.4, %992
  %idxprom15.us.i.4 = sext i32 %add14.us.i.4 to i64
  %arrayidx16.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.4
  %993 = load float, float* %arrayidx16.us.i.4, align 4, !tbaa !2
  %mul17.us.i.4 = fmul float %834, %993
  %arrayidx23.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.4
  %994 = load float, float* %arrayidx23.us.i.4, align 4, !tbaa !2
  %mul24.us.i.4 = fmul float %835, %994
  %sub25.us.i.4 = fsub float %mul17.us.i.4, %mul24.us.i.4
  %mul32.us.i.4 = fmul float %835, %993
  %mul39.us.i.4 = fmul float %834, %994
  %add40.us.i.4 = fadd float %mul32.us.i.4, %mul39.us.i.4
  %995 = add nuw nsw i64 %indvars.iv.i.4, %837
  %arrayidx45.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %995
  %996 = load float, float* %arrayidx45.us.i.4, align 4, !tbaa !2
  %sub46.us.i.4 = fsub float %996, %sub25.us.i.4
  store float %sub46.us.i.4, float* %arrayidx16.us.i.4, align 4, !tbaa !2
  %997 = load float, float* %arrayidx45.us.i.4, align 4, !tbaa !2
  %add58.us.i.4 = fadd float %sub25.us.i.4, %997
  store float %add58.us.i.4, float* %arrayidx45.us.i.4, align 4, !tbaa !2
  %arrayidx63.us.i.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %995
  %998 = load float, float* %arrayidx63.us.i.4, align 4, !tbaa !2
  %sub64.us.i.4 = fsub float %998, %add40.us.i.4
  store float %sub64.us.i.4, float* %arrayidx23.us.i.4, align 4, !tbaa !2
  %999 = load float, float* %arrayidx63.us.i.4, align 4, !tbaa !2
  %add76.us.i.4 = fadd float %add40.us.i.4, %999
  store float %add76.us.i.4, float* %arrayidx63.us.i.4, align 4, !tbaa !2
  %indvars.iv.next.i.4 = add nuw nsw i64 %indvars.iv.i.4, 1
  %1000 = trunc i64 %indvars.iv.next.i.4 to i32
  %add14.us.i.1.4 = add i32 %add13.us.i.4, %1000
  %idxprom15.us.i.1.4 = sext i32 %add14.us.i.1.4 to i64
  %arrayidx16.us.i.1.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.4
  %1001 = load float, float* %arrayidx16.us.i.1.4, align 4, !tbaa !2
  %mul17.us.i.1.4 = fmul float %834, %1001
  %arrayidx23.us.i.1.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.4
  %1002 = load float, float* %arrayidx23.us.i.1.4, align 4, !tbaa !2
  %mul24.us.i.1.4 = fmul float %835, %1002
  %sub25.us.i.1.4 = fsub float %mul17.us.i.1.4, %mul24.us.i.1.4
  %mul32.us.i.1.4 = fmul float %835, %1001
  %mul39.us.i.1.4 = fmul float %834, %1002
  %add40.us.i.1.4 = fadd float %mul32.us.i.1.4, %mul39.us.i.1.4
  %1003 = add nuw nsw i64 %indvars.iv.next.i.4, %837
  %arrayidx45.us.i.1.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1003
  %1004 = load float, float* %arrayidx45.us.i.1.4, align 4, !tbaa !2
  %sub46.us.i.1.4 = fsub float %1004, %sub25.us.i.1.4
  store float %sub46.us.i.1.4, float* %arrayidx16.us.i.1.4, align 4, !tbaa !2
  %1005 = load float, float* %arrayidx45.us.i.1.4, align 4, !tbaa !2
  %add58.us.i.1.4 = fadd float %sub25.us.i.1.4, %1005
  store float %add58.us.i.1.4, float* %arrayidx45.us.i.1.4, align 4, !tbaa !2
  %arrayidx63.us.i.1.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1003
  %1006 = load float, float* %arrayidx63.us.i.1.4, align 4, !tbaa !2
  %sub64.us.i.1.4 = fsub float %1006, %add40.us.i.1.4
  store float %sub64.us.i.1.4, float* %arrayidx23.us.i.1.4, align 4, !tbaa !2
  %1007 = load float, float* %arrayidx63.us.i.1.4, align 4, !tbaa !2
  %add76.us.i.1.4 = fadd float %add40.us.i.1.4, %1007
  store float %add76.us.i.1.4, float* %arrayidx63.us.i.1.4, align 4, !tbaa !2
  %indvars.iv.next.i.1.4 = add nuw nsw i64 %indvars.iv.next.i.4, 1
  %1008 = trunc i64 %indvars.iv.next.i.1.4 to i32
  %add14.us.i.2.4 = add i32 %add13.us.i.4, %1008
  %idxprom15.us.i.2.4 = sext i32 %add14.us.i.2.4 to i64
  %arrayidx16.us.i.2.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.4
  %1009 = load float, float* %arrayidx16.us.i.2.4, align 4, !tbaa !2
  %mul17.us.i.2.4 = fmul float %834, %1009
  %arrayidx23.us.i.2.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.4
  %1010 = load float, float* %arrayidx23.us.i.2.4, align 4, !tbaa !2
  %mul24.us.i.2.4 = fmul float %835, %1010
  %sub25.us.i.2.4 = fsub float %mul17.us.i.2.4, %mul24.us.i.2.4
  %mul32.us.i.2.4 = fmul float %835, %1009
  %mul39.us.i.2.4 = fmul float %834, %1010
  %add40.us.i.2.4 = fadd float %mul32.us.i.2.4, %mul39.us.i.2.4
  %1011 = add nuw nsw i64 %indvars.iv.next.i.1.4, %837
  %arrayidx45.us.i.2.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1011
  %1012 = load float, float* %arrayidx45.us.i.2.4, align 4, !tbaa !2
  %sub46.us.i.2.4 = fsub float %1012, %sub25.us.i.2.4
  store float %sub46.us.i.2.4, float* %arrayidx16.us.i.2.4, align 4, !tbaa !2
  %1013 = load float, float* %arrayidx45.us.i.2.4, align 4, !tbaa !2
  %add58.us.i.2.4 = fadd float %sub25.us.i.2.4, %1013
  store float %add58.us.i.2.4, float* %arrayidx45.us.i.2.4, align 4, !tbaa !2
  %arrayidx63.us.i.2.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1011
  %1014 = load float, float* %arrayidx63.us.i.2.4, align 4, !tbaa !2
  %sub64.us.i.2.4 = fsub float %1014, %add40.us.i.2.4
  store float %sub64.us.i.2.4, float* %arrayidx23.us.i.2.4, align 4, !tbaa !2
  %1015 = load float, float* %arrayidx63.us.i.2.4, align 4, !tbaa !2
  %add76.us.i.2.4 = fadd float %add40.us.i.2.4, %1015
  store float %add76.us.i.2.4, float* %arrayidx63.us.i.2.4, align 4, !tbaa !2
  %indvars.iv.next.i.2.4 = add nuw nsw i64 %indvars.iv.next.i.1.4, 1
  %1016 = trunc i64 %indvars.iv.next.i.2.4 to i32
  %add14.us.i.3.4 = add i32 %add13.us.i.4, %1016
  %idxprom15.us.i.3.4 = sext i32 %add14.us.i.3.4 to i64
  %arrayidx16.us.i.3.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.4
  %1017 = load float, float* %arrayidx16.us.i.3.4, align 4, !tbaa !2
  %mul17.us.i.3.4 = fmul float %834, %1017
  %arrayidx23.us.i.3.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.4
  %1018 = load float, float* %arrayidx23.us.i.3.4, align 4, !tbaa !2
  %mul24.us.i.3.4 = fmul float %835, %1018
  %sub25.us.i.3.4 = fsub float %mul17.us.i.3.4, %mul24.us.i.3.4
  %mul32.us.i.3.4 = fmul float %835, %1017
  %mul39.us.i.3.4 = fmul float %834, %1018
  %add40.us.i.3.4 = fadd float %mul32.us.i.3.4, %mul39.us.i.3.4
  %1019 = add nuw nsw i64 %indvars.iv.next.i.2.4, %837
  %arrayidx45.us.i.3.4 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1019
  %1020 = load float, float* %arrayidx45.us.i.3.4, align 4, !tbaa !2
  %sub46.us.i.3.4 = fsub float %1020, %sub25.us.i.3.4
  store float %sub46.us.i.3.4, float* %arrayidx16.us.i.3.4, align 4, !tbaa !2
  %1021 = load float, float* %arrayidx45.us.i.3.4, align 4, !tbaa !2
  %add58.us.i.3.4 = fadd float %sub25.us.i.3.4, %1021
  store float %add58.us.i.3.4, float* %arrayidx45.us.i.3.4, align 4, !tbaa !2
  %arrayidx63.us.i.3.4 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1019
  %1022 = load float, float* %arrayidx63.us.i.3.4, align 4, !tbaa !2
  %sub64.us.i.3.4 = fsub float %1022, %add40.us.i.3.4
  store float %sub64.us.i.3.4, float* %arrayidx23.us.i.3.4, align 4, !tbaa !2
  %1023 = load float, float* %arrayidx63.us.i.3.4, align 4, !tbaa !2
  %add76.us.i.3.4 = fadd float %add40.us.i.3.4, %1023
  store float %add76.us.i.3.4, float* %arrayidx63.us.i.3.4, align 4, !tbaa !2
  %indvars.iv.next.i.3.4 = add nuw nsw i64 %indvars.iv.next.i.2.4, 1
  %exitcond.i.3.4 = icmp eq i64 %indvars.iv.next.i.3.4, 8
  br i1 %exitcond.i.3.4, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.4, label %for.body11.us.i.4, !llvm.loop !24

for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.4: ; preds = %for.body11.us.i.4
  br label %for.cond9.for.inc77_crit_edge.us.i.loopexit.4

for.cond9.for.inc77_crit_edge.us.i.loopexit.4:    ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.4, %for.body11.us.i.prol.loopexit.4
  br label %for.cond9.for.inc77_crit_edge.us.i.4

for.cond9.for.inc77_crit_edge.us.i.4:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.4, %middle.block16.4
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
  %1024 = trunc i64 %indvars.iv162.i.5 to i32
  %1025 = mul i32 8, %1024
  %1026 = add i32 4, %1025
  %1027 = sext i32 %1026 to i64
  %scevgep.5 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %1027
  %scevgep23.5 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_real, i64 0, i64 4), i64 %1027
  %1028 = mul i64 8, %indvars.iv162.i.5
  %scevgep25.5 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %1028
  %1029 = add i64 %1028, 4
  %scevgep27.5 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %1029
  %scevgep29.5 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %1027
  %scevgep32.5 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_imag, i64 0, i64 4), i64 %1027
  %scevgep34.5 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %1028
  %scevgep36.5 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %1029
  %1030 = trunc i64 %indvars.iv162.i.5 to i32
  %1031 = mul i32 8, %1030
  %1032 = add i32 4, %1031
  %1033 = add nsw i64 %indvars.iv162.i.5, 31
  %arrayidx.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %1033
  %1034 = load float, float* %arrayidx.us.i.5, align 4, !tbaa !2
  %arrayidx8.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %1033
  %1035 = load float, float* %arrayidx8.us.i.5, align 4, !tbaa !2
  %1036 = shl nuw nsw i64 %indvars.iv162.i.5, 1
  %1037 = mul nuw nsw i64 %1036, 4
  %1038 = trunc i64 %1037 to i32
  %add13.us.i.5 = add i32 4, %1038
  br i1 false, label %for.body11.us.i.preheader.5, label %vector.scevcheck.5

vector.scevcheck.5:                               ; preds = %for.body3.us.i.5
  %1039 = add i32 %1032, 3
  %1040 = icmp slt i32 %1039, %1032
  br i1 %1040, label %for.body11.us.i.preheader.5, label %vector.memcheck.5

vector.memcheck.5:                                ; preds = %vector.scevcheck.5
  %bound0.5 = icmp ult float* %scevgep.5, %scevgep27.5
  %bound1.5 = icmp ult float* %scevgep25.5, %scevgep23.5
  %found.conflict.5 = and i1 %bound0.5, %bound1.5
  %bound038.5 = icmp ult float* %scevgep29.5, %scevgep36.5
  %bound139.5 = icmp ult float* %scevgep34.5, %scevgep32.5
  %found.conflict40.5 = and i1 %bound038.5, %bound139.5
  %conflict.rdx.5 = or i1 %found.conflict.5, %found.conflict40.5
  br i1 %conflict.rdx.5, label %for.body11.us.i.preheader.5, label %vector.ph41.5

vector.ph41.5:                                    ; preds = %vector.memcheck.5
  %broadcast.splatinsert52.5 = insertelement <4 x float> undef, float %1034, i32 0
  %broadcast.splat53.5 = shufflevector <4 x float> %broadcast.splatinsert52.5, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert55.5 = insertelement <4 x float> undef, float %1035, i32 0
  %broadcast.splat56.5 = shufflevector <4 x float> %broadcast.splatinsert55.5, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 true, label %middle.block16.unr-lcssa.5, label %vector.ph41.new.5

vector.ph41.new.5:                                ; preds = %vector.ph41.5
  br label %vector.body18.5

vector.body18.5:                                  ; preds = %vector.body18.5, %vector.ph41.new.5
  %index42.5 = phi i64 [ 0, %vector.ph41.new.5 ], [ %index.next43.3.5, %vector.body18.5 ]
  %niter.5 = phi i64 [ 0, %vector.ph41.new.5 ], [ %niter.nsub.3.5, %vector.body18.5 ]
  %1041 = trunc i64 %index42.5 to i32
  %1042 = add i32 %add13.us.i.5, %1041
  %1043 = sext i32 %1042 to i64
  %1044 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1043
  %1045 = bitcast float* %1044 to <4 x float>*
  %wide.load.5 = load <4 x float>, <4 x float>* %1045, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1046 = fmul <4 x float> %broadcast.splat53.5, %wide.load.5
  %1047 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1043
  %1048 = bitcast float* %1047 to <4 x float>*
  %wide.load54.5 = load <4 x float>, <4 x float>* %1048, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1049 = fmul <4 x float> %broadcast.splat56.5, %wide.load54.5
  %1050 = fsub <4 x float> %1046, %1049
  %1051 = fmul <4 x float> %broadcast.splat56.5, %wide.load.5
  %1052 = fmul <4 x float> %broadcast.splat53.5, %wide.load54.5
  %1053 = fadd <4 x float> %1051, %1052
  %1054 = add nuw nsw i64 %index42.5, %1037
  %1055 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1054
  %1056 = bitcast float* %1055 to <4 x float>*
  %wide.load57.5 = load <4 x float>, <4 x float>* %1056, align 8, !tbaa !2, !alias.scope !12
  %1057 = fsub <4 x float> %wide.load57.5, %1050
  %1058 = bitcast float* %1044 to <4 x float>*
  store <4 x float> %1057, <4 x float>* %1058, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1059 = bitcast float* %1055 to <4 x float>*
  %wide.load58.5 = load <4 x float>, <4 x float>* %1059, align 8, !tbaa !2, !alias.scope !12
  %1060 = fadd <4 x float> %1050, %wide.load58.5
  %1061 = bitcast float* %1055 to <4 x float>*
  store <4 x float> %1060, <4 x float>* %1061, align 8, !tbaa !2, !alias.scope !12
  %1062 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1054
  %1063 = bitcast float* %1062 to <4 x float>*
  %wide.load59.5 = load <4 x float>, <4 x float>* %1063, align 8, !tbaa !2, !alias.scope !16
  %1064 = fsub <4 x float> %wide.load59.5, %1053
  %1065 = bitcast float* %1047 to <4 x float>*
  store <4 x float> %1064, <4 x float>* %1065, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1066 = bitcast float* %1062 to <4 x float>*
  %wide.load60.5 = load <4 x float>, <4 x float>* %1066, align 8, !tbaa !2, !alias.scope !16
  %1067 = fadd <4 x float> %1053, %wide.load60.5
  %1068 = bitcast float* %1062 to <4 x float>*
  store <4 x float> %1067, <4 x float>* %1068, align 8, !tbaa !2, !alias.scope !16
  %index.next43.5 = add nuw nsw i64 %index42.5, 4
  %niter.nsub.5 = sub i64 %niter.5, 1
  %1069 = trunc i64 %index.next43.5 to i32
  %1070 = add i32 %add13.us.i.5, %1069
  %1071 = sext i32 %1070 to i64
  %1072 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1071
  %1073 = bitcast float* %1072 to <4 x float>*
  %wide.load.1.5 = load <4 x float>, <4 x float>* %1073, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1074 = fmul <4 x float> %broadcast.splat53.5, %wide.load.1.5
  %1075 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1071
  %1076 = bitcast float* %1075 to <4 x float>*
  %wide.load54.1.5 = load <4 x float>, <4 x float>* %1076, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1077 = fmul <4 x float> %broadcast.splat56.5, %wide.load54.1.5
  %1078 = fsub <4 x float> %1074, %1077
  %1079 = fmul <4 x float> %broadcast.splat56.5, %wide.load.1.5
  %1080 = fmul <4 x float> %broadcast.splat53.5, %wide.load54.1.5
  %1081 = fadd <4 x float> %1079, %1080
  %1082 = add nuw nsw i64 %index.next43.5, %1037
  %1083 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1082
  %1084 = bitcast float* %1083 to <4 x float>*
  %wide.load57.1.5 = load <4 x float>, <4 x float>* %1084, align 8, !tbaa !2, !alias.scope !12
  %1085 = fsub <4 x float> %wide.load57.1.5, %1078
  %1086 = bitcast float* %1072 to <4 x float>*
  store <4 x float> %1085, <4 x float>* %1086, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1087 = bitcast float* %1083 to <4 x float>*
  %wide.load58.1.5 = load <4 x float>, <4 x float>* %1087, align 8, !tbaa !2, !alias.scope !12
  %1088 = fadd <4 x float> %1078, %wide.load58.1.5
  %1089 = bitcast float* %1083 to <4 x float>*
  store <4 x float> %1088, <4 x float>* %1089, align 8, !tbaa !2, !alias.scope !12
  %1090 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1082
  %1091 = bitcast float* %1090 to <4 x float>*
  %wide.load59.1.5 = load <4 x float>, <4 x float>* %1091, align 8, !tbaa !2, !alias.scope !16
  %1092 = fsub <4 x float> %wide.load59.1.5, %1081
  %1093 = bitcast float* %1075 to <4 x float>*
  store <4 x float> %1092, <4 x float>* %1093, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1094 = bitcast float* %1090 to <4 x float>*
  %wide.load60.1.5 = load <4 x float>, <4 x float>* %1094, align 8, !tbaa !2, !alias.scope !16
  %1095 = fadd <4 x float> %1081, %wide.load60.1.5
  %1096 = bitcast float* %1090 to <4 x float>*
  store <4 x float> %1095, <4 x float>* %1096, align 8, !tbaa !2, !alias.scope !16
  %index.next43.1.5 = add nuw nsw i64 %index.next43.5, 4
  %niter.nsub.1.5 = sub i64 %niter.nsub.5, 1
  %1097 = trunc i64 %index.next43.1.5 to i32
  %1098 = add i32 %add13.us.i.5, %1097
  %1099 = sext i32 %1098 to i64
  %1100 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1099
  %1101 = bitcast float* %1100 to <4 x float>*
  %wide.load.2.5 = load <4 x float>, <4 x float>* %1101, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1102 = fmul <4 x float> %broadcast.splat53.5, %wide.load.2.5
  %1103 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1099
  %1104 = bitcast float* %1103 to <4 x float>*
  %wide.load54.2.5 = load <4 x float>, <4 x float>* %1104, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1105 = fmul <4 x float> %broadcast.splat56.5, %wide.load54.2.5
  %1106 = fsub <4 x float> %1102, %1105
  %1107 = fmul <4 x float> %broadcast.splat56.5, %wide.load.2.5
  %1108 = fmul <4 x float> %broadcast.splat53.5, %wide.load54.2.5
  %1109 = fadd <4 x float> %1107, %1108
  %1110 = add nuw nsw i64 %index.next43.1.5, %1037
  %1111 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1110
  %1112 = bitcast float* %1111 to <4 x float>*
  %wide.load57.2.5 = load <4 x float>, <4 x float>* %1112, align 8, !tbaa !2, !alias.scope !12
  %1113 = fsub <4 x float> %wide.load57.2.5, %1106
  %1114 = bitcast float* %1100 to <4 x float>*
  store <4 x float> %1113, <4 x float>* %1114, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1115 = bitcast float* %1111 to <4 x float>*
  %wide.load58.2.5 = load <4 x float>, <4 x float>* %1115, align 8, !tbaa !2, !alias.scope !12
  %1116 = fadd <4 x float> %1106, %wide.load58.2.5
  %1117 = bitcast float* %1111 to <4 x float>*
  store <4 x float> %1116, <4 x float>* %1117, align 8, !tbaa !2, !alias.scope !12
  %1118 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1110
  %1119 = bitcast float* %1118 to <4 x float>*
  %wide.load59.2.5 = load <4 x float>, <4 x float>* %1119, align 8, !tbaa !2, !alias.scope !16
  %1120 = fsub <4 x float> %wide.load59.2.5, %1109
  %1121 = bitcast float* %1103 to <4 x float>*
  store <4 x float> %1120, <4 x float>* %1121, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1122 = bitcast float* %1118 to <4 x float>*
  %wide.load60.2.5 = load <4 x float>, <4 x float>* %1122, align 8, !tbaa !2, !alias.scope !16
  %1123 = fadd <4 x float> %1109, %wide.load60.2.5
  %1124 = bitcast float* %1118 to <4 x float>*
  store <4 x float> %1123, <4 x float>* %1124, align 8, !tbaa !2, !alias.scope !16
  %index.next43.2.5 = add nuw nsw i64 %index.next43.1.5, 4
  %niter.nsub.2.5 = sub i64 %niter.nsub.1.5, 1
  %1125 = trunc i64 %index.next43.2.5 to i32
  %1126 = add i32 %add13.us.i.5, %1125
  %1127 = sext i32 %1126 to i64
  %1128 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1127
  %1129 = bitcast float* %1128 to <4 x float>*
  %wide.load.3.5 = load <4 x float>, <4 x float>* %1129, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1130 = fmul <4 x float> %broadcast.splat53.5, %wide.load.3.5
  %1131 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1127
  %1132 = bitcast float* %1131 to <4 x float>*
  %wide.load54.3.5 = load <4 x float>, <4 x float>* %1132, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1133 = fmul <4 x float> %broadcast.splat56.5, %wide.load54.3.5
  %1134 = fsub <4 x float> %1130, %1133
  %1135 = fmul <4 x float> %broadcast.splat56.5, %wide.load.3.5
  %1136 = fmul <4 x float> %broadcast.splat53.5, %wide.load54.3.5
  %1137 = fadd <4 x float> %1135, %1136
  %1138 = add nuw nsw i64 %index.next43.2.5, %1037
  %1139 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1138
  %1140 = bitcast float* %1139 to <4 x float>*
  %wide.load57.3.5 = load <4 x float>, <4 x float>* %1140, align 8, !tbaa !2, !alias.scope !12
  %1141 = fsub <4 x float> %wide.load57.3.5, %1134
  %1142 = bitcast float* %1128 to <4 x float>*
  store <4 x float> %1141, <4 x float>* %1142, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1143 = bitcast float* %1139 to <4 x float>*
  %wide.load58.3.5 = load <4 x float>, <4 x float>* %1143, align 8, !tbaa !2, !alias.scope !12
  %1144 = fadd <4 x float> %1134, %wide.load58.3.5
  %1145 = bitcast float* %1139 to <4 x float>*
  store <4 x float> %1144, <4 x float>* %1145, align 8, !tbaa !2, !alias.scope !12
  %1146 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1138
  %1147 = bitcast float* %1146 to <4 x float>*
  %wide.load59.3.5 = load <4 x float>, <4 x float>* %1147, align 8, !tbaa !2, !alias.scope !16
  %1148 = fsub <4 x float> %wide.load59.3.5, %1137
  %1149 = bitcast float* %1131 to <4 x float>*
  store <4 x float> %1148, <4 x float>* %1149, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1150 = bitcast float* %1146 to <4 x float>*
  %wide.load60.3.5 = load <4 x float>, <4 x float>* %1150, align 8, !tbaa !2, !alias.scope !16
  %1151 = fadd <4 x float> %1137, %wide.load60.3.5
  %1152 = bitcast float* %1146 to <4 x float>*
  store <4 x float> %1151, <4 x float>* %1152, align 8, !tbaa !2, !alias.scope !16
  %index.next43.3.5 = add i64 %index.next43.2.5, 4
  %niter.nsub.3.5 = sub i64 %niter.nsub.2.5, 1
  %niter.ncmp.3.5 = icmp eq i64 %niter.nsub.3.5, 0
  br i1 %niter.ncmp.3.5, label %middle.block16.unr-lcssa.loopexit.5, label %vector.body18.5, !llvm.loop !18

middle.block16.unr-lcssa.loopexit.5:              ; preds = %vector.body18.5
  %index42.unr.ph.5 = phi i64 [ %index.next43.3.5, %vector.body18.5 ]
  br label %middle.block16.unr-lcssa.5

middle.block16.unr-lcssa.5:                       ; preds = %middle.block16.unr-lcssa.loopexit.5, %vector.ph41.5
  %index42.unr.5 = phi i64 [ 0, %vector.ph41.5 ], [ %index42.unr.ph.5, %middle.block16.unr-lcssa.loopexit.5 ]
  br i1 true, label %vector.body18.epil.preheader.5, label %middle.block16.5

vector.body18.epil.preheader.5:                   ; preds = %middle.block16.unr-lcssa.5
  br label %vector.body18.epil.5

vector.body18.epil.5:                             ; preds = %vector.body18.epil.5, %vector.body18.epil.preheader.5
  %index42.epil.5 = phi i64 [ %index42.unr.5, %vector.body18.epil.preheader.5 ], [ %index.next43.epil.5, %vector.body18.epil.5 ]
  %epil.iter.5 = phi i64 [ 1, %vector.body18.epil.preheader.5 ], [ %epil.iter.sub.5, %vector.body18.epil.5 ]
  %1153 = trunc i64 %index42.epil.5 to i32
  %1154 = add i32 %add13.us.i.5, %1153
  %1155 = sext i32 %1154 to i64
  %1156 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1155
  %1157 = bitcast float* %1156 to <4 x float>*
  %wide.load.epil.5 = load <4 x float>, <4 x float>* %1157, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1158 = fmul <4 x float> %broadcast.splat53.5, %wide.load.epil.5
  %1159 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1155
  %1160 = bitcast float* %1159 to <4 x float>*
  %wide.load54.epil.5 = load <4 x float>, <4 x float>* %1160, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1161 = fmul <4 x float> %broadcast.splat56.5, %wide.load54.epil.5
  %1162 = fsub <4 x float> %1158, %1161
  %1163 = fmul <4 x float> %broadcast.splat56.5, %wide.load.epil.5
  %1164 = fmul <4 x float> %broadcast.splat53.5, %wide.load54.epil.5
  %1165 = fadd <4 x float> %1163, %1164
  %1166 = add nuw nsw i64 %index42.epil.5, %1037
  %1167 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1166
  %1168 = bitcast float* %1167 to <4 x float>*
  %wide.load57.epil.5 = load <4 x float>, <4 x float>* %1168, align 8, !tbaa !2, !alias.scope !12
  %1169 = fsub <4 x float> %wide.load57.epil.5, %1162
  %1170 = bitcast float* %1156 to <4 x float>*
  store <4 x float> %1169, <4 x float>* %1170, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1171 = bitcast float* %1167 to <4 x float>*
  %wide.load58.epil.5 = load <4 x float>, <4 x float>* %1171, align 8, !tbaa !2, !alias.scope !12
  %1172 = fadd <4 x float> %1162, %wide.load58.epil.5
  %1173 = bitcast float* %1167 to <4 x float>*
  store <4 x float> %1172, <4 x float>* %1173, align 8, !tbaa !2, !alias.scope !12
  %1174 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1166
  %1175 = bitcast float* %1174 to <4 x float>*
  %wide.load59.epil.5 = load <4 x float>, <4 x float>* %1175, align 8, !tbaa !2, !alias.scope !16
  %1176 = fsub <4 x float> %wide.load59.epil.5, %1165
  %1177 = bitcast float* %1159 to <4 x float>*
  store <4 x float> %1176, <4 x float>* %1177, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1178 = bitcast float* %1174 to <4 x float>*
  %wide.load60.epil.5 = load <4 x float>, <4 x float>* %1178, align 8, !tbaa !2, !alias.scope !16
  %1179 = fadd <4 x float> %1165, %wide.load60.epil.5
  %1180 = bitcast float* %1174 to <4 x float>*
  store <4 x float> %1179, <4 x float>* %1180, align 8, !tbaa !2, !alias.scope !16
  %index.next43.epil.5 = add i64 %index42.epil.5, 4
  %epil.iter.sub.5 = sub i64 %epil.iter.5, 1
  %epil.iter.cmp.5 = icmp ne i64 %epil.iter.sub.5, 0
  br i1 %epil.iter.cmp.5, label %vector.body18.epil.5, label %middle.block16.epilog-lcssa.5, !llvm.loop !22

middle.block16.epilog-lcssa.5:                    ; preds = %vector.body18.epil.5
  br label %middle.block16.5

middle.block16.5:                                 ; preds = %middle.block16.epilog-lcssa.5, %middle.block16.unr-lcssa.5
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.i.5, label %for.body11.us.i.preheader.5

for.body11.us.i.preheader.5:                      ; preds = %middle.block16.5, %vector.memcheck.5, %vector.scevcheck.5, %for.body3.us.i.5
  %indvars.iv.i.ph.5 = phi i64 [ 0, %vector.memcheck.5 ], [ 0, %vector.scevcheck.5 ], [ 0, %for.body3.us.i.5 ], [ 4, %middle.block16.5 ]
  %1181 = sub i64 4, %indvars.iv.i.ph.5
  %1182 = sub i64 3, %indvars.iv.i.ph.5
  br i1 false, label %for.body11.us.i.prol.preheader.5, label %for.body11.us.i.prol.loopexit.5

for.body11.us.i.prol.preheader.5:                 ; preds = %for.body11.us.i.preheader.5
  br label %for.body11.us.i.prol.5

for.body11.us.i.prol.5:                           ; preds = %for.body11.us.i.prol.5, %for.body11.us.i.prol.preheader.5
  %indvars.iv.i.prol.5 = phi i64 [ %indvars.iv.next.i.prol.5, %for.body11.us.i.prol.5 ], [ %indvars.iv.i.ph.5, %for.body11.us.i.prol.preheader.5 ]
  %prol.iter.5 = phi i64 [ 0, %for.body11.us.i.prol.preheader.5 ], [ %prol.iter.sub.5, %for.body11.us.i.prol.5 ]
  %1183 = trunc i64 %indvars.iv.i.prol.5 to i32
  %add14.us.i.prol.5 = add i32 %add13.us.i.5, %1183
  %idxprom15.us.i.prol.5 = sext i32 %add14.us.i.prol.5 to i64
  %arrayidx16.us.i.prol.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.prol.5
  %1184 = load float, float* %arrayidx16.us.i.prol.5, align 4, !tbaa !2
  %mul17.us.i.prol.5 = fmul float %1034, %1184
  %arrayidx23.us.i.prol.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.prol.5
  %1185 = load float, float* %arrayidx23.us.i.prol.5, align 4, !tbaa !2
  %mul24.us.i.prol.5 = fmul float %1035, %1185
  %sub25.us.i.prol.5 = fsub float %mul17.us.i.prol.5, %mul24.us.i.prol.5
  %mul32.us.i.prol.5 = fmul float %1035, %1184
  %mul39.us.i.prol.5 = fmul float %1034, %1185
  %add40.us.i.prol.5 = fadd float %mul32.us.i.prol.5, %mul39.us.i.prol.5
  %1186 = add nuw nsw i64 %indvars.iv.i.prol.5, %1037
  %arrayidx45.us.i.prol.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1186
  %1187 = load float, float* %arrayidx45.us.i.prol.5, align 4, !tbaa !2
  %sub46.us.i.prol.5 = fsub float %1187, %sub25.us.i.prol.5
  store float %sub46.us.i.prol.5, float* %arrayidx16.us.i.prol.5, align 4, !tbaa !2
  %1188 = load float, float* %arrayidx45.us.i.prol.5, align 4, !tbaa !2
  %add58.us.i.prol.5 = fadd float %sub25.us.i.prol.5, %1188
  store float %add58.us.i.prol.5, float* %arrayidx45.us.i.prol.5, align 4, !tbaa !2
  %arrayidx63.us.i.prol.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1186
  %1189 = load float, float* %arrayidx63.us.i.prol.5, align 4, !tbaa !2
  %sub64.us.i.prol.5 = fsub float %1189, %add40.us.i.prol.5
  store float %sub64.us.i.prol.5, float* %arrayidx23.us.i.prol.5, align 4, !tbaa !2
  %1190 = load float, float* %arrayidx63.us.i.prol.5, align 4, !tbaa !2
  %add76.us.i.prol.5 = fadd float %add40.us.i.prol.5, %1190
  store float %add76.us.i.prol.5, float* %arrayidx63.us.i.prol.5, align 4, !tbaa !2
  %indvars.iv.next.i.prol.5 = add nuw nsw i64 %indvars.iv.i.prol.5, 1
  %prol.iter.sub.5 = sub i64 %prol.iter.5, 1
  %prol.iter.cmp.5 = icmp ne i64 %prol.iter.sub.5, 0
  br i1 %prol.iter.cmp.5, label %for.body11.us.i.prol.5, label %for.body11.us.i.prol.loopexit.unr-lcssa.5, !llvm.loop !23

for.body11.us.i.prol.loopexit.unr-lcssa.5:        ; preds = %for.body11.us.i.prol.5
  %indvars.iv.i.unr.ph.5 = phi i64 [ %indvars.iv.next.i.prol.5, %for.body11.us.i.prol.5 ]
  br label %for.body11.us.i.prol.loopexit.5

for.body11.us.i.prol.loopexit.5:                  ; preds = %for.body11.us.i.prol.loopexit.unr-lcssa.5, %for.body11.us.i.preheader.5
  %indvars.iv.i.unr.5 = phi i64 [ %indvars.iv.i.ph.5, %for.body11.us.i.preheader.5 ], [ %indvars.iv.i.unr.ph.5, %for.body11.us.i.prol.loopexit.unr-lcssa.5 ]
  %1191 = icmp ult i64 %1182, 3
  br i1 %1191, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.5, label %for.body11.us.i.preheader.new.5

for.body11.us.i.preheader.new.5:                  ; preds = %for.body11.us.i.prol.loopexit.5
  br label %for.body11.us.i.5

for.body11.us.i.5:                                ; preds = %for.body11.us.i.5, %for.body11.us.i.preheader.new.5
  %indvars.iv.i.5 = phi i64 [ %indvars.iv.i.unr.5, %for.body11.us.i.preheader.new.5 ], [ %indvars.iv.next.i.3.5, %for.body11.us.i.5 ]
  %1192 = trunc i64 %indvars.iv.i.5 to i32
  %add14.us.i.5 = add i32 %add13.us.i.5, %1192
  %idxprom15.us.i.5 = sext i32 %add14.us.i.5 to i64
  %arrayidx16.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.5
  %1193 = load float, float* %arrayidx16.us.i.5, align 4, !tbaa !2
  %mul17.us.i.5 = fmul float %1034, %1193
  %arrayidx23.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.5
  %1194 = load float, float* %arrayidx23.us.i.5, align 4, !tbaa !2
  %mul24.us.i.5 = fmul float %1035, %1194
  %sub25.us.i.5 = fsub float %mul17.us.i.5, %mul24.us.i.5
  %mul32.us.i.5 = fmul float %1035, %1193
  %mul39.us.i.5 = fmul float %1034, %1194
  %add40.us.i.5 = fadd float %mul32.us.i.5, %mul39.us.i.5
  %1195 = add nuw nsw i64 %indvars.iv.i.5, %1037
  %arrayidx45.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1195
  %1196 = load float, float* %arrayidx45.us.i.5, align 4, !tbaa !2
  %sub46.us.i.5 = fsub float %1196, %sub25.us.i.5
  store float %sub46.us.i.5, float* %arrayidx16.us.i.5, align 4, !tbaa !2
  %1197 = load float, float* %arrayidx45.us.i.5, align 4, !tbaa !2
  %add58.us.i.5 = fadd float %sub25.us.i.5, %1197
  store float %add58.us.i.5, float* %arrayidx45.us.i.5, align 4, !tbaa !2
  %arrayidx63.us.i.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1195
  %1198 = load float, float* %arrayidx63.us.i.5, align 4, !tbaa !2
  %sub64.us.i.5 = fsub float %1198, %add40.us.i.5
  store float %sub64.us.i.5, float* %arrayidx23.us.i.5, align 4, !tbaa !2
  %1199 = load float, float* %arrayidx63.us.i.5, align 4, !tbaa !2
  %add76.us.i.5 = fadd float %add40.us.i.5, %1199
  store float %add76.us.i.5, float* %arrayidx63.us.i.5, align 4, !tbaa !2
  %indvars.iv.next.i.5 = add nuw nsw i64 %indvars.iv.i.5, 1
  %1200 = trunc i64 %indvars.iv.next.i.5 to i32
  %add14.us.i.1.5 = add i32 %add13.us.i.5, %1200
  %idxprom15.us.i.1.5 = sext i32 %add14.us.i.1.5 to i64
  %arrayidx16.us.i.1.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.5
  %1201 = load float, float* %arrayidx16.us.i.1.5, align 4, !tbaa !2
  %mul17.us.i.1.5 = fmul float %1034, %1201
  %arrayidx23.us.i.1.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.5
  %1202 = load float, float* %arrayidx23.us.i.1.5, align 4, !tbaa !2
  %mul24.us.i.1.5 = fmul float %1035, %1202
  %sub25.us.i.1.5 = fsub float %mul17.us.i.1.5, %mul24.us.i.1.5
  %mul32.us.i.1.5 = fmul float %1035, %1201
  %mul39.us.i.1.5 = fmul float %1034, %1202
  %add40.us.i.1.5 = fadd float %mul32.us.i.1.5, %mul39.us.i.1.5
  %1203 = add nuw nsw i64 %indvars.iv.next.i.5, %1037
  %arrayidx45.us.i.1.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1203
  %1204 = load float, float* %arrayidx45.us.i.1.5, align 4, !tbaa !2
  %sub46.us.i.1.5 = fsub float %1204, %sub25.us.i.1.5
  store float %sub46.us.i.1.5, float* %arrayidx16.us.i.1.5, align 4, !tbaa !2
  %1205 = load float, float* %arrayidx45.us.i.1.5, align 4, !tbaa !2
  %add58.us.i.1.5 = fadd float %sub25.us.i.1.5, %1205
  store float %add58.us.i.1.5, float* %arrayidx45.us.i.1.5, align 4, !tbaa !2
  %arrayidx63.us.i.1.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1203
  %1206 = load float, float* %arrayidx63.us.i.1.5, align 4, !tbaa !2
  %sub64.us.i.1.5 = fsub float %1206, %add40.us.i.1.5
  store float %sub64.us.i.1.5, float* %arrayidx23.us.i.1.5, align 4, !tbaa !2
  %1207 = load float, float* %arrayidx63.us.i.1.5, align 4, !tbaa !2
  %add76.us.i.1.5 = fadd float %add40.us.i.1.5, %1207
  store float %add76.us.i.1.5, float* %arrayidx63.us.i.1.5, align 4, !tbaa !2
  %indvars.iv.next.i.1.5 = add nuw nsw i64 %indvars.iv.next.i.5, 1
  %1208 = trunc i64 %indvars.iv.next.i.1.5 to i32
  %add14.us.i.2.5 = add i32 %add13.us.i.5, %1208
  %idxprom15.us.i.2.5 = sext i32 %add14.us.i.2.5 to i64
  %arrayidx16.us.i.2.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.5
  %1209 = load float, float* %arrayidx16.us.i.2.5, align 4, !tbaa !2
  %mul17.us.i.2.5 = fmul float %1034, %1209
  %arrayidx23.us.i.2.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.5
  %1210 = load float, float* %arrayidx23.us.i.2.5, align 4, !tbaa !2
  %mul24.us.i.2.5 = fmul float %1035, %1210
  %sub25.us.i.2.5 = fsub float %mul17.us.i.2.5, %mul24.us.i.2.5
  %mul32.us.i.2.5 = fmul float %1035, %1209
  %mul39.us.i.2.5 = fmul float %1034, %1210
  %add40.us.i.2.5 = fadd float %mul32.us.i.2.5, %mul39.us.i.2.5
  %1211 = add nuw nsw i64 %indvars.iv.next.i.1.5, %1037
  %arrayidx45.us.i.2.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1211
  %1212 = load float, float* %arrayidx45.us.i.2.5, align 4, !tbaa !2
  %sub46.us.i.2.5 = fsub float %1212, %sub25.us.i.2.5
  store float %sub46.us.i.2.5, float* %arrayidx16.us.i.2.5, align 4, !tbaa !2
  %1213 = load float, float* %arrayidx45.us.i.2.5, align 4, !tbaa !2
  %add58.us.i.2.5 = fadd float %sub25.us.i.2.5, %1213
  store float %add58.us.i.2.5, float* %arrayidx45.us.i.2.5, align 4, !tbaa !2
  %arrayidx63.us.i.2.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1211
  %1214 = load float, float* %arrayidx63.us.i.2.5, align 4, !tbaa !2
  %sub64.us.i.2.5 = fsub float %1214, %add40.us.i.2.5
  store float %sub64.us.i.2.5, float* %arrayidx23.us.i.2.5, align 4, !tbaa !2
  %1215 = load float, float* %arrayidx63.us.i.2.5, align 4, !tbaa !2
  %add76.us.i.2.5 = fadd float %add40.us.i.2.5, %1215
  store float %add76.us.i.2.5, float* %arrayidx63.us.i.2.5, align 4, !tbaa !2
  %indvars.iv.next.i.2.5 = add nuw nsw i64 %indvars.iv.next.i.1.5, 1
  %1216 = trunc i64 %indvars.iv.next.i.2.5 to i32
  %add14.us.i.3.5 = add i32 %add13.us.i.5, %1216
  %idxprom15.us.i.3.5 = sext i32 %add14.us.i.3.5 to i64
  %arrayidx16.us.i.3.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.5
  %1217 = load float, float* %arrayidx16.us.i.3.5, align 4, !tbaa !2
  %mul17.us.i.3.5 = fmul float %1034, %1217
  %arrayidx23.us.i.3.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.5
  %1218 = load float, float* %arrayidx23.us.i.3.5, align 4, !tbaa !2
  %mul24.us.i.3.5 = fmul float %1035, %1218
  %sub25.us.i.3.5 = fsub float %mul17.us.i.3.5, %mul24.us.i.3.5
  %mul32.us.i.3.5 = fmul float %1035, %1217
  %mul39.us.i.3.5 = fmul float %1034, %1218
  %add40.us.i.3.5 = fadd float %mul32.us.i.3.5, %mul39.us.i.3.5
  %1219 = add nuw nsw i64 %indvars.iv.next.i.2.5, %1037
  %arrayidx45.us.i.3.5 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1219
  %1220 = load float, float* %arrayidx45.us.i.3.5, align 4, !tbaa !2
  %sub46.us.i.3.5 = fsub float %1220, %sub25.us.i.3.5
  store float %sub46.us.i.3.5, float* %arrayidx16.us.i.3.5, align 4, !tbaa !2
  %1221 = load float, float* %arrayidx45.us.i.3.5, align 4, !tbaa !2
  %add58.us.i.3.5 = fadd float %sub25.us.i.3.5, %1221
  store float %add58.us.i.3.5, float* %arrayidx45.us.i.3.5, align 4, !tbaa !2
  %arrayidx63.us.i.3.5 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1219
  %1222 = load float, float* %arrayidx63.us.i.3.5, align 4, !tbaa !2
  %sub64.us.i.3.5 = fsub float %1222, %add40.us.i.3.5
  store float %sub64.us.i.3.5, float* %arrayidx23.us.i.3.5, align 4, !tbaa !2
  %1223 = load float, float* %arrayidx63.us.i.3.5, align 4, !tbaa !2
  %add76.us.i.3.5 = fadd float %add40.us.i.3.5, %1223
  store float %add76.us.i.3.5, float* %arrayidx63.us.i.3.5, align 4, !tbaa !2
  %indvars.iv.next.i.3.5 = add nuw nsw i64 %indvars.iv.next.i.2.5, 1
  %exitcond.i.3.5 = icmp eq i64 %indvars.iv.next.i.3.5, 4
  br i1 %exitcond.i.3.5, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.5, label %for.body11.us.i.5, !llvm.loop !24

for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.5: ; preds = %for.body11.us.i.5
  br label %for.cond9.for.inc77_crit_edge.us.i.loopexit.5

for.cond9.for.inc77_crit_edge.us.i.loopexit.5:    ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.5, %for.body11.us.i.prol.loopexit.5
  br label %for.cond9.for.inc77_crit_edge.us.i.5

for.cond9.for.inc77_crit_edge.us.i.5:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.5, %middle.block16.5
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
  %1224 = trunc i64 %indvars.iv162.i.6 to i32
  %1225 = mul i32 4, %1224
  %1226 = add i32 2, %1225
  %1227 = sext i32 %1226 to i64
  %scevgep.6 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %1227
  %scevgep23.6 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_real, i64 0, i64 2), i64 %1227
  %1228 = mul i64 4, %indvars.iv162.i.6
  %scevgep25.6 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %1228
  %1229 = add i64 %1228, 2
  %scevgep27.6 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %1229
  %scevgep29.6 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %1227
  %scevgep32.6 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_imag, i64 0, i64 2), i64 %1227
  %scevgep34.6 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %1228
  %scevgep36.6 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %1229
  %1230 = trunc i64 %indvars.iv162.i.6 to i32
  %1231 = mul i32 4, %1230
  %1232 = add i32 2, %1231
  %1233 = add nsw i64 %indvars.iv162.i.6, 63
  %arrayidx.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %1233
  %1234 = load float, float* %arrayidx.us.i.6, align 4, !tbaa !2
  %arrayidx8.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %1233
  %1235 = load float, float* %arrayidx8.us.i.6, align 4, !tbaa !2
  %1236 = shl nuw nsw i64 %indvars.iv162.i.6, 1
  %1237 = mul nuw nsw i64 %1236, 2
  %1238 = trunc i64 %1237 to i32
  %add13.us.i.6 = add i32 2, %1238
  br i1 true, label %for.body11.us.i.preheader.6, label %vector.scevcheck.6

vector.scevcheck.6:                               ; preds = %for.body3.us.i.6
  %1239 = add i32 %1232, 1
  %1240 = icmp slt i32 %1239, %1232
  br i1 %1240, label %for.body11.us.i.preheader.6, label %vector.memcheck.6

vector.memcheck.6:                                ; preds = %vector.scevcheck.6
  %bound0.6 = icmp ult float* %scevgep.6, %scevgep27.6
  %bound1.6 = icmp ult float* %scevgep25.6, %scevgep23.6
  %found.conflict.6 = and i1 %bound0.6, %bound1.6
  %bound038.6 = icmp ult float* %scevgep29.6, %scevgep36.6
  %bound139.6 = icmp ult float* %scevgep34.6, %scevgep32.6
  %found.conflict40.6 = and i1 %bound038.6, %bound139.6
  %conflict.rdx.6 = or i1 %found.conflict.6, %found.conflict40.6
  br i1 %conflict.rdx.6, label %for.body11.us.i.preheader.6, label %vector.ph41.6

vector.ph41.6:                                    ; preds = %vector.memcheck.6
  %broadcast.splatinsert52.6 = insertelement <4 x float> undef, float %1234, i32 0
  %broadcast.splat53.6 = shufflevector <4 x float> %broadcast.splatinsert52.6, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert55.6 = insertelement <4 x float> undef, float %1235, i32 0
  %broadcast.splat56.6 = shufflevector <4 x float> %broadcast.splatinsert55.6, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block16.unr-lcssa.6, label %vector.ph41.new.6

vector.ph41.new.6:                                ; preds = %vector.ph41.6
  br label %vector.body18.6

vector.body18.6:                                  ; preds = %vector.body18.6, %vector.ph41.new.6
  %index42.6 = phi i64 [ 0, %vector.ph41.new.6 ], [ %index.next43.3.6, %vector.body18.6 ]
  %niter.6 = phi i64 [ 4611686018427387904, %vector.ph41.new.6 ], [ %niter.nsub.3.6, %vector.body18.6 ]
  %1241 = trunc i64 %index42.6 to i32
  %1242 = add i32 %add13.us.i.6, %1241
  %1243 = sext i32 %1242 to i64
  %1244 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1243
  %1245 = bitcast float* %1244 to <4 x float>*
  %wide.load.6 = load <4 x float>, <4 x float>* %1245, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1246 = fmul <4 x float> %broadcast.splat53.6, %wide.load.6
  %1247 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1243
  %1248 = bitcast float* %1247 to <4 x float>*
  %wide.load54.6 = load <4 x float>, <4 x float>* %1248, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1249 = fmul <4 x float> %broadcast.splat56.6, %wide.load54.6
  %1250 = fsub <4 x float> %1246, %1249
  %1251 = fmul <4 x float> %broadcast.splat56.6, %wide.load.6
  %1252 = fmul <4 x float> %broadcast.splat53.6, %wide.load54.6
  %1253 = fadd <4 x float> %1251, %1252
  %1254 = add nuw nsw i64 %index42.6, %1237
  %1255 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1254
  %1256 = bitcast float* %1255 to <4 x float>*
  %wide.load57.6 = load <4 x float>, <4 x float>* %1256, align 8, !tbaa !2, !alias.scope !12
  %1257 = fsub <4 x float> %wide.load57.6, %1250
  %1258 = bitcast float* %1244 to <4 x float>*
  store <4 x float> %1257, <4 x float>* %1258, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1259 = bitcast float* %1255 to <4 x float>*
  %wide.load58.6 = load <4 x float>, <4 x float>* %1259, align 8, !tbaa !2, !alias.scope !12
  %1260 = fadd <4 x float> %1250, %wide.load58.6
  %1261 = bitcast float* %1255 to <4 x float>*
  store <4 x float> %1260, <4 x float>* %1261, align 8, !tbaa !2, !alias.scope !12
  %1262 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1254
  %1263 = bitcast float* %1262 to <4 x float>*
  %wide.load59.6 = load <4 x float>, <4 x float>* %1263, align 8, !tbaa !2, !alias.scope !16
  %1264 = fsub <4 x float> %wide.load59.6, %1253
  %1265 = bitcast float* %1247 to <4 x float>*
  store <4 x float> %1264, <4 x float>* %1265, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1266 = bitcast float* %1262 to <4 x float>*
  %wide.load60.6 = load <4 x float>, <4 x float>* %1266, align 8, !tbaa !2, !alias.scope !16
  %1267 = fadd <4 x float> %1253, %wide.load60.6
  %1268 = bitcast float* %1262 to <4 x float>*
  store <4 x float> %1267, <4 x float>* %1268, align 8, !tbaa !2, !alias.scope !16
  %index.next43.6 = add nuw nsw i64 %index42.6, 4
  %niter.nsub.6 = sub i64 %niter.6, 1
  %1269 = trunc i64 %index.next43.6 to i32
  %1270 = add i32 %add13.us.i.6, %1269
  %1271 = sext i32 %1270 to i64
  %1272 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1271
  %1273 = bitcast float* %1272 to <4 x float>*
  %wide.load.1.6 = load <4 x float>, <4 x float>* %1273, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1274 = fmul <4 x float> %broadcast.splat53.6, %wide.load.1.6
  %1275 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1271
  %1276 = bitcast float* %1275 to <4 x float>*
  %wide.load54.1.6 = load <4 x float>, <4 x float>* %1276, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1277 = fmul <4 x float> %broadcast.splat56.6, %wide.load54.1.6
  %1278 = fsub <4 x float> %1274, %1277
  %1279 = fmul <4 x float> %broadcast.splat56.6, %wide.load.1.6
  %1280 = fmul <4 x float> %broadcast.splat53.6, %wide.load54.1.6
  %1281 = fadd <4 x float> %1279, %1280
  %1282 = add nuw nsw i64 %index.next43.6, %1237
  %1283 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1282
  %1284 = bitcast float* %1283 to <4 x float>*
  %wide.load57.1.6 = load <4 x float>, <4 x float>* %1284, align 8, !tbaa !2, !alias.scope !12
  %1285 = fsub <4 x float> %wide.load57.1.6, %1278
  %1286 = bitcast float* %1272 to <4 x float>*
  store <4 x float> %1285, <4 x float>* %1286, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1287 = bitcast float* %1283 to <4 x float>*
  %wide.load58.1.6 = load <4 x float>, <4 x float>* %1287, align 8, !tbaa !2, !alias.scope !12
  %1288 = fadd <4 x float> %1278, %wide.load58.1.6
  %1289 = bitcast float* %1283 to <4 x float>*
  store <4 x float> %1288, <4 x float>* %1289, align 8, !tbaa !2, !alias.scope !12
  %1290 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1282
  %1291 = bitcast float* %1290 to <4 x float>*
  %wide.load59.1.6 = load <4 x float>, <4 x float>* %1291, align 8, !tbaa !2, !alias.scope !16
  %1292 = fsub <4 x float> %wide.load59.1.6, %1281
  %1293 = bitcast float* %1275 to <4 x float>*
  store <4 x float> %1292, <4 x float>* %1293, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1294 = bitcast float* %1290 to <4 x float>*
  %wide.load60.1.6 = load <4 x float>, <4 x float>* %1294, align 8, !tbaa !2, !alias.scope !16
  %1295 = fadd <4 x float> %1281, %wide.load60.1.6
  %1296 = bitcast float* %1290 to <4 x float>*
  store <4 x float> %1295, <4 x float>* %1296, align 8, !tbaa !2, !alias.scope !16
  %index.next43.1.6 = add nuw nsw i64 %index.next43.6, 4
  %niter.nsub.1.6 = sub i64 %niter.nsub.6, 1
  %1297 = trunc i64 %index.next43.1.6 to i32
  %1298 = add i32 %add13.us.i.6, %1297
  %1299 = sext i32 %1298 to i64
  %1300 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1299
  %1301 = bitcast float* %1300 to <4 x float>*
  %wide.load.2.6 = load <4 x float>, <4 x float>* %1301, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1302 = fmul <4 x float> %broadcast.splat53.6, %wide.load.2.6
  %1303 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1299
  %1304 = bitcast float* %1303 to <4 x float>*
  %wide.load54.2.6 = load <4 x float>, <4 x float>* %1304, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1305 = fmul <4 x float> %broadcast.splat56.6, %wide.load54.2.6
  %1306 = fsub <4 x float> %1302, %1305
  %1307 = fmul <4 x float> %broadcast.splat56.6, %wide.load.2.6
  %1308 = fmul <4 x float> %broadcast.splat53.6, %wide.load54.2.6
  %1309 = fadd <4 x float> %1307, %1308
  %1310 = add nuw nsw i64 %index.next43.1.6, %1237
  %1311 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1310
  %1312 = bitcast float* %1311 to <4 x float>*
  %wide.load57.2.6 = load <4 x float>, <4 x float>* %1312, align 8, !tbaa !2, !alias.scope !12
  %1313 = fsub <4 x float> %wide.load57.2.6, %1306
  %1314 = bitcast float* %1300 to <4 x float>*
  store <4 x float> %1313, <4 x float>* %1314, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1315 = bitcast float* %1311 to <4 x float>*
  %wide.load58.2.6 = load <4 x float>, <4 x float>* %1315, align 8, !tbaa !2, !alias.scope !12
  %1316 = fadd <4 x float> %1306, %wide.load58.2.6
  %1317 = bitcast float* %1311 to <4 x float>*
  store <4 x float> %1316, <4 x float>* %1317, align 8, !tbaa !2, !alias.scope !12
  %1318 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1310
  %1319 = bitcast float* %1318 to <4 x float>*
  %wide.load59.2.6 = load <4 x float>, <4 x float>* %1319, align 8, !tbaa !2, !alias.scope !16
  %1320 = fsub <4 x float> %wide.load59.2.6, %1309
  %1321 = bitcast float* %1303 to <4 x float>*
  store <4 x float> %1320, <4 x float>* %1321, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1322 = bitcast float* %1318 to <4 x float>*
  %wide.load60.2.6 = load <4 x float>, <4 x float>* %1322, align 8, !tbaa !2, !alias.scope !16
  %1323 = fadd <4 x float> %1309, %wide.load60.2.6
  %1324 = bitcast float* %1318 to <4 x float>*
  store <4 x float> %1323, <4 x float>* %1324, align 8, !tbaa !2, !alias.scope !16
  %index.next43.2.6 = add nuw nsw i64 %index.next43.1.6, 4
  %niter.nsub.2.6 = sub i64 %niter.nsub.1.6, 1
  %1325 = trunc i64 %index.next43.2.6 to i32
  %1326 = add i32 %add13.us.i.6, %1325
  %1327 = sext i32 %1326 to i64
  %1328 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1327
  %1329 = bitcast float* %1328 to <4 x float>*
  %wide.load.3.6 = load <4 x float>, <4 x float>* %1329, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1330 = fmul <4 x float> %broadcast.splat53.6, %wide.load.3.6
  %1331 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1327
  %1332 = bitcast float* %1331 to <4 x float>*
  %wide.load54.3.6 = load <4 x float>, <4 x float>* %1332, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1333 = fmul <4 x float> %broadcast.splat56.6, %wide.load54.3.6
  %1334 = fsub <4 x float> %1330, %1333
  %1335 = fmul <4 x float> %broadcast.splat56.6, %wide.load.3.6
  %1336 = fmul <4 x float> %broadcast.splat53.6, %wide.load54.3.6
  %1337 = fadd <4 x float> %1335, %1336
  %1338 = add nuw nsw i64 %index.next43.2.6, %1237
  %1339 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1338
  %1340 = bitcast float* %1339 to <4 x float>*
  %wide.load57.3.6 = load <4 x float>, <4 x float>* %1340, align 8, !tbaa !2, !alias.scope !12
  %1341 = fsub <4 x float> %wide.load57.3.6, %1334
  %1342 = bitcast float* %1328 to <4 x float>*
  store <4 x float> %1341, <4 x float>* %1342, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1343 = bitcast float* %1339 to <4 x float>*
  %wide.load58.3.6 = load <4 x float>, <4 x float>* %1343, align 8, !tbaa !2, !alias.scope !12
  %1344 = fadd <4 x float> %1334, %wide.load58.3.6
  %1345 = bitcast float* %1339 to <4 x float>*
  store <4 x float> %1344, <4 x float>* %1345, align 8, !tbaa !2, !alias.scope !12
  %1346 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1338
  %1347 = bitcast float* %1346 to <4 x float>*
  %wide.load59.3.6 = load <4 x float>, <4 x float>* %1347, align 8, !tbaa !2, !alias.scope !16
  %1348 = fsub <4 x float> %wide.load59.3.6, %1337
  %1349 = bitcast float* %1331 to <4 x float>*
  store <4 x float> %1348, <4 x float>* %1349, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1350 = bitcast float* %1346 to <4 x float>*
  %wide.load60.3.6 = load <4 x float>, <4 x float>* %1350, align 8, !tbaa !2, !alias.scope !16
  %1351 = fadd <4 x float> %1337, %wide.load60.3.6
  %1352 = bitcast float* %1346 to <4 x float>*
  store <4 x float> %1351, <4 x float>* %1352, align 8, !tbaa !2, !alias.scope !16
  %index.next43.3.6 = add i64 %index.next43.2.6, 4
  %niter.nsub.3.6 = sub i64 %niter.nsub.2.6, 1
  %niter.ncmp.3.6 = icmp eq i64 %niter.nsub.3.6, 0
  br i1 %niter.ncmp.3.6, label %middle.block16.unr-lcssa.loopexit.6, label %vector.body18.6, !llvm.loop !18

middle.block16.unr-lcssa.loopexit.6:              ; preds = %vector.body18.6
  %index42.unr.ph.6 = phi i64 [ %index.next43.3.6, %vector.body18.6 ]
  br label %middle.block16.unr-lcssa.6

middle.block16.unr-lcssa.6:                       ; preds = %middle.block16.unr-lcssa.loopexit.6, %vector.ph41.6
  %index42.unr.6 = phi i64 [ 0, %vector.ph41.6 ], [ %index42.unr.ph.6, %middle.block16.unr-lcssa.loopexit.6 ]
  br i1 false, label %vector.body18.epil.preheader.6, label %middle.block16.6

vector.body18.epil.preheader.6:                   ; preds = %middle.block16.unr-lcssa.6
  br label %vector.body18.epil.6

vector.body18.epil.6:                             ; preds = %vector.body18.epil.6, %vector.body18.epil.preheader.6
  %index42.epil.6 = phi i64 [ %index42.unr.6, %vector.body18.epil.preheader.6 ], [ %index.next43.epil.6, %vector.body18.epil.6 ]
  %epil.iter.6 = phi i64 [ 0, %vector.body18.epil.preheader.6 ], [ %epil.iter.sub.6, %vector.body18.epil.6 ]
  %1353 = trunc i64 %index42.epil.6 to i32
  %1354 = add i32 %add13.us.i.6, %1353
  %1355 = sext i32 %1354 to i64
  %1356 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1355
  %1357 = bitcast float* %1356 to <4 x float>*
  %wide.load.epil.6 = load <4 x float>, <4 x float>* %1357, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1358 = fmul <4 x float> %broadcast.splat53.6, %wide.load.epil.6
  %1359 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1355
  %1360 = bitcast float* %1359 to <4 x float>*
  %wide.load54.epil.6 = load <4 x float>, <4 x float>* %1360, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1361 = fmul <4 x float> %broadcast.splat56.6, %wide.load54.epil.6
  %1362 = fsub <4 x float> %1358, %1361
  %1363 = fmul <4 x float> %broadcast.splat56.6, %wide.load.epil.6
  %1364 = fmul <4 x float> %broadcast.splat53.6, %wide.load54.epil.6
  %1365 = fadd <4 x float> %1363, %1364
  %1366 = add nuw nsw i64 %index42.epil.6, %1237
  %1367 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1366
  %1368 = bitcast float* %1367 to <4 x float>*
  %wide.load57.epil.6 = load <4 x float>, <4 x float>* %1368, align 8, !tbaa !2, !alias.scope !12
  %1369 = fsub <4 x float> %wide.load57.epil.6, %1362
  %1370 = bitcast float* %1356 to <4 x float>*
  store <4 x float> %1369, <4 x float>* %1370, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1371 = bitcast float* %1367 to <4 x float>*
  %wide.load58.epil.6 = load <4 x float>, <4 x float>* %1371, align 8, !tbaa !2, !alias.scope !12
  %1372 = fadd <4 x float> %1362, %wide.load58.epil.6
  %1373 = bitcast float* %1367 to <4 x float>*
  store <4 x float> %1372, <4 x float>* %1373, align 8, !tbaa !2, !alias.scope !12
  %1374 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1366
  %1375 = bitcast float* %1374 to <4 x float>*
  %wide.load59.epil.6 = load <4 x float>, <4 x float>* %1375, align 8, !tbaa !2, !alias.scope !16
  %1376 = fsub <4 x float> %wide.load59.epil.6, %1365
  %1377 = bitcast float* %1359 to <4 x float>*
  store <4 x float> %1376, <4 x float>* %1377, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1378 = bitcast float* %1374 to <4 x float>*
  %wide.load60.epil.6 = load <4 x float>, <4 x float>* %1378, align 8, !tbaa !2, !alias.scope !16
  %1379 = fadd <4 x float> %1365, %wide.load60.epil.6
  %1380 = bitcast float* %1374 to <4 x float>*
  store <4 x float> %1379, <4 x float>* %1380, align 8, !tbaa !2, !alias.scope !16
  %index.next43.epil.6 = add i64 %index42.epil.6, 4
  %epil.iter.sub.6 = sub i64 %epil.iter.6, 1
  %epil.iter.cmp.6 = icmp ne i64 %epil.iter.sub.6, 0
  br i1 %epil.iter.cmp.6, label %vector.body18.epil.6, label %middle.block16.epilog-lcssa.6, !llvm.loop !22

middle.block16.epilog-lcssa.6:                    ; preds = %vector.body18.epil.6
  br label %middle.block16.6

middle.block16.6:                                 ; preds = %middle.block16.epilog-lcssa.6, %middle.block16.unr-lcssa.6
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.i.6, label %for.body11.us.i.preheader.6

for.body11.us.i.preheader.6:                      ; preds = %middle.block16.6, %vector.memcheck.6, %vector.scevcheck.6, %for.body3.us.i.6
  br i1 true, label %for.body11.us.i.prol.preheader.6, label %for.body11.us.i.prol.loopexit.6

for.body11.us.i.prol.preheader.6:                 ; preds = %for.body11.us.i.preheader.6
  br label %for.body11.us.i.prol.6

for.body11.us.i.prol.6:                           ; preds = %for.body11.us.i.prol.6, %for.body11.us.i.prol.preheader.6
  %indvars.iv.i.prol.6 = phi i64 [ %indvars.iv.next.i.prol.6, %for.body11.us.i.prol.6 ], [ 0, %for.body11.us.i.prol.preheader.6 ]
  %prol.iter.6 = phi i64 [ 2, %for.body11.us.i.prol.preheader.6 ], [ %prol.iter.sub.6, %for.body11.us.i.prol.6 ]
  %1381 = trunc i64 %indvars.iv.i.prol.6 to i32
  %add14.us.i.prol.6 = add i32 %add13.us.i.6, %1381
  %idxprom15.us.i.prol.6 = sext i32 %add14.us.i.prol.6 to i64
  %arrayidx16.us.i.prol.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.prol.6
  %1382 = load float, float* %arrayidx16.us.i.prol.6, align 4, !tbaa !2
  %mul17.us.i.prol.6 = fmul float %1234, %1382
  %arrayidx23.us.i.prol.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.prol.6
  %1383 = load float, float* %arrayidx23.us.i.prol.6, align 4, !tbaa !2
  %mul24.us.i.prol.6 = fmul float %1235, %1383
  %sub25.us.i.prol.6 = fsub float %mul17.us.i.prol.6, %mul24.us.i.prol.6
  %mul32.us.i.prol.6 = fmul float %1235, %1382
  %mul39.us.i.prol.6 = fmul float %1234, %1383
  %add40.us.i.prol.6 = fadd float %mul32.us.i.prol.6, %mul39.us.i.prol.6
  %1384 = add nuw nsw i64 %indvars.iv.i.prol.6, %1237
  %arrayidx45.us.i.prol.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1384
  %1385 = load float, float* %arrayidx45.us.i.prol.6, align 4, !tbaa !2
  %sub46.us.i.prol.6 = fsub float %1385, %sub25.us.i.prol.6
  store float %sub46.us.i.prol.6, float* %arrayidx16.us.i.prol.6, align 4, !tbaa !2
  %1386 = load float, float* %arrayidx45.us.i.prol.6, align 4, !tbaa !2
  %add58.us.i.prol.6 = fadd float %sub25.us.i.prol.6, %1386
  store float %add58.us.i.prol.6, float* %arrayidx45.us.i.prol.6, align 4, !tbaa !2
  %arrayidx63.us.i.prol.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1384
  %1387 = load float, float* %arrayidx63.us.i.prol.6, align 4, !tbaa !2
  %sub64.us.i.prol.6 = fsub float %1387, %add40.us.i.prol.6
  store float %sub64.us.i.prol.6, float* %arrayidx23.us.i.prol.6, align 4, !tbaa !2
  %1388 = load float, float* %arrayidx63.us.i.prol.6, align 4, !tbaa !2
  %add76.us.i.prol.6 = fadd float %add40.us.i.prol.6, %1388
  store float %add76.us.i.prol.6, float* %arrayidx63.us.i.prol.6, align 4, !tbaa !2
  %indvars.iv.next.i.prol.6 = add nuw nsw i64 %indvars.iv.i.prol.6, 1
  %prol.iter.sub.6 = sub i64 %prol.iter.6, 1
  %prol.iter.cmp.6 = icmp ne i64 %prol.iter.sub.6, 0
  br i1 %prol.iter.cmp.6, label %for.body11.us.i.prol.6, label %for.body11.us.i.prol.loopexit.unr-lcssa.6, !llvm.loop !23

for.body11.us.i.prol.loopexit.unr-lcssa.6:        ; preds = %for.body11.us.i.prol.6
  %indvars.iv.i.unr.ph.6 = phi i64 [ %indvars.iv.next.i.prol.6, %for.body11.us.i.prol.6 ]
  br label %for.body11.us.i.prol.loopexit.6

for.body11.us.i.prol.loopexit.6:                  ; preds = %for.body11.us.i.prol.loopexit.unr-lcssa.6, %for.body11.us.i.preheader.6
  %indvars.iv.i.unr.6 = phi i64 [ 0, %for.body11.us.i.preheader.6 ], [ %indvars.iv.i.unr.ph.6, %for.body11.us.i.prol.loopexit.unr-lcssa.6 ]
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.6, label %for.body11.us.i.preheader.new.6

for.body11.us.i.preheader.new.6:                  ; preds = %for.body11.us.i.prol.loopexit.6
  br label %for.body11.us.i.6

for.body11.us.i.6:                                ; preds = %for.body11.us.i.6, %for.body11.us.i.preheader.new.6
  %indvars.iv.i.6 = phi i64 [ %indvars.iv.i.unr.6, %for.body11.us.i.preheader.new.6 ], [ %indvars.iv.next.i.3.6, %for.body11.us.i.6 ]
  %1389 = trunc i64 %indvars.iv.i.6 to i32
  %add14.us.i.6 = add i32 %add13.us.i.6, %1389
  %idxprom15.us.i.6 = sext i32 %add14.us.i.6 to i64
  %arrayidx16.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.6
  %1390 = load float, float* %arrayidx16.us.i.6, align 4, !tbaa !2
  %mul17.us.i.6 = fmul float %1234, %1390
  %arrayidx23.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.6
  %1391 = load float, float* %arrayidx23.us.i.6, align 4, !tbaa !2
  %mul24.us.i.6 = fmul float %1235, %1391
  %sub25.us.i.6 = fsub float %mul17.us.i.6, %mul24.us.i.6
  %mul32.us.i.6 = fmul float %1235, %1390
  %mul39.us.i.6 = fmul float %1234, %1391
  %add40.us.i.6 = fadd float %mul32.us.i.6, %mul39.us.i.6
  %1392 = add nuw nsw i64 %indvars.iv.i.6, %1237
  %arrayidx45.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1392
  %1393 = load float, float* %arrayidx45.us.i.6, align 4, !tbaa !2
  %sub46.us.i.6 = fsub float %1393, %sub25.us.i.6
  store float %sub46.us.i.6, float* %arrayidx16.us.i.6, align 4, !tbaa !2
  %1394 = load float, float* %arrayidx45.us.i.6, align 4, !tbaa !2
  %add58.us.i.6 = fadd float %sub25.us.i.6, %1394
  store float %add58.us.i.6, float* %arrayidx45.us.i.6, align 4, !tbaa !2
  %arrayidx63.us.i.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1392
  %1395 = load float, float* %arrayidx63.us.i.6, align 4, !tbaa !2
  %sub64.us.i.6 = fsub float %1395, %add40.us.i.6
  store float %sub64.us.i.6, float* %arrayidx23.us.i.6, align 4, !tbaa !2
  %1396 = load float, float* %arrayidx63.us.i.6, align 4, !tbaa !2
  %add76.us.i.6 = fadd float %add40.us.i.6, %1396
  store float %add76.us.i.6, float* %arrayidx63.us.i.6, align 4, !tbaa !2
  %indvars.iv.next.i.6 = add nuw nsw i64 %indvars.iv.i.6, 1
  %1397 = trunc i64 %indvars.iv.next.i.6 to i32
  %add14.us.i.1.6 = add i32 %add13.us.i.6, %1397
  %idxprom15.us.i.1.6 = sext i32 %add14.us.i.1.6 to i64
  %arrayidx16.us.i.1.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.6
  %1398 = load float, float* %arrayidx16.us.i.1.6, align 4, !tbaa !2
  %mul17.us.i.1.6 = fmul float %1234, %1398
  %arrayidx23.us.i.1.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.6
  %1399 = load float, float* %arrayidx23.us.i.1.6, align 4, !tbaa !2
  %mul24.us.i.1.6 = fmul float %1235, %1399
  %sub25.us.i.1.6 = fsub float %mul17.us.i.1.6, %mul24.us.i.1.6
  %mul32.us.i.1.6 = fmul float %1235, %1398
  %mul39.us.i.1.6 = fmul float %1234, %1399
  %add40.us.i.1.6 = fadd float %mul32.us.i.1.6, %mul39.us.i.1.6
  %1400 = add nuw nsw i64 %indvars.iv.next.i.6, %1237
  %arrayidx45.us.i.1.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1400
  %1401 = load float, float* %arrayidx45.us.i.1.6, align 4, !tbaa !2
  %sub46.us.i.1.6 = fsub float %1401, %sub25.us.i.1.6
  store float %sub46.us.i.1.6, float* %arrayidx16.us.i.1.6, align 4, !tbaa !2
  %1402 = load float, float* %arrayidx45.us.i.1.6, align 4, !tbaa !2
  %add58.us.i.1.6 = fadd float %sub25.us.i.1.6, %1402
  store float %add58.us.i.1.6, float* %arrayidx45.us.i.1.6, align 4, !tbaa !2
  %arrayidx63.us.i.1.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1400
  %1403 = load float, float* %arrayidx63.us.i.1.6, align 4, !tbaa !2
  %sub64.us.i.1.6 = fsub float %1403, %add40.us.i.1.6
  store float %sub64.us.i.1.6, float* %arrayidx23.us.i.1.6, align 4, !tbaa !2
  %1404 = load float, float* %arrayidx63.us.i.1.6, align 4, !tbaa !2
  %add76.us.i.1.6 = fadd float %add40.us.i.1.6, %1404
  store float %add76.us.i.1.6, float* %arrayidx63.us.i.1.6, align 4, !tbaa !2
  %indvars.iv.next.i.1.6 = add nuw nsw i64 %indvars.iv.next.i.6, 1
  %1405 = trunc i64 %indvars.iv.next.i.1.6 to i32
  %add14.us.i.2.6 = add i32 %add13.us.i.6, %1405
  %idxprom15.us.i.2.6 = sext i32 %add14.us.i.2.6 to i64
  %arrayidx16.us.i.2.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.6
  %1406 = load float, float* %arrayidx16.us.i.2.6, align 4, !tbaa !2
  %mul17.us.i.2.6 = fmul float %1234, %1406
  %arrayidx23.us.i.2.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.6
  %1407 = load float, float* %arrayidx23.us.i.2.6, align 4, !tbaa !2
  %mul24.us.i.2.6 = fmul float %1235, %1407
  %sub25.us.i.2.6 = fsub float %mul17.us.i.2.6, %mul24.us.i.2.6
  %mul32.us.i.2.6 = fmul float %1235, %1406
  %mul39.us.i.2.6 = fmul float %1234, %1407
  %add40.us.i.2.6 = fadd float %mul32.us.i.2.6, %mul39.us.i.2.6
  %1408 = add nuw nsw i64 %indvars.iv.next.i.1.6, %1237
  %arrayidx45.us.i.2.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1408
  %1409 = load float, float* %arrayidx45.us.i.2.6, align 4, !tbaa !2
  %sub46.us.i.2.6 = fsub float %1409, %sub25.us.i.2.6
  store float %sub46.us.i.2.6, float* %arrayidx16.us.i.2.6, align 4, !tbaa !2
  %1410 = load float, float* %arrayidx45.us.i.2.6, align 4, !tbaa !2
  %add58.us.i.2.6 = fadd float %sub25.us.i.2.6, %1410
  store float %add58.us.i.2.6, float* %arrayidx45.us.i.2.6, align 4, !tbaa !2
  %arrayidx63.us.i.2.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1408
  %1411 = load float, float* %arrayidx63.us.i.2.6, align 4, !tbaa !2
  %sub64.us.i.2.6 = fsub float %1411, %add40.us.i.2.6
  store float %sub64.us.i.2.6, float* %arrayidx23.us.i.2.6, align 4, !tbaa !2
  %1412 = load float, float* %arrayidx63.us.i.2.6, align 4, !tbaa !2
  %add76.us.i.2.6 = fadd float %add40.us.i.2.6, %1412
  store float %add76.us.i.2.6, float* %arrayidx63.us.i.2.6, align 4, !tbaa !2
  %indvars.iv.next.i.2.6 = add nuw nsw i64 %indvars.iv.next.i.1.6, 1
  %1413 = trunc i64 %indvars.iv.next.i.2.6 to i32
  %add14.us.i.3.6 = add i32 %add13.us.i.6, %1413
  %idxprom15.us.i.3.6 = sext i32 %add14.us.i.3.6 to i64
  %arrayidx16.us.i.3.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.6
  %1414 = load float, float* %arrayidx16.us.i.3.6, align 4, !tbaa !2
  %mul17.us.i.3.6 = fmul float %1234, %1414
  %arrayidx23.us.i.3.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.6
  %1415 = load float, float* %arrayidx23.us.i.3.6, align 4, !tbaa !2
  %mul24.us.i.3.6 = fmul float %1235, %1415
  %sub25.us.i.3.6 = fsub float %mul17.us.i.3.6, %mul24.us.i.3.6
  %mul32.us.i.3.6 = fmul float %1235, %1414
  %mul39.us.i.3.6 = fmul float %1234, %1415
  %add40.us.i.3.6 = fadd float %mul32.us.i.3.6, %mul39.us.i.3.6
  %1416 = add nuw nsw i64 %indvars.iv.next.i.2.6, %1237
  %arrayidx45.us.i.3.6 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1416
  %1417 = load float, float* %arrayidx45.us.i.3.6, align 4, !tbaa !2
  %sub46.us.i.3.6 = fsub float %1417, %sub25.us.i.3.6
  store float %sub46.us.i.3.6, float* %arrayidx16.us.i.3.6, align 4, !tbaa !2
  %1418 = load float, float* %arrayidx45.us.i.3.6, align 4, !tbaa !2
  %add58.us.i.3.6 = fadd float %sub25.us.i.3.6, %1418
  store float %add58.us.i.3.6, float* %arrayidx45.us.i.3.6, align 4, !tbaa !2
  %arrayidx63.us.i.3.6 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1416
  %1419 = load float, float* %arrayidx63.us.i.3.6, align 4, !tbaa !2
  %sub64.us.i.3.6 = fsub float %1419, %add40.us.i.3.6
  store float %sub64.us.i.3.6, float* %arrayidx23.us.i.3.6, align 4, !tbaa !2
  %1420 = load float, float* %arrayidx63.us.i.3.6, align 4, !tbaa !2
  %add76.us.i.3.6 = fadd float %add40.us.i.3.6, %1420
  store float %add76.us.i.3.6, float* %arrayidx63.us.i.3.6, align 4, !tbaa !2
  %indvars.iv.next.i.3.6 = add nuw nsw i64 %indvars.iv.next.i.2.6, 1
  %exitcond.i.3.6 = icmp eq i64 %indvars.iv.next.i.3.6, 2
  br i1 %exitcond.i.3.6, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.6, label %for.body11.us.i.6, !llvm.loop !24

for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.6: ; preds = %for.body11.us.i.6
  br label %for.cond9.for.inc77_crit_edge.us.i.loopexit.6

for.cond9.for.inc77_crit_edge.us.i.loopexit.6:    ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.6, %for.body11.us.i.prol.loopexit.6
  br label %for.cond9.for.inc77_crit_edge.us.i.6

for.cond9.for.inc77_crit_edge.us.i.6:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.6, %middle.block16.6
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
  %1421 = trunc i64 %indvars.iv162.i.7 to i32
  %1422 = mul i32 2, %1421
  %1423 = add i32 1, %1422
  %1424 = sext i32 %1423 to i64
  %scevgep.7 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %1424
  %scevgep23.7 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_real, i64 0, i64 1), i64 %1424
  %1425 = mul i64 2, %indvars.iv162.i.7
  %scevgep25.7 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %1425
  %1426 = add i64 %1425, 1
  %scevgep27.7 = getelementptr [256 x float], [256 x float]* @data_real, i64 0, i64 %1426
  %scevgep29.7 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %1424
  %scevgep32.7 = getelementptr float, float* getelementptr inbounds ([256 x float], [256 x float]* @data_imag, i64 0, i64 1), i64 %1424
  %scevgep34.7 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %1425
  %scevgep36.7 = getelementptr [256 x float], [256 x float]* @data_imag, i64 0, i64 %1426
  %1427 = trunc i64 %indvars.iv162.i.7 to i32
  %1428 = mul i32 2, %1427
  %1429 = add i32 1, %1428
  %1430 = add nsw i64 %indvars.iv162.i.7, 127
  %arrayidx.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @coef_real, i64 0, i64 %1430
  %1431 = load float, float* %arrayidx.us.i.7, align 4, !tbaa !2
  %arrayidx8.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @coef_imag, i64 0, i64 %1430
  %1432 = load float, float* %arrayidx8.us.i.7, align 4, !tbaa !2
  %1433 = shl nuw nsw i64 %indvars.iv162.i.7, 1
  %1434 = trunc i64 %1433 to i32
  %add13.us.i.7 = add i32 1, %1434
  br i1 true, label %for.body11.us.i.preheader.7, label %vector.scevcheck.7

vector.scevcheck.7:                               ; preds = %for.body3.us.i.7
  br i1 false, label %for.body11.us.i.preheader.7, label %vector.memcheck.7

vector.memcheck.7:                                ; preds = %vector.scevcheck.7
  %bound0.7 = icmp ult float* %scevgep.7, %scevgep27.7
  %bound1.7 = icmp ult float* %scevgep25.7, %scevgep23.7
  %found.conflict.7 = and i1 %bound0.7, %bound1.7
  %bound038.7 = icmp ult float* %scevgep29.7, %scevgep36.7
  %bound139.7 = icmp ult float* %scevgep34.7, %scevgep32.7
  %found.conflict40.7 = and i1 %bound038.7, %bound139.7
  %conflict.rdx.7 = or i1 %found.conflict.7, %found.conflict40.7
  br i1 %conflict.rdx.7, label %for.body11.us.i.preheader.7, label %vector.ph41.7

vector.ph41.7:                                    ; preds = %vector.memcheck.7
  %broadcast.splatinsert52.7 = insertelement <4 x float> undef, float %1431, i32 0
  %broadcast.splat53.7 = shufflevector <4 x float> %broadcast.splatinsert52.7, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert55.7 = insertelement <4 x float> undef, float %1432, i32 0
  %broadcast.splat56.7 = shufflevector <4 x float> %broadcast.splatinsert55.7, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block16.unr-lcssa.7, label %vector.ph41.new.7

vector.ph41.new.7:                                ; preds = %vector.ph41.7
  br label %vector.body18.7

vector.body18.7:                                  ; preds = %vector.body18.7, %vector.ph41.new.7
  %index42.7 = phi i64 [ 0, %vector.ph41.new.7 ], [ %index.next43.3.7, %vector.body18.7 ]
  %niter.7 = phi i64 [ 4611686018427387904, %vector.ph41.new.7 ], [ %niter.nsub.3.7, %vector.body18.7 ]
  %1435 = trunc i64 %index42.7 to i32
  %1436 = add i32 %add13.us.i.7, %1435
  %1437 = sext i32 %1436 to i64
  %1438 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1437
  %1439 = bitcast float* %1438 to <4 x float>*
  %wide.load.7 = load <4 x float>, <4 x float>* %1439, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1440 = fmul <4 x float> %broadcast.splat53.7, %wide.load.7
  %1441 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1437
  %1442 = bitcast float* %1441 to <4 x float>*
  %wide.load54.7 = load <4 x float>, <4 x float>* %1442, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1443 = fmul <4 x float> %broadcast.splat56.7, %wide.load54.7
  %1444 = fsub <4 x float> %1440, %1443
  %1445 = fmul <4 x float> %broadcast.splat56.7, %wide.load.7
  %1446 = fmul <4 x float> %broadcast.splat53.7, %wide.load54.7
  %1447 = fadd <4 x float> %1445, %1446
  %1448 = add nuw nsw i64 %index42.7, %1433
  %1449 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1448
  %1450 = bitcast float* %1449 to <4 x float>*
  %wide.load57.7 = load <4 x float>, <4 x float>* %1450, align 8, !tbaa !2, !alias.scope !12
  %1451 = fsub <4 x float> %wide.load57.7, %1444
  %1452 = bitcast float* %1438 to <4 x float>*
  store <4 x float> %1451, <4 x float>* %1452, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1453 = bitcast float* %1449 to <4 x float>*
  %wide.load58.7 = load <4 x float>, <4 x float>* %1453, align 8, !tbaa !2, !alias.scope !12
  %1454 = fadd <4 x float> %1444, %wide.load58.7
  %1455 = bitcast float* %1449 to <4 x float>*
  store <4 x float> %1454, <4 x float>* %1455, align 8, !tbaa !2, !alias.scope !12
  %1456 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1448
  %1457 = bitcast float* %1456 to <4 x float>*
  %wide.load59.7 = load <4 x float>, <4 x float>* %1457, align 8, !tbaa !2, !alias.scope !16
  %1458 = fsub <4 x float> %wide.load59.7, %1447
  %1459 = bitcast float* %1441 to <4 x float>*
  store <4 x float> %1458, <4 x float>* %1459, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1460 = bitcast float* %1456 to <4 x float>*
  %wide.load60.7 = load <4 x float>, <4 x float>* %1460, align 8, !tbaa !2, !alias.scope !16
  %1461 = fadd <4 x float> %1447, %wide.load60.7
  %1462 = bitcast float* %1456 to <4 x float>*
  store <4 x float> %1461, <4 x float>* %1462, align 8, !tbaa !2, !alias.scope !16
  %index.next43.7 = add nuw nsw i64 %index42.7, 4
  %niter.nsub.7 = sub i64 %niter.7, 1
  %1463 = trunc i64 %index.next43.7 to i32
  %1464 = add i32 %add13.us.i.7, %1463
  %1465 = sext i32 %1464 to i64
  %1466 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1465
  %1467 = bitcast float* %1466 to <4 x float>*
  %wide.load.1.7 = load <4 x float>, <4 x float>* %1467, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1468 = fmul <4 x float> %broadcast.splat53.7, %wide.load.1.7
  %1469 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1465
  %1470 = bitcast float* %1469 to <4 x float>*
  %wide.load54.1.7 = load <4 x float>, <4 x float>* %1470, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1471 = fmul <4 x float> %broadcast.splat56.7, %wide.load54.1.7
  %1472 = fsub <4 x float> %1468, %1471
  %1473 = fmul <4 x float> %broadcast.splat56.7, %wide.load.1.7
  %1474 = fmul <4 x float> %broadcast.splat53.7, %wide.load54.1.7
  %1475 = fadd <4 x float> %1473, %1474
  %1476 = add nuw nsw i64 %index.next43.7, %1433
  %1477 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1476
  %1478 = bitcast float* %1477 to <4 x float>*
  %wide.load57.1.7 = load <4 x float>, <4 x float>* %1478, align 8, !tbaa !2, !alias.scope !12
  %1479 = fsub <4 x float> %wide.load57.1.7, %1472
  %1480 = bitcast float* %1466 to <4 x float>*
  store <4 x float> %1479, <4 x float>* %1480, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1481 = bitcast float* %1477 to <4 x float>*
  %wide.load58.1.7 = load <4 x float>, <4 x float>* %1481, align 8, !tbaa !2, !alias.scope !12
  %1482 = fadd <4 x float> %1472, %wide.load58.1.7
  %1483 = bitcast float* %1477 to <4 x float>*
  store <4 x float> %1482, <4 x float>* %1483, align 8, !tbaa !2, !alias.scope !12
  %1484 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1476
  %1485 = bitcast float* %1484 to <4 x float>*
  %wide.load59.1.7 = load <4 x float>, <4 x float>* %1485, align 8, !tbaa !2, !alias.scope !16
  %1486 = fsub <4 x float> %wide.load59.1.7, %1475
  %1487 = bitcast float* %1469 to <4 x float>*
  store <4 x float> %1486, <4 x float>* %1487, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1488 = bitcast float* %1484 to <4 x float>*
  %wide.load60.1.7 = load <4 x float>, <4 x float>* %1488, align 8, !tbaa !2, !alias.scope !16
  %1489 = fadd <4 x float> %1475, %wide.load60.1.7
  %1490 = bitcast float* %1484 to <4 x float>*
  store <4 x float> %1489, <4 x float>* %1490, align 8, !tbaa !2, !alias.scope !16
  %index.next43.1.7 = add nuw nsw i64 %index.next43.7, 4
  %niter.nsub.1.7 = sub i64 %niter.nsub.7, 1
  %1491 = trunc i64 %index.next43.1.7 to i32
  %1492 = add i32 %add13.us.i.7, %1491
  %1493 = sext i32 %1492 to i64
  %1494 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1493
  %1495 = bitcast float* %1494 to <4 x float>*
  %wide.load.2.7 = load <4 x float>, <4 x float>* %1495, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1496 = fmul <4 x float> %broadcast.splat53.7, %wide.load.2.7
  %1497 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1493
  %1498 = bitcast float* %1497 to <4 x float>*
  %wide.load54.2.7 = load <4 x float>, <4 x float>* %1498, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1499 = fmul <4 x float> %broadcast.splat56.7, %wide.load54.2.7
  %1500 = fsub <4 x float> %1496, %1499
  %1501 = fmul <4 x float> %broadcast.splat56.7, %wide.load.2.7
  %1502 = fmul <4 x float> %broadcast.splat53.7, %wide.load54.2.7
  %1503 = fadd <4 x float> %1501, %1502
  %1504 = add nuw nsw i64 %index.next43.1.7, %1433
  %1505 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1504
  %1506 = bitcast float* %1505 to <4 x float>*
  %wide.load57.2.7 = load <4 x float>, <4 x float>* %1506, align 8, !tbaa !2, !alias.scope !12
  %1507 = fsub <4 x float> %wide.load57.2.7, %1500
  %1508 = bitcast float* %1494 to <4 x float>*
  store <4 x float> %1507, <4 x float>* %1508, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1509 = bitcast float* %1505 to <4 x float>*
  %wide.load58.2.7 = load <4 x float>, <4 x float>* %1509, align 8, !tbaa !2, !alias.scope !12
  %1510 = fadd <4 x float> %1500, %wide.load58.2.7
  %1511 = bitcast float* %1505 to <4 x float>*
  store <4 x float> %1510, <4 x float>* %1511, align 8, !tbaa !2, !alias.scope !12
  %1512 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1504
  %1513 = bitcast float* %1512 to <4 x float>*
  %wide.load59.2.7 = load <4 x float>, <4 x float>* %1513, align 8, !tbaa !2, !alias.scope !16
  %1514 = fsub <4 x float> %wide.load59.2.7, %1503
  %1515 = bitcast float* %1497 to <4 x float>*
  store <4 x float> %1514, <4 x float>* %1515, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1516 = bitcast float* %1512 to <4 x float>*
  %wide.load60.2.7 = load <4 x float>, <4 x float>* %1516, align 8, !tbaa !2, !alias.scope !16
  %1517 = fadd <4 x float> %1503, %wide.load60.2.7
  %1518 = bitcast float* %1512 to <4 x float>*
  store <4 x float> %1517, <4 x float>* %1518, align 8, !tbaa !2, !alias.scope !16
  %index.next43.2.7 = add nuw nsw i64 %index.next43.1.7, 4
  %niter.nsub.2.7 = sub i64 %niter.nsub.1.7, 1
  %1519 = trunc i64 %index.next43.2.7 to i32
  %1520 = add i32 %add13.us.i.7, %1519
  %1521 = sext i32 %1520 to i64
  %1522 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1521
  %1523 = bitcast float* %1522 to <4 x float>*
  %wide.load.3.7 = load <4 x float>, <4 x float>* %1523, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1524 = fmul <4 x float> %broadcast.splat53.7, %wide.load.3.7
  %1525 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1521
  %1526 = bitcast float* %1525 to <4 x float>*
  %wide.load54.3.7 = load <4 x float>, <4 x float>* %1526, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1527 = fmul <4 x float> %broadcast.splat56.7, %wide.load54.3.7
  %1528 = fsub <4 x float> %1524, %1527
  %1529 = fmul <4 x float> %broadcast.splat56.7, %wide.load.3.7
  %1530 = fmul <4 x float> %broadcast.splat53.7, %wide.load54.3.7
  %1531 = fadd <4 x float> %1529, %1530
  %1532 = add nuw nsw i64 %index.next43.2.7, %1433
  %1533 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1532
  %1534 = bitcast float* %1533 to <4 x float>*
  %wide.load57.3.7 = load <4 x float>, <4 x float>* %1534, align 8, !tbaa !2, !alias.scope !12
  %1535 = fsub <4 x float> %wide.load57.3.7, %1528
  %1536 = bitcast float* %1522 to <4 x float>*
  store <4 x float> %1535, <4 x float>* %1536, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1537 = bitcast float* %1533 to <4 x float>*
  %wide.load58.3.7 = load <4 x float>, <4 x float>* %1537, align 8, !tbaa !2, !alias.scope !12
  %1538 = fadd <4 x float> %1528, %wide.load58.3.7
  %1539 = bitcast float* %1533 to <4 x float>*
  store <4 x float> %1538, <4 x float>* %1539, align 8, !tbaa !2, !alias.scope !12
  %1540 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1532
  %1541 = bitcast float* %1540 to <4 x float>*
  %wide.load59.3.7 = load <4 x float>, <4 x float>* %1541, align 8, !tbaa !2, !alias.scope !16
  %1542 = fsub <4 x float> %wide.load59.3.7, %1531
  %1543 = bitcast float* %1525 to <4 x float>*
  store <4 x float> %1542, <4 x float>* %1543, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1544 = bitcast float* %1540 to <4 x float>*
  %wide.load60.3.7 = load <4 x float>, <4 x float>* %1544, align 8, !tbaa !2, !alias.scope !16
  %1545 = fadd <4 x float> %1531, %wide.load60.3.7
  %1546 = bitcast float* %1540 to <4 x float>*
  store <4 x float> %1545, <4 x float>* %1546, align 8, !tbaa !2, !alias.scope !16
  %index.next43.3.7 = add i64 %index.next43.2.7, 4
  %niter.nsub.3.7 = sub i64 %niter.nsub.2.7, 1
  %niter.ncmp.3.7 = icmp eq i64 %niter.nsub.3.7, 0
  br i1 %niter.ncmp.3.7, label %middle.block16.unr-lcssa.loopexit.7, label %vector.body18.7, !llvm.loop !18

middle.block16.unr-lcssa.loopexit.7:              ; preds = %vector.body18.7
  %index42.unr.ph.7 = phi i64 [ %index.next43.3.7, %vector.body18.7 ]
  br label %middle.block16.unr-lcssa.7

middle.block16.unr-lcssa.7:                       ; preds = %middle.block16.unr-lcssa.loopexit.7, %vector.ph41.7
  %index42.unr.7 = phi i64 [ 0, %vector.ph41.7 ], [ %index42.unr.ph.7, %middle.block16.unr-lcssa.loopexit.7 ]
  br i1 false, label %vector.body18.epil.preheader.7, label %middle.block16.7

vector.body18.epil.preheader.7:                   ; preds = %middle.block16.unr-lcssa.7
  br label %vector.body18.epil.7

vector.body18.epil.7:                             ; preds = %vector.body18.epil.7, %vector.body18.epil.preheader.7
  %index42.epil.7 = phi i64 [ %index42.unr.7, %vector.body18.epil.preheader.7 ], [ %index.next43.epil.7, %vector.body18.epil.7 ]
  %epil.iter.7 = phi i64 [ 0, %vector.body18.epil.preheader.7 ], [ %epil.iter.sub.7, %vector.body18.epil.7 ]
  %1547 = trunc i64 %index42.epil.7 to i32
  %1548 = add i32 %add13.us.i.7, %1547
  %1549 = sext i32 %1548 to i64
  %1550 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1549
  %1551 = bitcast float* %1550 to <4 x float>*
  %wide.load.epil.7 = load <4 x float>, <4 x float>* %1551, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1552 = fmul <4 x float> %broadcast.splat53.7, %wide.load.epil.7
  %1553 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1549
  %1554 = bitcast float* %1553 to <4 x float>*
  %wide.load54.epil.7 = load <4 x float>, <4 x float>* %1554, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1555 = fmul <4 x float> %broadcast.splat56.7, %wide.load54.epil.7
  %1556 = fsub <4 x float> %1552, %1555
  %1557 = fmul <4 x float> %broadcast.splat56.7, %wide.load.epil.7
  %1558 = fmul <4 x float> %broadcast.splat53.7, %wide.load54.epil.7
  %1559 = fadd <4 x float> %1557, %1558
  %1560 = add nuw nsw i64 %index42.epil.7, %1433
  %1561 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1560
  %1562 = bitcast float* %1561 to <4 x float>*
  %wide.load57.epil.7 = load <4 x float>, <4 x float>* %1562, align 8, !tbaa !2, !alias.scope !12
  %1563 = fsub <4 x float> %wide.load57.epil.7, %1556
  %1564 = bitcast float* %1550 to <4 x float>*
  store <4 x float> %1563, <4 x float>* %1564, align 4, !tbaa !2, !alias.scope !9, !noalias !12
  %1565 = bitcast float* %1561 to <4 x float>*
  %wide.load58.epil.7 = load <4 x float>, <4 x float>* %1565, align 8, !tbaa !2, !alias.scope !12
  %1566 = fadd <4 x float> %1556, %wide.load58.epil.7
  %1567 = bitcast float* %1561 to <4 x float>*
  store <4 x float> %1566, <4 x float>* %1567, align 8, !tbaa !2, !alias.scope !12
  %1568 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1560
  %1569 = bitcast float* %1568 to <4 x float>*
  %wide.load59.epil.7 = load <4 x float>, <4 x float>* %1569, align 8, !tbaa !2, !alias.scope !16
  %1570 = fsub <4 x float> %wide.load59.epil.7, %1559
  %1571 = bitcast float* %1553 to <4 x float>*
  store <4 x float> %1570, <4 x float>* %1571, align 4, !tbaa !2, !alias.scope !14, !noalias !16
  %1572 = bitcast float* %1568 to <4 x float>*
  %wide.load60.epil.7 = load <4 x float>, <4 x float>* %1572, align 8, !tbaa !2, !alias.scope !16
  %1573 = fadd <4 x float> %1559, %wide.load60.epil.7
  %1574 = bitcast float* %1568 to <4 x float>*
  store <4 x float> %1573, <4 x float>* %1574, align 8, !tbaa !2, !alias.scope !16
  %index.next43.epil.7 = add i64 %index42.epil.7, 4
  %epil.iter.sub.7 = sub i64 %epil.iter.7, 1
  %epil.iter.cmp.7 = icmp ne i64 %epil.iter.sub.7, 0
  br i1 %epil.iter.cmp.7, label %vector.body18.epil.7, label %middle.block16.epilog-lcssa.7, !llvm.loop !22

middle.block16.epilog-lcssa.7:                    ; preds = %vector.body18.epil.7
  br label %middle.block16.7

middle.block16.7:                                 ; preds = %middle.block16.epilog-lcssa.7, %middle.block16.unr-lcssa.7
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.i.7, label %for.body11.us.i.preheader.7

for.body11.us.i.preheader.7:                      ; preds = %middle.block16.7, %vector.memcheck.7, %vector.scevcheck.7, %for.body3.us.i.7
  br i1 true, label %for.body11.us.i.prol.preheader.7, label %for.body11.us.i.prol.loopexit.7

for.body11.us.i.prol.preheader.7:                 ; preds = %for.body11.us.i.preheader.7
  br label %for.body11.us.i.prol.7

for.body11.us.i.prol.7:                           ; preds = %for.body11.us.i.prol.7, %for.body11.us.i.prol.preheader.7
  %indvars.iv.i.prol.7 = phi i64 [ %indvars.iv.next.i.prol.7, %for.body11.us.i.prol.7 ], [ 0, %for.body11.us.i.prol.preheader.7 ]
  %prol.iter.7 = phi i64 [ 1, %for.body11.us.i.prol.preheader.7 ], [ %prol.iter.sub.7, %for.body11.us.i.prol.7 ]
  %1575 = trunc i64 %indvars.iv.i.prol.7 to i32
  %add14.us.i.prol.7 = add i32 %add13.us.i.7, %1575
  %idxprom15.us.i.prol.7 = sext i32 %add14.us.i.prol.7 to i64
  %arrayidx16.us.i.prol.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.prol.7
  %1576 = load float, float* %arrayidx16.us.i.prol.7, align 4, !tbaa !2
  %mul17.us.i.prol.7 = fmul float %1431, %1576
  %arrayidx23.us.i.prol.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.prol.7
  %1577 = load float, float* %arrayidx23.us.i.prol.7, align 4, !tbaa !2
  %mul24.us.i.prol.7 = fmul float %1432, %1577
  %sub25.us.i.prol.7 = fsub float %mul17.us.i.prol.7, %mul24.us.i.prol.7
  %mul32.us.i.prol.7 = fmul float %1432, %1576
  %mul39.us.i.prol.7 = fmul float %1431, %1577
  %add40.us.i.prol.7 = fadd float %mul32.us.i.prol.7, %mul39.us.i.prol.7
  %1578 = add nuw nsw i64 %indvars.iv.i.prol.7, %1433
  %arrayidx45.us.i.prol.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1578
  %1579 = load float, float* %arrayidx45.us.i.prol.7, align 4, !tbaa !2
  %sub46.us.i.prol.7 = fsub float %1579, %sub25.us.i.prol.7
  store float %sub46.us.i.prol.7, float* %arrayidx16.us.i.prol.7, align 4, !tbaa !2
  %1580 = load float, float* %arrayidx45.us.i.prol.7, align 4, !tbaa !2
  %add58.us.i.prol.7 = fadd float %sub25.us.i.prol.7, %1580
  store float %add58.us.i.prol.7, float* %arrayidx45.us.i.prol.7, align 4, !tbaa !2
  %arrayidx63.us.i.prol.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1578
  %1581 = load float, float* %arrayidx63.us.i.prol.7, align 4, !tbaa !2
  %sub64.us.i.prol.7 = fsub float %1581, %add40.us.i.prol.7
  store float %sub64.us.i.prol.7, float* %arrayidx23.us.i.prol.7, align 4, !tbaa !2
  %1582 = load float, float* %arrayidx63.us.i.prol.7, align 4, !tbaa !2
  %add76.us.i.prol.7 = fadd float %add40.us.i.prol.7, %1582
  store float %add76.us.i.prol.7, float* %arrayidx63.us.i.prol.7, align 4, !tbaa !2
  %indvars.iv.next.i.prol.7 = add nuw nsw i64 %indvars.iv.i.prol.7, 1
  %prol.iter.sub.7 = sub i64 %prol.iter.7, 1
  %prol.iter.cmp.7 = icmp ne i64 %prol.iter.sub.7, 0
  br i1 %prol.iter.cmp.7, label %for.body11.us.i.prol.7, label %for.body11.us.i.prol.loopexit.unr-lcssa.7, !llvm.loop !23

for.body11.us.i.prol.loopexit.unr-lcssa.7:        ; preds = %for.body11.us.i.prol.7
  %indvars.iv.i.unr.ph.7 = phi i64 [ %indvars.iv.next.i.prol.7, %for.body11.us.i.prol.7 ]
  br label %for.body11.us.i.prol.loopexit.7

for.body11.us.i.prol.loopexit.7:                  ; preds = %for.body11.us.i.prol.loopexit.unr-lcssa.7, %for.body11.us.i.preheader.7
  %indvars.iv.i.unr.7 = phi i64 [ 0, %for.body11.us.i.preheader.7 ], [ %indvars.iv.i.unr.ph.7, %for.body11.us.i.prol.loopexit.unr-lcssa.7 ]
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.7, label %for.body11.us.i.preheader.new.7

for.body11.us.i.preheader.new.7:                  ; preds = %for.body11.us.i.prol.loopexit.7
  br label %for.body11.us.i.7

for.body11.us.i.7:                                ; preds = %for.body11.us.i.7, %for.body11.us.i.preheader.new.7
  %indvars.iv.i.7 = phi i64 [ %indvars.iv.i.unr.7, %for.body11.us.i.preheader.new.7 ], [ %indvars.iv.next.i.3.7, %for.body11.us.i.7 ]
  %1583 = trunc i64 %indvars.iv.i.7 to i32
  %add14.us.i.7 = add i32 %add13.us.i.7, %1583
  %idxprom15.us.i.7 = sext i32 %add14.us.i.7 to i64
  %arrayidx16.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.7
  %1584 = load float, float* %arrayidx16.us.i.7, align 4, !tbaa !2
  %mul17.us.i.7 = fmul float %1431, %1584
  %arrayidx23.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.7
  %1585 = load float, float* %arrayidx23.us.i.7, align 4, !tbaa !2
  %mul24.us.i.7 = fmul float %1432, %1585
  %sub25.us.i.7 = fsub float %mul17.us.i.7, %mul24.us.i.7
  %mul32.us.i.7 = fmul float %1432, %1584
  %mul39.us.i.7 = fmul float %1431, %1585
  %add40.us.i.7 = fadd float %mul32.us.i.7, %mul39.us.i.7
  %1586 = add nuw nsw i64 %indvars.iv.i.7, %1433
  %arrayidx45.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1586
  %1587 = load float, float* %arrayidx45.us.i.7, align 4, !tbaa !2
  %sub46.us.i.7 = fsub float %1587, %sub25.us.i.7
  store float %sub46.us.i.7, float* %arrayidx16.us.i.7, align 4, !tbaa !2
  %1588 = load float, float* %arrayidx45.us.i.7, align 4, !tbaa !2
  %add58.us.i.7 = fadd float %sub25.us.i.7, %1588
  store float %add58.us.i.7, float* %arrayidx45.us.i.7, align 4, !tbaa !2
  %arrayidx63.us.i.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1586
  %1589 = load float, float* %arrayidx63.us.i.7, align 4, !tbaa !2
  %sub64.us.i.7 = fsub float %1589, %add40.us.i.7
  store float %sub64.us.i.7, float* %arrayidx23.us.i.7, align 4, !tbaa !2
  %1590 = load float, float* %arrayidx63.us.i.7, align 4, !tbaa !2
  %add76.us.i.7 = fadd float %add40.us.i.7, %1590
  store float %add76.us.i.7, float* %arrayidx63.us.i.7, align 4, !tbaa !2
  %indvars.iv.next.i.7 = add nuw nsw i64 %indvars.iv.i.7, 1
  %1591 = trunc i64 %indvars.iv.next.i.7 to i32
  %add14.us.i.1.7 = add i32 %add13.us.i.7, %1591
  %idxprom15.us.i.1.7 = sext i32 %add14.us.i.1.7 to i64
  %arrayidx16.us.i.1.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.1.7
  %1592 = load float, float* %arrayidx16.us.i.1.7, align 4, !tbaa !2
  %mul17.us.i.1.7 = fmul float %1431, %1592
  %arrayidx23.us.i.1.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.1.7
  %1593 = load float, float* %arrayidx23.us.i.1.7, align 4, !tbaa !2
  %mul24.us.i.1.7 = fmul float %1432, %1593
  %sub25.us.i.1.7 = fsub float %mul17.us.i.1.7, %mul24.us.i.1.7
  %mul32.us.i.1.7 = fmul float %1432, %1592
  %mul39.us.i.1.7 = fmul float %1431, %1593
  %add40.us.i.1.7 = fadd float %mul32.us.i.1.7, %mul39.us.i.1.7
  %1594 = add nuw nsw i64 %indvars.iv.next.i.7, %1433
  %arrayidx45.us.i.1.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1594
  %1595 = load float, float* %arrayidx45.us.i.1.7, align 4, !tbaa !2
  %sub46.us.i.1.7 = fsub float %1595, %sub25.us.i.1.7
  store float %sub46.us.i.1.7, float* %arrayidx16.us.i.1.7, align 4, !tbaa !2
  %1596 = load float, float* %arrayidx45.us.i.1.7, align 4, !tbaa !2
  %add58.us.i.1.7 = fadd float %sub25.us.i.1.7, %1596
  store float %add58.us.i.1.7, float* %arrayidx45.us.i.1.7, align 4, !tbaa !2
  %arrayidx63.us.i.1.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1594
  %1597 = load float, float* %arrayidx63.us.i.1.7, align 4, !tbaa !2
  %sub64.us.i.1.7 = fsub float %1597, %add40.us.i.1.7
  store float %sub64.us.i.1.7, float* %arrayidx23.us.i.1.7, align 4, !tbaa !2
  %1598 = load float, float* %arrayidx63.us.i.1.7, align 4, !tbaa !2
  %add76.us.i.1.7 = fadd float %add40.us.i.1.7, %1598
  store float %add76.us.i.1.7, float* %arrayidx63.us.i.1.7, align 4, !tbaa !2
  %indvars.iv.next.i.1.7 = add nuw nsw i64 %indvars.iv.next.i.7, 1
  %1599 = trunc i64 %indvars.iv.next.i.1.7 to i32
  %add14.us.i.2.7 = add i32 %add13.us.i.7, %1599
  %idxprom15.us.i.2.7 = sext i32 %add14.us.i.2.7 to i64
  %arrayidx16.us.i.2.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.2.7
  %1600 = load float, float* %arrayidx16.us.i.2.7, align 4, !tbaa !2
  %mul17.us.i.2.7 = fmul float %1431, %1600
  %arrayidx23.us.i.2.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.2.7
  %1601 = load float, float* %arrayidx23.us.i.2.7, align 4, !tbaa !2
  %mul24.us.i.2.7 = fmul float %1432, %1601
  %sub25.us.i.2.7 = fsub float %mul17.us.i.2.7, %mul24.us.i.2.7
  %mul32.us.i.2.7 = fmul float %1432, %1600
  %mul39.us.i.2.7 = fmul float %1431, %1601
  %add40.us.i.2.7 = fadd float %mul32.us.i.2.7, %mul39.us.i.2.7
  %1602 = add nuw nsw i64 %indvars.iv.next.i.1.7, %1433
  %arrayidx45.us.i.2.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1602
  %1603 = load float, float* %arrayidx45.us.i.2.7, align 4, !tbaa !2
  %sub46.us.i.2.7 = fsub float %1603, %sub25.us.i.2.7
  store float %sub46.us.i.2.7, float* %arrayidx16.us.i.2.7, align 4, !tbaa !2
  %1604 = load float, float* %arrayidx45.us.i.2.7, align 4, !tbaa !2
  %add58.us.i.2.7 = fadd float %sub25.us.i.2.7, %1604
  store float %add58.us.i.2.7, float* %arrayidx45.us.i.2.7, align 4, !tbaa !2
  %arrayidx63.us.i.2.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1602
  %1605 = load float, float* %arrayidx63.us.i.2.7, align 4, !tbaa !2
  %sub64.us.i.2.7 = fsub float %1605, %add40.us.i.2.7
  store float %sub64.us.i.2.7, float* %arrayidx23.us.i.2.7, align 4, !tbaa !2
  %1606 = load float, float* %arrayidx63.us.i.2.7, align 4, !tbaa !2
  %add76.us.i.2.7 = fadd float %add40.us.i.2.7, %1606
  store float %add76.us.i.2.7, float* %arrayidx63.us.i.2.7, align 4, !tbaa !2
  %indvars.iv.next.i.2.7 = add nuw nsw i64 %indvars.iv.next.i.1.7, 1
  %1607 = trunc i64 %indvars.iv.next.i.2.7 to i32
  %add14.us.i.3.7 = add i32 %add13.us.i.7, %1607
  %idxprom15.us.i.3.7 = sext i32 %add14.us.i.3.7 to i64
  %arrayidx16.us.i.3.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %idxprom15.us.i.3.7
  %1608 = load float, float* %arrayidx16.us.i.3.7, align 4, !tbaa !2
  %mul17.us.i.3.7 = fmul float %1431, %1608
  %arrayidx23.us.i.3.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %idxprom15.us.i.3.7
  %1609 = load float, float* %arrayidx23.us.i.3.7, align 4, !tbaa !2
  %mul24.us.i.3.7 = fmul float %1432, %1609
  %sub25.us.i.3.7 = fsub float %mul17.us.i.3.7, %mul24.us.i.3.7
  %mul32.us.i.3.7 = fmul float %1432, %1608
  %mul39.us.i.3.7 = fmul float %1431, %1609
  %add40.us.i.3.7 = fadd float %mul32.us.i.3.7, %mul39.us.i.3.7
  %1610 = add nuw nsw i64 %indvars.iv.next.i.2.7, %1433
  %arrayidx45.us.i.3.7 = getelementptr inbounds [256 x float], [256 x float]* @data_real, i64 0, i64 %1610
  %1611 = load float, float* %arrayidx45.us.i.3.7, align 4, !tbaa !2
  %sub46.us.i.3.7 = fsub float %1611, %sub25.us.i.3.7
  store float %sub46.us.i.3.7, float* %arrayidx16.us.i.3.7, align 4, !tbaa !2
  %1612 = load float, float* %arrayidx45.us.i.3.7, align 4, !tbaa !2
  %add58.us.i.3.7 = fadd float %sub25.us.i.3.7, %1612
  store float %add58.us.i.3.7, float* %arrayidx45.us.i.3.7, align 4, !tbaa !2
  %arrayidx63.us.i.3.7 = getelementptr inbounds [256 x float], [256 x float]* @data_imag, i64 0, i64 %1610
  %1613 = load float, float* %arrayidx63.us.i.3.7, align 4, !tbaa !2
  %sub64.us.i.3.7 = fsub float %1613, %add40.us.i.3.7
  store float %sub64.us.i.3.7, float* %arrayidx23.us.i.3.7, align 4, !tbaa !2
  %1614 = load float, float* %arrayidx63.us.i.3.7, align 4, !tbaa !2
  %add76.us.i.3.7 = fadd float %add40.us.i.3.7, %1614
  store float %add76.us.i.3.7, float* %arrayidx63.us.i.3.7, align 4, !tbaa !2
  %indvars.iv.next.i.3.7 = add nuw nsw i64 %indvars.iv.next.i.2.7, 1
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.7, label %for.body11.us.i.7, !llvm.loop !24

for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.7: ; preds = %for.body11.us.i.7
  br label %for.cond9.for.inc77_crit_edge.us.i.loopexit.7

for.cond9.for.inc77_crit_edge.us.i.loopexit.7:    ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.unr-lcssa.7, %for.body11.us.i.prol.loopexit.7
  br label %for.cond9.for.inc77_crit_edge.us.i.7

for.cond9.for.inc77_crit_edge.us.i.7:             ; preds = %for.cond9.for.inc77_crit_edge.us.i.loopexit.7, %middle.block16.7
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
  %scevgep171 = getelementptr float, float* %data_real, i64 128
  %scevgep180 = getelementptr float, float* %data_imag, i64 128
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond9.for.inc77_crit_edge.us, %for.body3.us.preheader
  %indvars.iv162 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next163, %for.cond9.for.inc77_crit_edge.us ]
  %0 = trunc i64 %indvars.iv162 to i32
  %1 = mul i32 256, %0
  %2 = add i32 128, %1
  %3 = sext i32 %2 to i64
  %scevgep = getelementptr float, float* %data_real, i64 %3
  %scevgep172 = getelementptr float, float* %scevgep171, i64 %3
  %4 = mul i64 256, %indvars.iv162
  %scevgep174 = getelementptr float, float* %data_real, i64 %4
  %5 = add i64 %4, 128
  %scevgep176 = getelementptr float, float* %data_real, i64 %5
  %scevgep178 = getelementptr float, float* %data_imag, i64 %3
  %scevgep181 = getelementptr float, float* %scevgep180, i64 %3
  %scevgep183 = getelementptr float, float* %data_imag, i64 %4
  %scevgep185 = getelementptr float, float* %data_imag, i64 %5
  %6 = trunc i64 %indvars.iv162 to i32
  %7 = mul i32 256, %6
  %8 = add i32 128, %7
  %arrayidx.us = getelementptr inbounds float, float* %coef_real, i64 %indvars.iv162
  %9 = load float, float* %arrayidx.us, align 4, !tbaa !2
  %arrayidx8.us = getelementptr inbounds float, float* %coef_imag, i64 %indvars.iv162
  %10 = load float, float* %arrayidx8.us, align 4, !tbaa !2
  %11 = shl nuw nsw i64 %indvars.iv162, 1
  %12 = mul nsw i64 %11, 128
  %13 = trunc i64 %12 to i32
  br i1 false, label %for.body11.us.preheader, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %for.body3.us
  %14 = add i32 %8, 127
  %15 = icmp slt i32 %14, %8
  br i1 %15, label %for.body11.us.preheader, label %vector.memcheck

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
  %broadcast.splatinsert209 = insertelement <4 x float> undef, float %9, i32 0
  %broadcast.splat210 = shufflevector <4 x float> %broadcast.splatinsert209, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert212 = insertelement <4 x float> undef, float %10, i32 0
  %broadcast.splat213 = shufflevector <4 x float> %broadcast.splatinsert212, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.3, %vector.body ]
  %niter = phi i64 [ 32, %vector.ph.new ], [ %niter.nsub.3, %vector.body ]
  %16 = trunc i64 %index to i32
  %17 = add i32 %16, %13
  %18 = add i32 %17, 128
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %data_real, i64 %19
  %21 = bitcast float* %20 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %21, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %22 = fmul <4 x float> %broadcast.splat210, %wide.load
  %23 = getelementptr inbounds float, float* %data_imag, i64 %19
  %24 = bitcast float* %23 to <4 x float>*
  %wide.load211 = load <4 x float>, <4 x float>* %24, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %25 = fmul <4 x float> %broadcast.splat213, %wide.load211
  %26 = fsub <4 x float> %22, %25
  %27 = fmul <4 x float> %broadcast.splat213, %wide.load
  %28 = fmul <4 x float> %broadcast.splat210, %wide.load211
  %29 = fadd <4 x float> %27, %28
  %30 = add nuw nsw i64 %index, %12
  %31 = getelementptr inbounds float, float* %data_real, i64 %30
  %32 = bitcast float* %31 to <4 x float>*
  %wide.load214 = load <4 x float>, <4 x float>* %32, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %33 = fsub <4 x float> %wide.load214, %26
  %34 = bitcast float* %20 to <4 x float>*
  store <4 x float> %33, <4 x float>* %34, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %35 = bitcast float* %31 to <4 x float>*
  %wide.load215 = load <4 x float>, <4 x float>* %35, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %36 = fadd <4 x float> %26, %wide.load215
  %37 = bitcast float* %31 to <4 x float>*
  store <4 x float> %36, <4 x float>* %37, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %38 = getelementptr inbounds float, float* %data_imag, i64 %30
  %39 = bitcast float* %38 to <4 x float>*
  %wide.load216 = load <4 x float>, <4 x float>* %39, align 4, !tbaa !2, !alias.scope !33
  %40 = fsub <4 x float> %wide.load216, %29
  %41 = bitcast float* %23 to <4 x float>*
  store <4 x float> %40, <4 x float>* %41, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %42 = bitcast float* %38 to <4 x float>*
  %wide.load217 = load <4 x float>, <4 x float>* %42, align 4, !tbaa !2, !alias.scope !33
  %43 = fadd <4 x float> %29, %wide.load217
  %44 = bitcast float* %38 to <4 x float>*
  store <4 x float> %43, <4 x float>* %44, align 4, !tbaa !2, !alias.scope !33
  %index.next = add nuw nsw i64 %index, 4
  %niter.nsub = sub i64 %niter, 1
  %45 = trunc i64 %index.next to i32
  %46 = add i32 %45, %13
  %47 = add i32 %46, 128
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float* %data_real, i64 %48
  %50 = bitcast float* %49 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %50, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %51 = fmul <4 x float> %broadcast.splat210, %wide.load.1
  %52 = getelementptr inbounds float, float* %data_imag, i64 %48
  %53 = bitcast float* %52 to <4 x float>*
  %wide.load211.1 = load <4 x float>, <4 x float>* %53, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %54 = fmul <4 x float> %broadcast.splat213, %wide.load211.1
  %55 = fsub <4 x float> %51, %54
  %56 = fmul <4 x float> %broadcast.splat213, %wide.load.1
  %57 = fmul <4 x float> %broadcast.splat210, %wide.load211.1
  %58 = fadd <4 x float> %56, %57
  %59 = add nuw nsw i64 %index.next, %12
  %60 = getelementptr inbounds float, float* %data_real, i64 %59
  %61 = bitcast float* %60 to <4 x float>*
  %wide.load214.1 = load <4 x float>, <4 x float>* %61, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %62 = fsub <4 x float> %wide.load214.1, %55
  %63 = bitcast float* %49 to <4 x float>*
  store <4 x float> %62, <4 x float>* %63, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %64 = bitcast float* %60 to <4 x float>*
  %wide.load215.1 = load <4 x float>, <4 x float>* %64, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %65 = fadd <4 x float> %55, %wide.load215.1
  %66 = bitcast float* %60 to <4 x float>*
  store <4 x float> %65, <4 x float>* %66, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %67 = getelementptr inbounds float, float* %data_imag, i64 %59
  %68 = bitcast float* %67 to <4 x float>*
  %wide.load216.1 = load <4 x float>, <4 x float>* %68, align 4, !tbaa !2, !alias.scope !33
  %69 = fsub <4 x float> %wide.load216.1, %58
  %70 = bitcast float* %52 to <4 x float>*
  store <4 x float> %69, <4 x float>* %70, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %71 = bitcast float* %67 to <4 x float>*
  %wide.load217.1 = load <4 x float>, <4 x float>* %71, align 4, !tbaa !2, !alias.scope !33
  %72 = fadd <4 x float> %58, %wide.load217.1
  %73 = bitcast float* %67 to <4 x float>*
  store <4 x float> %72, <4 x float>* %73, align 4, !tbaa !2, !alias.scope !33
  %index.next.1 = add nuw nsw i64 %index.next, 4
  %niter.nsub.1 = sub i64 %niter.nsub, 1
  %74 = trunc i64 %index.next.1 to i32
  %75 = add i32 %74, %13
  %76 = add i32 %75, 128
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float* %data_real, i64 %77
  %79 = bitcast float* %78 to <4 x float>*
  %wide.load.2 = load <4 x float>, <4 x float>* %79, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %80 = fmul <4 x float> %broadcast.splat210, %wide.load.2
  %81 = getelementptr inbounds float, float* %data_imag, i64 %77
  %82 = bitcast float* %81 to <4 x float>*
  %wide.load211.2 = load <4 x float>, <4 x float>* %82, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %83 = fmul <4 x float> %broadcast.splat213, %wide.load211.2
  %84 = fsub <4 x float> %80, %83
  %85 = fmul <4 x float> %broadcast.splat213, %wide.load.2
  %86 = fmul <4 x float> %broadcast.splat210, %wide.load211.2
  %87 = fadd <4 x float> %85, %86
  %88 = add nuw nsw i64 %index.next.1, %12
  %89 = getelementptr inbounds float, float* %data_real, i64 %88
  %90 = bitcast float* %89 to <4 x float>*
  %wide.load214.2 = load <4 x float>, <4 x float>* %90, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %91 = fsub <4 x float> %wide.load214.2, %84
  %92 = bitcast float* %78 to <4 x float>*
  store <4 x float> %91, <4 x float>* %92, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %93 = bitcast float* %89 to <4 x float>*
  %wide.load215.2 = load <4 x float>, <4 x float>* %93, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %94 = fadd <4 x float> %84, %wide.load215.2
  %95 = bitcast float* %89 to <4 x float>*
  store <4 x float> %94, <4 x float>* %95, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %96 = getelementptr inbounds float, float* %data_imag, i64 %88
  %97 = bitcast float* %96 to <4 x float>*
  %wide.load216.2 = load <4 x float>, <4 x float>* %97, align 4, !tbaa !2, !alias.scope !33
  %98 = fsub <4 x float> %wide.load216.2, %87
  %99 = bitcast float* %81 to <4 x float>*
  store <4 x float> %98, <4 x float>* %99, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %100 = bitcast float* %96 to <4 x float>*
  %wide.load217.2 = load <4 x float>, <4 x float>* %100, align 4, !tbaa !2, !alias.scope !33
  %101 = fadd <4 x float> %87, %wide.load217.2
  %102 = bitcast float* %96 to <4 x float>*
  store <4 x float> %101, <4 x float>* %102, align 4, !tbaa !2, !alias.scope !33
  %index.next.2 = add nuw nsw i64 %index.next.1, 4
  %niter.nsub.2 = sub i64 %niter.nsub.1, 1
  %103 = trunc i64 %index.next.2 to i32
  %104 = add i32 %103, %13
  %105 = add i32 %104, 128
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float* %data_real, i64 %106
  %108 = bitcast float* %107 to <4 x float>*
  %wide.load.3 = load <4 x float>, <4 x float>* %108, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %109 = fmul <4 x float> %broadcast.splat210, %wide.load.3
  %110 = getelementptr inbounds float, float* %data_imag, i64 %106
  %111 = bitcast float* %110 to <4 x float>*
  %wide.load211.3 = load <4 x float>, <4 x float>* %111, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %112 = fmul <4 x float> %broadcast.splat213, %wide.load211.3
  %113 = fsub <4 x float> %109, %112
  %114 = fmul <4 x float> %broadcast.splat213, %wide.load.3
  %115 = fmul <4 x float> %broadcast.splat210, %wide.load211.3
  %116 = fadd <4 x float> %114, %115
  %117 = add nuw nsw i64 %index.next.2, %12
  %118 = getelementptr inbounds float, float* %data_real, i64 %117
  %119 = bitcast float* %118 to <4 x float>*
  %wide.load214.3 = load <4 x float>, <4 x float>* %119, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %120 = fsub <4 x float> %wide.load214.3, %113
  %121 = bitcast float* %107 to <4 x float>*
  store <4 x float> %120, <4 x float>* %121, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %122 = bitcast float* %118 to <4 x float>*
  %wide.load215.3 = load <4 x float>, <4 x float>* %122, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %123 = fadd <4 x float> %113, %wide.load215.3
  %124 = bitcast float* %118 to <4 x float>*
  store <4 x float> %123, <4 x float>* %124, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %125 = getelementptr inbounds float, float* %data_imag, i64 %117
  %126 = bitcast float* %125 to <4 x float>*
  %wide.load216.3 = load <4 x float>, <4 x float>* %126, align 4, !tbaa !2, !alias.scope !33
  %127 = fsub <4 x float> %wide.load216.3, %116
  %128 = bitcast float* %110 to <4 x float>*
  store <4 x float> %127, <4 x float>* %128, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %129 = bitcast float* %125 to <4 x float>*
  %wide.load217.3 = load <4 x float>, <4 x float>* %129, align 4, !tbaa !2, !alias.scope !33
  %130 = fadd <4 x float> %116, %wide.load217.3
  %131 = bitcast float* %125 to <4 x float>*
  store <4 x float> %130, <4 x float>* %131, align 4, !tbaa !2, !alias.scope !33
  %index.next.3 = add i64 %index.next.2, 4
  %niter.nsub.3 = sub i64 %niter.nsub.2, 1
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %middle.block.unr-lcssa.loopexit, label %vector.body, !llvm.loop !36

middle.block.unr-lcssa.loopexit:                  ; preds = %vector.body
  %index.unr.ph = phi i64 [ %index.next.3, %vector.body ]
  br label %middle.block.unr-lcssa

middle.block.unr-lcssa:                           ; preds = %middle.block.unr-lcssa.loopexit, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.unr.ph, %middle.block.unr-lcssa.loopexit ]
  br i1 false, label %vector.body.epil.preheader, label %middle.block

vector.body.epil.preheader:                       ; preds = %middle.block.unr-lcssa
  br label %vector.body.epil

vector.body.epil:                                 ; preds = %vector.body.epil, %vector.body.epil.preheader
  %index.epil = phi i64 [ %index.unr, %vector.body.epil.preheader ], [ %index.next.epil, %vector.body.epil ]
  %epil.iter = phi i64 [ 0, %vector.body.epil.preheader ], [ %epil.iter.sub, %vector.body.epil ]
  %132 = trunc i64 %index.epil to i32
  %133 = add i32 %132, %13
  %134 = add i32 %133, 128
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float* %data_real, i64 %135
  %137 = bitcast float* %136 to <4 x float>*
  %wide.load.epil = load <4 x float>, <4 x float>* %137, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %138 = fmul <4 x float> %broadcast.splat210, %wide.load.epil
  %139 = getelementptr inbounds float, float* %data_imag, i64 %135
  %140 = bitcast float* %139 to <4 x float>*
  %wide.load211.epil = load <4 x float>, <4 x float>* %140, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %141 = fmul <4 x float> %broadcast.splat213, %wide.load211.epil
  %142 = fsub <4 x float> %138, %141
  %143 = fmul <4 x float> %broadcast.splat213, %wide.load.epil
  %144 = fmul <4 x float> %broadcast.splat210, %wide.load211.epil
  %145 = fadd <4 x float> %143, %144
  %146 = add nuw nsw i64 %index.epil, %12
  %147 = getelementptr inbounds float, float* %data_real, i64 %146
  %148 = bitcast float* %147 to <4 x float>*
  %wide.load214.epil = load <4 x float>, <4 x float>* %148, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %149 = fsub <4 x float> %wide.load214.epil, %142
  %150 = bitcast float* %136 to <4 x float>*
  store <4 x float> %149, <4 x float>* %150, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %151 = bitcast float* %147 to <4 x float>*
  %wide.load215.epil = load <4 x float>, <4 x float>* %151, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %152 = fadd <4 x float> %142, %wide.load215.epil
  %153 = bitcast float* %147 to <4 x float>*
  store <4 x float> %152, <4 x float>* %153, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %154 = getelementptr inbounds float, float* %data_imag, i64 %146
  %155 = bitcast float* %154 to <4 x float>*
  %wide.load216.epil = load <4 x float>, <4 x float>* %155, align 4, !tbaa !2, !alias.scope !33
  %156 = fsub <4 x float> %wide.load216.epil, %145
  %157 = bitcast float* %139 to <4 x float>*
  store <4 x float> %156, <4 x float>* %157, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %158 = bitcast float* %154 to <4 x float>*
  %wide.load217.epil = load <4 x float>, <4 x float>* %158, align 4, !tbaa !2, !alias.scope !33
  %159 = fadd <4 x float> %145, %wide.load217.epil
  %160 = bitcast float* %154 to <4 x float>*
  store <4 x float> %159, <4 x float>* %160, align 4, !tbaa !2, !alias.scope !33
  %index.next.epil = add i64 %index.epil, 4
  %epil.iter.sub = sub i64 %epil.iter, 1
  %epil.iter.cmp = icmp ne i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %vector.body.epil, label %middle.block.epilog-lcssa, !llvm.loop !37

middle.block.epilog-lcssa:                        ; preds = %vector.body.epil
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %middle.block.epilog-lcssa
  br i1 true, label %for.cond9.for.inc77_crit_edge.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %vector.scevcheck, %for.body3.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %vector.scevcheck ], [ 0, %for.body3.us ], [ 128, %middle.block ]
  %161 = sub i64 128, %indvars.iv.ph
  %162 = sub i64 127, %indvars.iv.ph
  br i1 false, label %for.body11.us.prol.preheader, label %for.body11.us.prol.loopexit

for.body11.us.prol.preheader:                     ; preds = %for.body11.us.preheader
  br label %for.body11.us.prol

for.body11.us.prol:                               ; preds = %for.body11.us.prol, %for.body11.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body11.us.prol ], [ %indvars.iv.ph, %for.body11.us.prol.preheader ]
  %prol.iter = phi i64 [ 0, %for.body11.us.prol.preheader ], [ %prol.iter.sub, %for.body11.us.prol ]
  %163 = trunc i64 %indvars.iv.prol to i32
  %add13.us.prol = add i32 %163, %13
  %add14.us.prol = add i32 %add13.us.prol, 128
  %idxprom15.us.prol = sext i32 %add14.us.prol to i64
  %arrayidx16.us.prol = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.prol
  %164 = load float, float* %arrayidx16.us.prol, align 4, !tbaa !2
  %mul17.us.prol = fmul float %9, %164
  %arrayidx23.us.prol = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.prol
  %165 = load float, float* %arrayidx23.us.prol, align 4, !tbaa !2
  %mul24.us.prol = fmul float %10, %165
  %sub25.us.prol = fsub float %mul17.us.prol, %mul24.us.prol
  %mul32.us.prol = fmul float %10, %164
  %mul39.us.prol = fmul float %9, %165
  %add40.us.prol = fadd float %mul32.us.prol, %mul39.us.prol
  %166 = add nuw nsw i64 %indvars.iv.prol, %12
  %arrayidx45.us.prol = getelementptr inbounds float, float* %data_real, i64 %166
  %167 = load float, float* %arrayidx45.us.prol, align 4, !tbaa !2
  %sub46.us.prol = fsub float %167, %sub25.us.prol
  store float %sub46.us.prol, float* %arrayidx16.us.prol, align 4, !tbaa !2
  %168 = load float, float* %arrayidx45.us.prol, align 4, !tbaa !2
  %add58.us.prol = fadd float %sub25.us.prol, %168
  store float %add58.us.prol, float* %arrayidx45.us.prol, align 4, !tbaa !2
  %arrayidx63.us.prol = getelementptr inbounds float, float* %data_imag, i64 %166
  %169 = load float, float* %arrayidx63.us.prol, align 4, !tbaa !2
  %sub64.us.prol = fsub float %169, %add40.us.prol
  store float %sub64.us.prol, float* %arrayidx23.us.prol, align 4, !tbaa !2
  %170 = load float, float* %arrayidx63.us.prol, align 4, !tbaa !2
  %add76.us.prol = fadd float %add40.us.prol, %170
  store float %add76.us.prol, float* %arrayidx63.us.prol, align 4, !tbaa !2
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = sub i64 %prol.iter, 1
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body11.us.prol, label %for.body11.us.prol.loopexit.unr-lcssa, !llvm.loop !38

for.body11.us.prol.loopexit.unr-lcssa:            ; preds = %for.body11.us.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body11.us.prol ]
  br label %for.body11.us.prol.loopexit

for.body11.us.prol.loopexit:                      ; preds = %for.body11.us.prol.loopexit.unr-lcssa, %for.body11.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body11.us.preheader ], [ %indvars.iv.unr.ph, %for.body11.us.prol.loopexit.unr-lcssa ]
  %171 = icmp ult i64 %162, 3
  br i1 %171, label %for.cond9.for.inc77_crit_edge.us.loopexit, label %for.body11.us.preheader.new

for.body11.us.preheader.new:                      ; preds = %for.body11.us.prol.loopexit
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us, %for.body11.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body11.us.preheader.new ], [ %indvars.iv.next.3, %for.body11.us ]
  %172 = trunc i64 %indvars.iv to i32
  %add13.us = add i32 %172, %13
  %add14.us = add i32 %add13.us, 128
  %idxprom15.us = sext i32 %add14.us to i64
  %arrayidx16.us = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us
  %173 = load float, float* %arrayidx16.us, align 4, !tbaa !2
  %mul17.us = fmul float %9, %173
  %arrayidx23.us = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us
  %174 = load float, float* %arrayidx23.us, align 4, !tbaa !2
  %mul24.us = fmul float %10, %174
  %sub25.us = fsub float %mul17.us, %mul24.us
  %mul32.us = fmul float %10, %173
  %mul39.us = fmul float %9, %174
  %add40.us = fadd float %mul32.us, %mul39.us
  %175 = add nuw nsw i64 %indvars.iv, %12
  %arrayidx45.us = getelementptr inbounds float, float* %data_real, i64 %175
  %176 = load float, float* %arrayidx45.us, align 4, !tbaa !2
  %sub46.us = fsub float %176, %sub25.us
  store float %sub46.us, float* %arrayidx16.us, align 4, !tbaa !2
  %177 = load float, float* %arrayidx45.us, align 4, !tbaa !2
  %add58.us = fadd float %sub25.us, %177
  store float %add58.us, float* %arrayidx45.us, align 4, !tbaa !2
  %arrayidx63.us = getelementptr inbounds float, float* %data_imag, i64 %175
  %178 = load float, float* %arrayidx63.us, align 4, !tbaa !2
  %sub64.us = fsub float %178, %add40.us
  store float %sub64.us, float* %arrayidx23.us, align 4, !tbaa !2
  %179 = load float, float* %arrayidx63.us, align 4, !tbaa !2
  %add76.us = fadd float %add40.us, %179
  store float %add76.us, float* %arrayidx63.us, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %180 = trunc i64 %indvars.iv.next to i32
  %add13.us.1 = add i32 %180, %13
  %add14.us.1 = add i32 %add13.us.1, 128
  %idxprom15.us.1 = sext i32 %add14.us.1 to i64
  %arrayidx16.us.1 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1
  %181 = load float, float* %arrayidx16.us.1, align 4, !tbaa !2
  %mul17.us.1 = fmul float %9, %181
  %arrayidx23.us.1 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1
  %182 = load float, float* %arrayidx23.us.1, align 4, !tbaa !2
  %mul24.us.1 = fmul float %10, %182
  %sub25.us.1 = fsub float %mul17.us.1, %mul24.us.1
  %mul32.us.1 = fmul float %10, %181
  %mul39.us.1 = fmul float %9, %182
  %add40.us.1 = fadd float %mul32.us.1, %mul39.us.1
  %183 = add nuw nsw i64 %indvars.iv.next, %12
  %arrayidx45.us.1 = getelementptr inbounds float, float* %data_real, i64 %183
  %184 = load float, float* %arrayidx45.us.1, align 4, !tbaa !2
  %sub46.us.1 = fsub float %184, %sub25.us.1
  store float %sub46.us.1, float* %arrayidx16.us.1, align 4, !tbaa !2
  %185 = load float, float* %arrayidx45.us.1, align 4, !tbaa !2
  %add58.us.1 = fadd float %sub25.us.1, %185
  store float %add58.us.1, float* %arrayidx45.us.1, align 4, !tbaa !2
  %arrayidx63.us.1 = getelementptr inbounds float, float* %data_imag, i64 %183
  %186 = load float, float* %arrayidx63.us.1, align 4, !tbaa !2
  %sub64.us.1 = fsub float %186, %add40.us.1
  store float %sub64.us.1, float* %arrayidx23.us.1, align 4, !tbaa !2
  %187 = load float, float* %arrayidx63.us.1, align 4, !tbaa !2
  %add76.us.1 = fadd float %add40.us.1, %187
  store float %add76.us.1, float* %arrayidx63.us.1, align 4, !tbaa !2
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1
  %188 = trunc i64 %indvars.iv.next.1 to i32
  %add13.us.2 = add i32 %188, %13
  %add14.us.2 = add i32 %add13.us.2, 128
  %idxprom15.us.2 = sext i32 %add14.us.2 to i64
  %arrayidx16.us.2 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2
  %189 = load float, float* %arrayidx16.us.2, align 4, !tbaa !2
  %mul17.us.2 = fmul float %9, %189
  %arrayidx23.us.2 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2
  %190 = load float, float* %arrayidx23.us.2, align 4, !tbaa !2
  %mul24.us.2 = fmul float %10, %190
  %sub25.us.2 = fsub float %mul17.us.2, %mul24.us.2
  %mul32.us.2 = fmul float %10, %189
  %mul39.us.2 = fmul float %9, %190
  %add40.us.2 = fadd float %mul32.us.2, %mul39.us.2
  %191 = add nuw nsw i64 %indvars.iv.next.1, %12
  %arrayidx45.us.2 = getelementptr inbounds float, float* %data_real, i64 %191
  %192 = load float, float* %arrayidx45.us.2, align 4, !tbaa !2
  %sub46.us.2 = fsub float %192, %sub25.us.2
  store float %sub46.us.2, float* %arrayidx16.us.2, align 4, !tbaa !2
  %193 = load float, float* %arrayidx45.us.2, align 4, !tbaa !2
  %add58.us.2 = fadd float %sub25.us.2, %193
  store float %add58.us.2, float* %arrayidx45.us.2, align 4, !tbaa !2
  %arrayidx63.us.2 = getelementptr inbounds float, float* %data_imag, i64 %191
  %194 = load float, float* %arrayidx63.us.2, align 4, !tbaa !2
  %sub64.us.2 = fsub float %194, %add40.us.2
  store float %sub64.us.2, float* %arrayidx23.us.2, align 4, !tbaa !2
  %195 = load float, float* %arrayidx63.us.2, align 4, !tbaa !2
  %add76.us.2 = fadd float %add40.us.2, %195
  store float %add76.us.2, float* %arrayidx63.us.2, align 4, !tbaa !2
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1
  %196 = trunc i64 %indvars.iv.next.2 to i32
  %add13.us.3 = add i32 %196, %13
  %add14.us.3 = add i32 %add13.us.3, 128
  %idxprom15.us.3 = sext i32 %add14.us.3 to i64
  %arrayidx16.us.3 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3
  %197 = load float, float* %arrayidx16.us.3, align 4, !tbaa !2
  %mul17.us.3 = fmul float %9, %197
  %arrayidx23.us.3 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3
  %198 = load float, float* %arrayidx23.us.3, align 4, !tbaa !2
  %mul24.us.3 = fmul float %10, %198
  %sub25.us.3 = fsub float %mul17.us.3, %mul24.us.3
  %mul32.us.3 = fmul float %10, %197
  %mul39.us.3 = fmul float %9, %198
  %add40.us.3 = fadd float %mul32.us.3, %mul39.us.3
  %199 = add nuw nsw i64 %indvars.iv.next.2, %12
  %arrayidx45.us.3 = getelementptr inbounds float, float* %data_real, i64 %199
  %200 = load float, float* %arrayidx45.us.3, align 4, !tbaa !2
  %sub46.us.3 = fsub float %200, %sub25.us.3
  store float %sub46.us.3, float* %arrayidx16.us.3, align 4, !tbaa !2
  %201 = load float, float* %arrayidx45.us.3, align 4, !tbaa !2
  %add58.us.3 = fadd float %sub25.us.3, %201
  store float %add58.us.3, float* %arrayidx45.us.3, align 4, !tbaa !2
  %arrayidx63.us.3 = getelementptr inbounds float, float* %data_imag, i64 %199
  %202 = load float, float* %arrayidx63.us.3, align 4, !tbaa !2
  %sub64.us.3 = fsub float %202, %add40.us.3
  store float %sub64.us.3, float* %arrayidx23.us.3, align 4, !tbaa !2
  %203 = load float, float* %arrayidx63.us.3, align 4, !tbaa !2
  %add76.us.3 = fadd float %add40.us.3, %203
  store float %add76.us.3, float* %arrayidx63.us.3, align 4, !tbaa !2
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 128
  br i1 %exitcond.3, label %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa, label %for.body11.us, !llvm.loop !39

for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body11.us
  br label %for.cond9.for.inc77_crit_edge.us.loopexit

for.cond9.for.inc77_crit_edge.us.loopexit:        ; preds = %for.body11.us.prol.loopexit, %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond9.for.inc77_crit_edge.us

for.cond9.for.inc77_crit_edge.us:                 ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next163, 1
  br i1 %exitcond168, label %for.end79.loopexit, label %for.body3.us

for.end79.loopexit:                               ; preds = %for.cond9.for.inc77_crit_edge.us
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.cond1.preheader
  br i1 true, label %for.body3.us.preheader.1, label %for.end79.1

for.body3.us.preheader.1:                         ; preds = %for.end79
  %scevgep171.1 = getelementptr float, float* %data_real, i64 64
  %scevgep180.1 = getelementptr float, float* %data_imag, i64 64
  br label %for.body3.us.1

for.body3.us.1:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.1, %for.body3.us.preheader.1
  %indvars.iv162.1 = phi i64 [ 0, %for.body3.us.preheader.1 ], [ %indvars.iv.next163.1, %for.cond9.for.inc77_crit_edge.us.1 ]
  %204 = trunc i64 %indvars.iv162.1 to i32
  %205 = mul i32 128, %204
  %206 = add i32 64, %205
  %207 = sext i32 %206 to i64
  %scevgep.1 = getelementptr float, float* %data_real, i64 %207
  %scevgep172.1 = getelementptr float, float* %scevgep171.1, i64 %207
  %208 = mul i64 128, %indvars.iv162.1
  %scevgep174.1 = getelementptr float, float* %data_real, i64 %208
  %209 = add i64 %208, 64
  %scevgep176.1 = getelementptr float, float* %data_real, i64 %209
  %scevgep178.1 = getelementptr float, float* %data_imag, i64 %207
  %scevgep181.1 = getelementptr float, float* %scevgep180.1, i64 %207
  %scevgep183.1 = getelementptr float, float* %data_imag, i64 %208
  %scevgep185.1 = getelementptr float, float* %data_imag, i64 %209
  %210 = trunc i64 %indvars.iv162.1 to i32
  %211 = mul i32 128, %210
  %212 = add i32 64, %211
  %213 = add nsw i64 %indvars.iv162.1, 1
  %arrayidx.us.1 = getelementptr inbounds float, float* %coef_real, i64 %213
  %214 = load float, float* %arrayidx.us.1, align 4, !tbaa !2
  %arrayidx8.us.1 = getelementptr inbounds float, float* %coef_imag, i64 %213
  %215 = load float, float* %arrayidx8.us.1, align 4, !tbaa !2
  %216 = shl nuw nsw i64 %indvars.iv162.1, 1
  %217 = mul nsw i64 %216, 64
  %218 = trunc i64 %217 to i32
  br i1 false, label %for.body11.us.preheader.1, label %vector.scevcheck.1

vector.scevcheck.1:                               ; preds = %for.body3.us.1
  %219 = add i32 %212, 63
  %220 = icmp slt i32 %219, %212
  br i1 %220, label %for.body11.us.preheader.1, label %vector.memcheck.1

vector.memcheck.1:                                ; preds = %vector.scevcheck.1
  %bound0.1 = icmp ult float* %scevgep.1, %scevgep176.1
  %bound1.1 = icmp ult float* %scevgep174.1, %scevgep172.1
  %found.conflict.1 = and i1 %bound0.1, %bound1.1
  %bound0187.1 = icmp ugt float* %scevgep180.1, %data_real
  %bound1188.1 = icmp ugt float* %scevgep171.1, %data_imag
  %found.conflict189.1 = and i1 %bound0187.1, %bound1188.1
  %conflict.rdx.1 = or i1 %found.conflict.1, %found.conflict189.1
  %bound0190.1 = icmp ult float* %scevgep.1, %scevgep185.1
  %bound1191.1 = icmp ult float* %scevgep183.1, %scevgep172.1
  %found.conflict192.1 = and i1 %bound0190.1, %bound1191.1
  %conflict.rdx193.1 = or i1 %conflict.rdx.1, %found.conflict192.1
  %bound0194.1 = icmp ult float* %scevgep174.1, %scevgep181.1
  %bound1195.1 = icmp ult float* %scevgep178.1, %scevgep176.1
  %found.conflict196.1 = and i1 %bound0194.1, %bound1195.1
  %conflict.rdx197.1 = or i1 %conflict.rdx193.1, %found.conflict196.1
  %bound0198.1 = icmp ult float* %scevgep174.1, %scevgep185.1
  %bound1199.1 = icmp ult float* %scevgep183.1, %scevgep176.1
  %found.conflict200.1 = and i1 %bound0198.1, %bound1199.1
  %conflict.rdx201.1 = or i1 %conflict.rdx197.1, %found.conflict200.1
  %bound0202.1 = icmp ult float* %scevgep178.1, %scevgep185.1
  %bound1203.1 = icmp ult float* %scevgep183.1, %scevgep181.1
  %found.conflict204.1 = and i1 %bound0202.1, %bound1203.1
  %conflict.rdx205.1 = or i1 %conflict.rdx201.1, %found.conflict204.1
  br i1 %conflict.rdx205.1, label %for.body11.us.preheader.1, label %vector.ph.1

vector.ph.1:                                      ; preds = %vector.memcheck.1
  %broadcast.splatinsert209.1 = insertelement <4 x float> undef, float %214, i32 0
  %broadcast.splat210.1 = shufflevector <4 x float> %broadcast.splatinsert209.1, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert212.1 = insertelement <4 x float> undef, float %215, i32 0
  %broadcast.splat213.1 = shufflevector <4 x float> %broadcast.splatinsert212.1, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block.unr-lcssa.1, label %vector.ph.new.1

vector.ph.new.1:                                  ; preds = %vector.ph.1
  br label %vector.body.1

vector.body.1:                                    ; preds = %vector.body.1, %vector.ph.new.1
  %index.1 = phi i64 [ 0, %vector.ph.new.1 ], [ %index.next.3.1, %vector.body.1 ]
  %niter.1 = phi i64 [ 16, %vector.ph.new.1 ], [ %niter.nsub.3.1, %vector.body.1 ]
  %221 = trunc i64 %index.1 to i32
  %222 = add i32 %221, %218
  %223 = add i32 %222, 64
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float* %data_real, i64 %224
  %226 = bitcast float* %225 to <4 x float>*
  %wide.load.13 = load <4 x float>, <4 x float>* %226, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %227 = fmul <4 x float> %broadcast.splat210.1, %wide.load.13
  %228 = getelementptr inbounds float, float* %data_imag, i64 %224
  %229 = bitcast float* %228 to <4 x float>*
  %wide.load211.14 = load <4 x float>, <4 x float>* %229, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %230 = fmul <4 x float> %broadcast.splat213.1, %wide.load211.14
  %231 = fsub <4 x float> %227, %230
  %232 = fmul <4 x float> %broadcast.splat213.1, %wide.load.13
  %233 = fmul <4 x float> %broadcast.splat210.1, %wide.load211.14
  %234 = fadd <4 x float> %232, %233
  %235 = add nuw nsw i64 %index.1, %217
  %236 = getelementptr inbounds float, float* %data_real, i64 %235
  %237 = bitcast float* %236 to <4 x float>*
  %wide.load214.15 = load <4 x float>, <4 x float>* %237, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %238 = fsub <4 x float> %wide.load214.15, %231
  %239 = bitcast float* %225 to <4 x float>*
  store <4 x float> %238, <4 x float>* %239, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %240 = bitcast float* %236 to <4 x float>*
  %wide.load215.16 = load <4 x float>, <4 x float>* %240, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %241 = fadd <4 x float> %231, %wide.load215.16
  %242 = bitcast float* %236 to <4 x float>*
  store <4 x float> %241, <4 x float>* %242, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %243 = getelementptr inbounds float, float* %data_imag, i64 %235
  %244 = bitcast float* %243 to <4 x float>*
  %wide.load216.17 = load <4 x float>, <4 x float>* %244, align 4, !tbaa !2, !alias.scope !33
  %245 = fsub <4 x float> %wide.load216.17, %234
  %246 = bitcast float* %228 to <4 x float>*
  store <4 x float> %245, <4 x float>* %246, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %247 = bitcast float* %243 to <4 x float>*
  %wide.load217.18 = load <4 x float>, <4 x float>* %247, align 4, !tbaa !2, !alias.scope !33
  %248 = fadd <4 x float> %234, %wide.load217.18
  %249 = bitcast float* %243 to <4 x float>*
  store <4 x float> %248, <4 x float>* %249, align 4, !tbaa !2, !alias.scope !33
  %index.next.19 = add nuw nsw i64 %index.1, 4
  %niter.nsub.110 = sub i64 %niter.1, 1
  %250 = trunc i64 %index.next.19 to i32
  %251 = add i32 %250, %218
  %252 = add i32 %251, 64
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds float, float* %data_real, i64 %253
  %255 = bitcast float* %254 to <4 x float>*
  %wide.load.1.1 = load <4 x float>, <4 x float>* %255, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %256 = fmul <4 x float> %broadcast.splat210.1, %wide.load.1.1
  %257 = getelementptr inbounds float, float* %data_imag, i64 %253
  %258 = bitcast float* %257 to <4 x float>*
  %wide.load211.1.1 = load <4 x float>, <4 x float>* %258, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %259 = fmul <4 x float> %broadcast.splat213.1, %wide.load211.1.1
  %260 = fsub <4 x float> %256, %259
  %261 = fmul <4 x float> %broadcast.splat213.1, %wide.load.1.1
  %262 = fmul <4 x float> %broadcast.splat210.1, %wide.load211.1.1
  %263 = fadd <4 x float> %261, %262
  %264 = add nuw nsw i64 %index.next.19, %217
  %265 = getelementptr inbounds float, float* %data_real, i64 %264
  %266 = bitcast float* %265 to <4 x float>*
  %wide.load214.1.1 = load <4 x float>, <4 x float>* %266, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %267 = fsub <4 x float> %wide.load214.1.1, %260
  %268 = bitcast float* %254 to <4 x float>*
  store <4 x float> %267, <4 x float>* %268, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %269 = bitcast float* %265 to <4 x float>*
  %wide.load215.1.1 = load <4 x float>, <4 x float>* %269, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %270 = fadd <4 x float> %260, %wide.load215.1.1
  %271 = bitcast float* %265 to <4 x float>*
  store <4 x float> %270, <4 x float>* %271, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %272 = getelementptr inbounds float, float* %data_imag, i64 %264
  %273 = bitcast float* %272 to <4 x float>*
  %wide.load216.1.1 = load <4 x float>, <4 x float>* %273, align 4, !tbaa !2, !alias.scope !33
  %274 = fsub <4 x float> %wide.load216.1.1, %263
  %275 = bitcast float* %257 to <4 x float>*
  store <4 x float> %274, <4 x float>* %275, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %276 = bitcast float* %272 to <4 x float>*
  %wide.load217.1.1 = load <4 x float>, <4 x float>* %276, align 4, !tbaa !2, !alias.scope !33
  %277 = fadd <4 x float> %263, %wide.load217.1.1
  %278 = bitcast float* %272 to <4 x float>*
  store <4 x float> %277, <4 x float>* %278, align 4, !tbaa !2, !alias.scope !33
  %index.next.1.1 = add nuw nsw i64 %index.next.19, 4
  %niter.nsub.1.1 = sub i64 %niter.nsub.110, 1
  %279 = trunc i64 %index.next.1.1 to i32
  %280 = add i32 %279, %218
  %281 = add i32 %280, 64
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds float, float* %data_real, i64 %282
  %284 = bitcast float* %283 to <4 x float>*
  %wide.load.2.1 = load <4 x float>, <4 x float>* %284, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %285 = fmul <4 x float> %broadcast.splat210.1, %wide.load.2.1
  %286 = getelementptr inbounds float, float* %data_imag, i64 %282
  %287 = bitcast float* %286 to <4 x float>*
  %wide.load211.2.1 = load <4 x float>, <4 x float>* %287, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %288 = fmul <4 x float> %broadcast.splat213.1, %wide.load211.2.1
  %289 = fsub <4 x float> %285, %288
  %290 = fmul <4 x float> %broadcast.splat213.1, %wide.load.2.1
  %291 = fmul <4 x float> %broadcast.splat210.1, %wide.load211.2.1
  %292 = fadd <4 x float> %290, %291
  %293 = add nuw nsw i64 %index.next.1.1, %217
  %294 = getelementptr inbounds float, float* %data_real, i64 %293
  %295 = bitcast float* %294 to <4 x float>*
  %wide.load214.2.1 = load <4 x float>, <4 x float>* %295, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %296 = fsub <4 x float> %wide.load214.2.1, %289
  %297 = bitcast float* %283 to <4 x float>*
  store <4 x float> %296, <4 x float>* %297, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %298 = bitcast float* %294 to <4 x float>*
  %wide.load215.2.1 = load <4 x float>, <4 x float>* %298, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %299 = fadd <4 x float> %289, %wide.load215.2.1
  %300 = bitcast float* %294 to <4 x float>*
  store <4 x float> %299, <4 x float>* %300, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %301 = getelementptr inbounds float, float* %data_imag, i64 %293
  %302 = bitcast float* %301 to <4 x float>*
  %wide.load216.2.1 = load <4 x float>, <4 x float>* %302, align 4, !tbaa !2, !alias.scope !33
  %303 = fsub <4 x float> %wide.load216.2.1, %292
  %304 = bitcast float* %286 to <4 x float>*
  store <4 x float> %303, <4 x float>* %304, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %305 = bitcast float* %301 to <4 x float>*
  %wide.load217.2.1 = load <4 x float>, <4 x float>* %305, align 4, !tbaa !2, !alias.scope !33
  %306 = fadd <4 x float> %292, %wide.load217.2.1
  %307 = bitcast float* %301 to <4 x float>*
  store <4 x float> %306, <4 x float>* %307, align 4, !tbaa !2, !alias.scope !33
  %index.next.2.1 = add nuw nsw i64 %index.next.1.1, 4
  %niter.nsub.2.1 = sub i64 %niter.nsub.1.1, 1
  %308 = trunc i64 %index.next.2.1 to i32
  %309 = add i32 %308, %218
  %310 = add i32 %309, 64
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds float, float* %data_real, i64 %311
  %313 = bitcast float* %312 to <4 x float>*
  %wide.load.3.1 = load <4 x float>, <4 x float>* %313, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %314 = fmul <4 x float> %broadcast.splat210.1, %wide.load.3.1
  %315 = getelementptr inbounds float, float* %data_imag, i64 %311
  %316 = bitcast float* %315 to <4 x float>*
  %wide.load211.3.1 = load <4 x float>, <4 x float>* %316, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %317 = fmul <4 x float> %broadcast.splat213.1, %wide.load211.3.1
  %318 = fsub <4 x float> %314, %317
  %319 = fmul <4 x float> %broadcast.splat213.1, %wide.load.3.1
  %320 = fmul <4 x float> %broadcast.splat210.1, %wide.load211.3.1
  %321 = fadd <4 x float> %319, %320
  %322 = add nuw nsw i64 %index.next.2.1, %217
  %323 = getelementptr inbounds float, float* %data_real, i64 %322
  %324 = bitcast float* %323 to <4 x float>*
  %wide.load214.3.1 = load <4 x float>, <4 x float>* %324, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %325 = fsub <4 x float> %wide.load214.3.1, %318
  %326 = bitcast float* %312 to <4 x float>*
  store <4 x float> %325, <4 x float>* %326, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %327 = bitcast float* %323 to <4 x float>*
  %wide.load215.3.1 = load <4 x float>, <4 x float>* %327, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %328 = fadd <4 x float> %318, %wide.load215.3.1
  %329 = bitcast float* %323 to <4 x float>*
  store <4 x float> %328, <4 x float>* %329, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %330 = getelementptr inbounds float, float* %data_imag, i64 %322
  %331 = bitcast float* %330 to <4 x float>*
  %wide.load216.3.1 = load <4 x float>, <4 x float>* %331, align 4, !tbaa !2, !alias.scope !33
  %332 = fsub <4 x float> %wide.load216.3.1, %321
  %333 = bitcast float* %315 to <4 x float>*
  store <4 x float> %332, <4 x float>* %333, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %334 = bitcast float* %330 to <4 x float>*
  %wide.load217.3.1 = load <4 x float>, <4 x float>* %334, align 4, !tbaa !2, !alias.scope !33
  %335 = fadd <4 x float> %321, %wide.load217.3.1
  %336 = bitcast float* %330 to <4 x float>*
  store <4 x float> %335, <4 x float>* %336, align 4, !tbaa !2, !alias.scope !33
  %index.next.3.1 = add i64 %index.next.2.1, 4
  %niter.nsub.3.1 = sub i64 %niter.nsub.2.1, 1
  %niter.ncmp.3.1 = icmp eq i64 %niter.nsub.3.1, 0
  br i1 %niter.ncmp.3.1, label %middle.block.unr-lcssa.loopexit.1, label %vector.body.1, !llvm.loop !36

middle.block.unr-lcssa.loopexit.1:                ; preds = %vector.body.1
  %index.unr.ph.1 = phi i64 [ %index.next.3.1, %vector.body.1 ]
  br label %middle.block.unr-lcssa.1

middle.block.unr-lcssa.1:                         ; preds = %middle.block.unr-lcssa.loopexit.1, %vector.ph.1
  %index.unr.1 = phi i64 [ 0, %vector.ph.1 ], [ %index.unr.ph.1, %middle.block.unr-lcssa.loopexit.1 ]
  br i1 false, label %vector.body.epil.preheader.1, label %middle.block.1

vector.body.epil.preheader.1:                     ; preds = %middle.block.unr-lcssa.1
  br label %vector.body.epil.1

vector.body.epil.1:                               ; preds = %vector.body.epil.1, %vector.body.epil.preheader.1
  %index.epil.1 = phi i64 [ %index.unr.1, %vector.body.epil.preheader.1 ], [ %index.next.epil.1, %vector.body.epil.1 ]
  %epil.iter.1 = phi i64 [ 0, %vector.body.epil.preheader.1 ], [ %epil.iter.sub.1, %vector.body.epil.1 ]
  %337 = trunc i64 %index.epil.1 to i32
  %338 = add i32 %337, %218
  %339 = add i32 %338, 64
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds float, float* %data_real, i64 %340
  %342 = bitcast float* %341 to <4 x float>*
  %wide.load.epil.1 = load <4 x float>, <4 x float>* %342, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %343 = fmul <4 x float> %broadcast.splat210.1, %wide.load.epil.1
  %344 = getelementptr inbounds float, float* %data_imag, i64 %340
  %345 = bitcast float* %344 to <4 x float>*
  %wide.load211.epil.1 = load <4 x float>, <4 x float>* %345, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %346 = fmul <4 x float> %broadcast.splat213.1, %wide.load211.epil.1
  %347 = fsub <4 x float> %343, %346
  %348 = fmul <4 x float> %broadcast.splat213.1, %wide.load.epil.1
  %349 = fmul <4 x float> %broadcast.splat210.1, %wide.load211.epil.1
  %350 = fadd <4 x float> %348, %349
  %351 = add nuw nsw i64 %index.epil.1, %217
  %352 = getelementptr inbounds float, float* %data_real, i64 %351
  %353 = bitcast float* %352 to <4 x float>*
  %wide.load214.epil.1 = load <4 x float>, <4 x float>* %353, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %354 = fsub <4 x float> %wide.load214.epil.1, %347
  %355 = bitcast float* %341 to <4 x float>*
  store <4 x float> %354, <4 x float>* %355, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %356 = bitcast float* %352 to <4 x float>*
  %wide.load215.epil.1 = load <4 x float>, <4 x float>* %356, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %357 = fadd <4 x float> %347, %wide.load215.epil.1
  %358 = bitcast float* %352 to <4 x float>*
  store <4 x float> %357, <4 x float>* %358, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %359 = getelementptr inbounds float, float* %data_imag, i64 %351
  %360 = bitcast float* %359 to <4 x float>*
  %wide.load216.epil.1 = load <4 x float>, <4 x float>* %360, align 4, !tbaa !2, !alias.scope !33
  %361 = fsub <4 x float> %wide.load216.epil.1, %350
  %362 = bitcast float* %344 to <4 x float>*
  store <4 x float> %361, <4 x float>* %362, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %363 = bitcast float* %359 to <4 x float>*
  %wide.load217.epil.1 = load <4 x float>, <4 x float>* %363, align 4, !tbaa !2, !alias.scope !33
  %364 = fadd <4 x float> %350, %wide.load217.epil.1
  %365 = bitcast float* %359 to <4 x float>*
  store <4 x float> %364, <4 x float>* %365, align 4, !tbaa !2, !alias.scope !33
  %index.next.epil.1 = add i64 %index.epil.1, 4
  %epil.iter.sub.1 = sub i64 %epil.iter.1, 1
  %epil.iter.cmp.1 = icmp ne i64 %epil.iter.sub.1, 0
  br i1 %epil.iter.cmp.1, label %vector.body.epil.1, label %middle.block.epilog-lcssa.1, !llvm.loop !37

middle.block.epilog-lcssa.1:                      ; preds = %vector.body.epil.1
  br label %middle.block.1

middle.block.1:                                   ; preds = %middle.block.epilog-lcssa.1, %middle.block.unr-lcssa.1
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.1, label %for.body11.us.preheader.1

for.body11.us.preheader.1:                        ; preds = %middle.block.1, %vector.memcheck.1, %vector.scevcheck.1, %for.body3.us.1
  %indvars.iv.ph.1 = phi i64 [ 0, %vector.memcheck.1 ], [ 0, %vector.scevcheck.1 ], [ 0, %for.body3.us.1 ], [ 64, %middle.block.1 ]
  %366 = sub i64 64, %indvars.iv.ph.1
  %367 = sub i64 63, %indvars.iv.ph.1
  br i1 false, label %for.body11.us.prol.preheader.1, label %for.body11.us.prol.loopexit.1

for.body11.us.prol.preheader.1:                   ; preds = %for.body11.us.preheader.1
  br label %for.body11.us.prol.1

for.body11.us.prol.1:                             ; preds = %for.body11.us.prol.1, %for.body11.us.prol.preheader.1
  %indvars.iv.prol.1 = phi i64 [ %indvars.iv.next.prol.1, %for.body11.us.prol.1 ], [ %indvars.iv.ph.1, %for.body11.us.prol.preheader.1 ]
  %prol.iter.1 = phi i64 [ 0, %for.body11.us.prol.preheader.1 ], [ %prol.iter.sub.1, %for.body11.us.prol.1 ]
  %368 = trunc i64 %indvars.iv.prol.1 to i32
  %add13.us.prol.1 = add i32 %368, %218
  %add14.us.prol.1 = add i32 %add13.us.prol.1, 64
  %idxprom15.us.prol.1 = sext i32 %add14.us.prol.1 to i64
  %arrayidx16.us.prol.1 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.prol.1
  %369 = load float, float* %arrayidx16.us.prol.1, align 4, !tbaa !2
  %mul17.us.prol.1 = fmul float %214, %369
  %arrayidx23.us.prol.1 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.prol.1
  %370 = load float, float* %arrayidx23.us.prol.1, align 4, !tbaa !2
  %mul24.us.prol.1 = fmul float %215, %370
  %sub25.us.prol.1 = fsub float %mul17.us.prol.1, %mul24.us.prol.1
  %mul32.us.prol.1 = fmul float %215, %369
  %mul39.us.prol.1 = fmul float %214, %370
  %add40.us.prol.1 = fadd float %mul32.us.prol.1, %mul39.us.prol.1
  %371 = add nuw nsw i64 %indvars.iv.prol.1, %217
  %arrayidx45.us.prol.1 = getelementptr inbounds float, float* %data_real, i64 %371
  %372 = load float, float* %arrayidx45.us.prol.1, align 4, !tbaa !2
  %sub46.us.prol.1 = fsub float %372, %sub25.us.prol.1
  store float %sub46.us.prol.1, float* %arrayidx16.us.prol.1, align 4, !tbaa !2
  %373 = load float, float* %arrayidx45.us.prol.1, align 4, !tbaa !2
  %add58.us.prol.1 = fadd float %sub25.us.prol.1, %373
  store float %add58.us.prol.1, float* %arrayidx45.us.prol.1, align 4, !tbaa !2
  %arrayidx63.us.prol.1 = getelementptr inbounds float, float* %data_imag, i64 %371
  %374 = load float, float* %arrayidx63.us.prol.1, align 4, !tbaa !2
  %sub64.us.prol.1 = fsub float %374, %add40.us.prol.1
  store float %sub64.us.prol.1, float* %arrayidx23.us.prol.1, align 4, !tbaa !2
  %375 = load float, float* %arrayidx63.us.prol.1, align 4, !tbaa !2
  %add76.us.prol.1 = fadd float %add40.us.prol.1, %375
  store float %add76.us.prol.1, float* %arrayidx63.us.prol.1, align 4, !tbaa !2
  %indvars.iv.next.prol.1 = add nuw nsw i64 %indvars.iv.prol.1, 1
  %prol.iter.sub.1 = sub i64 %prol.iter.1, 1
  %prol.iter.cmp.1 = icmp ne i64 %prol.iter.sub.1, 0
  br i1 %prol.iter.cmp.1, label %for.body11.us.prol.1, label %for.body11.us.prol.loopexit.unr-lcssa.1, !llvm.loop !38

for.body11.us.prol.loopexit.unr-lcssa.1:          ; preds = %for.body11.us.prol.1
  %indvars.iv.unr.ph.1 = phi i64 [ %indvars.iv.next.prol.1, %for.body11.us.prol.1 ]
  br label %for.body11.us.prol.loopexit.1

for.body11.us.prol.loopexit.1:                    ; preds = %for.body11.us.prol.loopexit.unr-lcssa.1, %for.body11.us.preheader.1
  %indvars.iv.unr.1 = phi i64 [ %indvars.iv.ph.1, %for.body11.us.preheader.1 ], [ %indvars.iv.unr.ph.1, %for.body11.us.prol.loopexit.unr-lcssa.1 ]
  %376 = icmp ult i64 %367, 3
  br i1 %376, label %for.cond9.for.inc77_crit_edge.us.loopexit.1, label %for.body11.us.preheader.new.1

for.body11.us.preheader.new.1:                    ; preds = %for.body11.us.prol.loopexit.1
  br label %for.body11.us.1

for.body11.us.1:                                  ; preds = %for.body11.us.1, %for.body11.us.preheader.new.1
  %indvars.iv.1 = phi i64 [ %indvars.iv.unr.1, %for.body11.us.preheader.new.1 ], [ %indvars.iv.next.3.1, %for.body11.us.1 ]
  %377 = trunc i64 %indvars.iv.1 to i32
  %add13.us.111 = add i32 %377, %218
  %add14.us.112 = add i32 %add13.us.111, 64
  %idxprom15.us.113 = sext i32 %add14.us.112 to i64
  %arrayidx16.us.114 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.113
  %378 = load float, float* %arrayidx16.us.114, align 4, !tbaa !2
  %mul17.us.115 = fmul float %214, %378
  %arrayidx23.us.116 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.113
  %379 = load float, float* %arrayidx23.us.116, align 4, !tbaa !2
  %mul24.us.117 = fmul float %215, %379
  %sub25.us.118 = fsub float %mul17.us.115, %mul24.us.117
  %mul32.us.119 = fmul float %215, %378
  %mul39.us.120 = fmul float %214, %379
  %add40.us.121 = fadd float %mul32.us.119, %mul39.us.120
  %380 = add nuw nsw i64 %indvars.iv.1, %217
  %arrayidx45.us.122 = getelementptr inbounds float, float* %data_real, i64 %380
  %381 = load float, float* %arrayidx45.us.122, align 4, !tbaa !2
  %sub46.us.123 = fsub float %381, %sub25.us.118
  store float %sub46.us.123, float* %arrayidx16.us.114, align 4, !tbaa !2
  %382 = load float, float* %arrayidx45.us.122, align 4, !tbaa !2
  %add58.us.124 = fadd float %sub25.us.118, %382
  store float %add58.us.124, float* %arrayidx45.us.122, align 4, !tbaa !2
  %arrayidx63.us.125 = getelementptr inbounds float, float* %data_imag, i64 %380
  %383 = load float, float* %arrayidx63.us.125, align 4, !tbaa !2
  %sub64.us.126 = fsub float %383, %add40.us.121
  store float %sub64.us.126, float* %arrayidx23.us.116, align 4, !tbaa !2
  %384 = load float, float* %arrayidx63.us.125, align 4, !tbaa !2
  %add76.us.127 = fadd float %add40.us.121, %384
  store float %add76.us.127, float* %arrayidx63.us.125, align 4, !tbaa !2
  %indvars.iv.next.128 = add nuw nsw i64 %indvars.iv.1, 1
  %385 = trunc i64 %indvars.iv.next.128 to i32
  %add13.us.1.1 = add i32 %385, %218
  %add14.us.1.1 = add i32 %add13.us.1.1, 64
  %idxprom15.us.1.1 = sext i32 %add14.us.1.1 to i64
  %arrayidx16.us.1.1 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.1
  %386 = load float, float* %arrayidx16.us.1.1, align 4, !tbaa !2
  %mul17.us.1.1 = fmul float %214, %386
  %arrayidx23.us.1.1 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.1
  %387 = load float, float* %arrayidx23.us.1.1, align 4, !tbaa !2
  %mul24.us.1.1 = fmul float %215, %387
  %sub25.us.1.1 = fsub float %mul17.us.1.1, %mul24.us.1.1
  %mul32.us.1.1 = fmul float %215, %386
  %mul39.us.1.1 = fmul float %214, %387
  %add40.us.1.1 = fadd float %mul32.us.1.1, %mul39.us.1.1
  %388 = add nuw nsw i64 %indvars.iv.next.128, %217
  %arrayidx45.us.1.1 = getelementptr inbounds float, float* %data_real, i64 %388
  %389 = load float, float* %arrayidx45.us.1.1, align 4, !tbaa !2
  %sub46.us.1.1 = fsub float %389, %sub25.us.1.1
  store float %sub46.us.1.1, float* %arrayidx16.us.1.1, align 4, !tbaa !2
  %390 = load float, float* %arrayidx45.us.1.1, align 4, !tbaa !2
  %add58.us.1.1 = fadd float %sub25.us.1.1, %390
  store float %add58.us.1.1, float* %arrayidx45.us.1.1, align 4, !tbaa !2
  %arrayidx63.us.1.1 = getelementptr inbounds float, float* %data_imag, i64 %388
  %391 = load float, float* %arrayidx63.us.1.1, align 4, !tbaa !2
  %sub64.us.1.1 = fsub float %391, %add40.us.1.1
  store float %sub64.us.1.1, float* %arrayidx23.us.1.1, align 4, !tbaa !2
  %392 = load float, float* %arrayidx63.us.1.1, align 4, !tbaa !2
  %add76.us.1.1 = fadd float %add40.us.1.1, %392
  store float %add76.us.1.1, float* %arrayidx63.us.1.1, align 4, !tbaa !2
  %indvars.iv.next.1.1 = add nuw nsw i64 %indvars.iv.next.128, 1
  %393 = trunc i64 %indvars.iv.next.1.1 to i32
  %add13.us.2.1 = add i32 %393, %218
  %add14.us.2.1 = add i32 %add13.us.2.1, 64
  %idxprom15.us.2.1 = sext i32 %add14.us.2.1 to i64
  %arrayidx16.us.2.1 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.1
  %394 = load float, float* %arrayidx16.us.2.1, align 4, !tbaa !2
  %mul17.us.2.1 = fmul float %214, %394
  %arrayidx23.us.2.1 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.1
  %395 = load float, float* %arrayidx23.us.2.1, align 4, !tbaa !2
  %mul24.us.2.1 = fmul float %215, %395
  %sub25.us.2.1 = fsub float %mul17.us.2.1, %mul24.us.2.1
  %mul32.us.2.1 = fmul float %215, %394
  %mul39.us.2.1 = fmul float %214, %395
  %add40.us.2.1 = fadd float %mul32.us.2.1, %mul39.us.2.1
  %396 = add nuw nsw i64 %indvars.iv.next.1.1, %217
  %arrayidx45.us.2.1 = getelementptr inbounds float, float* %data_real, i64 %396
  %397 = load float, float* %arrayidx45.us.2.1, align 4, !tbaa !2
  %sub46.us.2.1 = fsub float %397, %sub25.us.2.1
  store float %sub46.us.2.1, float* %arrayidx16.us.2.1, align 4, !tbaa !2
  %398 = load float, float* %arrayidx45.us.2.1, align 4, !tbaa !2
  %add58.us.2.1 = fadd float %sub25.us.2.1, %398
  store float %add58.us.2.1, float* %arrayidx45.us.2.1, align 4, !tbaa !2
  %arrayidx63.us.2.1 = getelementptr inbounds float, float* %data_imag, i64 %396
  %399 = load float, float* %arrayidx63.us.2.1, align 4, !tbaa !2
  %sub64.us.2.1 = fsub float %399, %add40.us.2.1
  store float %sub64.us.2.1, float* %arrayidx23.us.2.1, align 4, !tbaa !2
  %400 = load float, float* %arrayidx63.us.2.1, align 4, !tbaa !2
  %add76.us.2.1 = fadd float %add40.us.2.1, %400
  store float %add76.us.2.1, float* %arrayidx63.us.2.1, align 4, !tbaa !2
  %indvars.iv.next.2.1 = add nuw nsw i64 %indvars.iv.next.1.1, 1
  %401 = trunc i64 %indvars.iv.next.2.1 to i32
  %add13.us.3.1 = add i32 %401, %218
  %add14.us.3.1 = add i32 %add13.us.3.1, 64
  %idxprom15.us.3.1 = sext i32 %add14.us.3.1 to i64
  %arrayidx16.us.3.1 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.1
  %402 = load float, float* %arrayidx16.us.3.1, align 4, !tbaa !2
  %mul17.us.3.1 = fmul float %214, %402
  %arrayidx23.us.3.1 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.1
  %403 = load float, float* %arrayidx23.us.3.1, align 4, !tbaa !2
  %mul24.us.3.1 = fmul float %215, %403
  %sub25.us.3.1 = fsub float %mul17.us.3.1, %mul24.us.3.1
  %mul32.us.3.1 = fmul float %215, %402
  %mul39.us.3.1 = fmul float %214, %403
  %add40.us.3.1 = fadd float %mul32.us.3.1, %mul39.us.3.1
  %404 = add nuw nsw i64 %indvars.iv.next.2.1, %217
  %arrayidx45.us.3.1 = getelementptr inbounds float, float* %data_real, i64 %404
  %405 = load float, float* %arrayidx45.us.3.1, align 4, !tbaa !2
  %sub46.us.3.1 = fsub float %405, %sub25.us.3.1
  store float %sub46.us.3.1, float* %arrayidx16.us.3.1, align 4, !tbaa !2
  %406 = load float, float* %arrayidx45.us.3.1, align 4, !tbaa !2
  %add58.us.3.1 = fadd float %sub25.us.3.1, %406
  store float %add58.us.3.1, float* %arrayidx45.us.3.1, align 4, !tbaa !2
  %arrayidx63.us.3.1 = getelementptr inbounds float, float* %data_imag, i64 %404
  %407 = load float, float* %arrayidx63.us.3.1, align 4, !tbaa !2
  %sub64.us.3.1 = fsub float %407, %add40.us.3.1
  store float %sub64.us.3.1, float* %arrayidx23.us.3.1, align 4, !tbaa !2
  %408 = load float, float* %arrayidx63.us.3.1, align 4, !tbaa !2
  %add76.us.3.1 = fadd float %add40.us.3.1, %408
  store float %add76.us.3.1, float* %arrayidx63.us.3.1, align 4, !tbaa !2
  %indvars.iv.next.3.1 = add nuw nsw i64 %indvars.iv.next.2.1, 1
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 64
  br i1 %exitcond.3.1, label %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.1, label %for.body11.us.1, !llvm.loop !39

for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.1: ; preds = %for.body11.us.1
  br label %for.cond9.for.inc77_crit_edge.us.loopexit.1

for.cond9.for.inc77_crit_edge.us.loopexit.1:      ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.1, %for.body11.us.prol.loopexit.1
  br label %for.cond9.for.inc77_crit_edge.us.1

for.cond9.for.inc77_crit_edge.us.1:               ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.1, %middle.block.1
  %indvars.iv.next163.1 = add nuw nsw i64 %indvars.iv162.1, 1
  %exitcond168.1 = icmp eq i64 %indvars.iv.next163.1, 2
  br i1 %exitcond168.1, label %for.end79.loopexit.1, label %for.body3.us.1

for.end79.loopexit.1:                             ; preds = %for.cond9.for.inc77_crit_edge.us.1
  br label %for.end79.1

for.end79.1:                                      ; preds = %for.end79.loopexit.1, %for.end79
  br i1 true, label %for.body3.us.preheader.2, label %for.end79.2

for.body3.us.preheader.2:                         ; preds = %for.end79.1
  %scevgep171.2 = getelementptr float, float* %data_real, i64 32
  %scevgep180.2 = getelementptr float, float* %data_imag, i64 32
  br label %for.body3.us.2

for.body3.us.2:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.2, %for.body3.us.preheader.2
  %indvars.iv162.2 = phi i64 [ 0, %for.body3.us.preheader.2 ], [ %indvars.iv.next163.2, %for.cond9.for.inc77_crit_edge.us.2 ]
  %409 = trunc i64 %indvars.iv162.2 to i32
  %410 = mul i32 64, %409
  %411 = add i32 32, %410
  %412 = sext i32 %411 to i64
  %scevgep.2 = getelementptr float, float* %data_real, i64 %412
  %scevgep172.2 = getelementptr float, float* %scevgep171.2, i64 %412
  %413 = mul i64 64, %indvars.iv162.2
  %scevgep174.2 = getelementptr float, float* %data_real, i64 %413
  %414 = add i64 %413, 32
  %scevgep176.2 = getelementptr float, float* %data_real, i64 %414
  %scevgep178.2 = getelementptr float, float* %data_imag, i64 %412
  %scevgep181.2 = getelementptr float, float* %scevgep180.2, i64 %412
  %scevgep183.2 = getelementptr float, float* %data_imag, i64 %413
  %scevgep185.2 = getelementptr float, float* %data_imag, i64 %414
  %415 = trunc i64 %indvars.iv162.2 to i32
  %416 = mul i32 64, %415
  %417 = add i32 32, %416
  %418 = add nsw i64 %indvars.iv162.2, 3
  %arrayidx.us.2 = getelementptr inbounds float, float* %coef_real, i64 %418
  %419 = load float, float* %arrayidx.us.2, align 4, !tbaa !2
  %arrayidx8.us.2 = getelementptr inbounds float, float* %coef_imag, i64 %418
  %420 = load float, float* %arrayidx8.us.2, align 4, !tbaa !2
  %421 = shl nuw nsw i64 %indvars.iv162.2, 1
  %422 = mul nsw i64 %421, 32
  %423 = trunc i64 %422 to i32
  br i1 false, label %for.body11.us.preheader.2, label %vector.scevcheck.2

vector.scevcheck.2:                               ; preds = %for.body3.us.2
  %424 = add i32 %417, 31
  %425 = icmp slt i32 %424, %417
  br i1 %425, label %for.body11.us.preheader.2, label %vector.memcheck.2

vector.memcheck.2:                                ; preds = %vector.scevcheck.2
  %bound0.2 = icmp ult float* %scevgep.2, %scevgep176.2
  %bound1.2 = icmp ult float* %scevgep174.2, %scevgep172.2
  %found.conflict.2 = and i1 %bound0.2, %bound1.2
  %bound0187.2 = icmp ugt float* %scevgep180.2, %data_real
  %bound1188.2 = icmp ugt float* %scevgep171.2, %data_imag
  %found.conflict189.2 = and i1 %bound0187.2, %bound1188.2
  %conflict.rdx.2 = or i1 %found.conflict.2, %found.conflict189.2
  %bound0190.2 = icmp ult float* %scevgep.2, %scevgep185.2
  %bound1191.2 = icmp ult float* %scevgep183.2, %scevgep172.2
  %found.conflict192.2 = and i1 %bound0190.2, %bound1191.2
  %conflict.rdx193.2 = or i1 %conflict.rdx.2, %found.conflict192.2
  %bound0194.2 = icmp ult float* %scevgep174.2, %scevgep181.2
  %bound1195.2 = icmp ult float* %scevgep178.2, %scevgep176.2
  %found.conflict196.2 = and i1 %bound0194.2, %bound1195.2
  %conflict.rdx197.2 = or i1 %conflict.rdx193.2, %found.conflict196.2
  %bound0198.2 = icmp ult float* %scevgep174.2, %scevgep185.2
  %bound1199.2 = icmp ult float* %scevgep183.2, %scevgep176.2
  %found.conflict200.2 = and i1 %bound0198.2, %bound1199.2
  %conflict.rdx201.2 = or i1 %conflict.rdx197.2, %found.conflict200.2
  %bound0202.2 = icmp ult float* %scevgep178.2, %scevgep185.2
  %bound1203.2 = icmp ult float* %scevgep183.2, %scevgep181.2
  %found.conflict204.2 = and i1 %bound0202.2, %bound1203.2
  %conflict.rdx205.2 = or i1 %conflict.rdx201.2, %found.conflict204.2
  br i1 %conflict.rdx205.2, label %for.body11.us.preheader.2, label %vector.ph.2

vector.ph.2:                                      ; preds = %vector.memcheck.2
  %broadcast.splatinsert209.2 = insertelement <4 x float> undef, float %419, i32 0
  %broadcast.splat210.2 = shufflevector <4 x float> %broadcast.splatinsert209.2, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert212.2 = insertelement <4 x float> undef, float %420, i32 0
  %broadcast.splat213.2 = shufflevector <4 x float> %broadcast.splatinsert212.2, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block.unr-lcssa.2, label %vector.ph.new.2

vector.ph.new.2:                                  ; preds = %vector.ph.2
  br label %vector.body.2

vector.body.2:                                    ; preds = %vector.body.2, %vector.ph.new.2
  %index.2 = phi i64 [ 0, %vector.ph.new.2 ], [ %index.next.3.2, %vector.body.2 ]
  %niter.2 = phi i64 [ 8, %vector.ph.new.2 ], [ %niter.nsub.3.2, %vector.body.2 ]
  %426 = trunc i64 %index.2 to i32
  %427 = add i32 %426, %423
  %428 = add i32 %427, 32
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds float, float* %data_real, i64 %429
  %431 = bitcast float* %430 to <4 x float>*
  %wide.load.229 = load <4 x float>, <4 x float>* %431, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %432 = fmul <4 x float> %broadcast.splat210.2, %wide.load.229
  %433 = getelementptr inbounds float, float* %data_imag, i64 %429
  %434 = bitcast float* %433 to <4 x float>*
  %wide.load211.230 = load <4 x float>, <4 x float>* %434, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %435 = fmul <4 x float> %broadcast.splat213.2, %wide.load211.230
  %436 = fsub <4 x float> %432, %435
  %437 = fmul <4 x float> %broadcast.splat213.2, %wide.load.229
  %438 = fmul <4 x float> %broadcast.splat210.2, %wide.load211.230
  %439 = fadd <4 x float> %437, %438
  %440 = add nuw nsw i64 %index.2, %422
  %441 = getelementptr inbounds float, float* %data_real, i64 %440
  %442 = bitcast float* %441 to <4 x float>*
  %wide.load214.231 = load <4 x float>, <4 x float>* %442, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %443 = fsub <4 x float> %wide.load214.231, %436
  %444 = bitcast float* %430 to <4 x float>*
  store <4 x float> %443, <4 x float>* %444, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %445 = bitcast float* %441 to <4 x float>*
  %wide.load215.232 = load <4 x float>, <4 x float>* %445, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %446 = fadd <4 x float> %436, %wide.load215.232
  %447 = bitcast float* %441 to <4 x float>*
  store <4 x float> %446, <4 x float>* %447, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %448 = getelementptr inbounds float, float* %data_imag, i64 %440
  %449 = bitcast float* %448 to <4 x float>*
  %wide.load216.233 = load <4 x float>, <4 x float>* %449, align 4, !tbaa !2, !alias.scope !33
  %450 = fsub <4 x float> %wide.load216.233, %439
  %451 = bitcast float* %433 to <4 x float>*
  store <4 x float> %450, <4 x float>* %451, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %452 = bitcast float* %448 to <4 x float>*
  %wide.load217.234 = load <4 x float>, <4 x float>* %452, align 4, !tbaa !2, !alias.scope !33
  %453 = fadd <4 x float> %439, %wide.load217.234
  %454 = bitcast float* %448 to <4 x float>*
  store <4 x float> %453, <4 x float>* %454, align 4, !tbaa !2, !alias.scope !33
  %index.next.235 = add nuw nsw i64 %index.2, 4
  %niter.nsub.236 = sub i64 %niter.2, 1
  %455 = trunc i64 %index.next.235 to i32
  %456 = add i32 %455, %423
  %457 = add i32 %456, 32
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds float, float* %data_real, i64 %458
  %460 = bitcast float* %459 to <4 x float>*
  %wide.load.1.2 = load <4 x float>, <4 x float>* %460, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %461 = fmul <4 x float> %broadcast.splat210.2, %wide.load.1.2
  %462 = getelementptr inbounds float, float* %data_imag, i64 %458
  %463 = bitcast float* %462 to <4 x float>*
  %wide.load211.1.2 = load <4 x float>, <4 x float>* %463, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %464 = fmul <4 x float> %broadcast.splat213.2, %wide.load211.1.2
  %465 = fsub <4 x float> %461, %464
  %466 = fmul <4 x float> %broadcast.splat213.2, %wide.load.1.2
  %467 = fmul <4 x float> %broadcast.splat210.2, %wide.load211.1.2
  %468 = fadd <4 x float> %466, %467
  %469 = add nuw nsw i64 %index.next.235, %422
  %470 = getelementptr inbounds float, float* %data_real, i64 %469
  %471 = bitcast float* %470 to <4 x float>*
  %wide.load214.1.2 = load <4 x float>, <4 x float>* %471, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %472 = fsub <4 x float> %wide.load214.1.2, %465
  %473 = bitcast float* %459 to <4 x float>*
  store <4 x float> %472, <4 x float>* %473, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %474 = bitcast float* %470 to <4 x float>*
  %wide.load215.1.2 = load <4 x float>, <4 x float>* %474, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %475 = fadd <4 x float> %465, %wide.load215.1.2
  %476 = bitcast float* %470 to <4 x float>*
  store <4 x float> %475, <4 x float>* %476, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %477 = getelementptr inbounds float, float* %data_imag, i64 %469
  %478 = bitcast float* %477 to <4 x float>*
  %wide.load216.1.2 = load <4 x float>, <4 x float>* %478, align 4, !tbaa !2, !alias.scope !33
  %479 = fsub <4 x float> %wide.load216.1.2, %468
  %480 = bitcast float* %462 to <4 x float>*
  store <4 x float> %479, <4 x float>* %480, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %481 = bitcast float* %477 to <4 x float>*
  %wide.load217.1.2 = load <4 x float>, <4 x float>* %481, align 4, !tbaa !2, !alias.scope !33
  %482 = fadd <4 x float> %468, %wide.load217.1.2
  %483 = bitcast float* %477 to <4 x float>*
  store <4 x float> %482, <4 x float>* %483, align 4, !tbaa !2, !alias.scope !33
  %index.next.1.2 = add nuw nsw i64 %index.next.235, 4
  %niter.nsub.1.2 = sub i64 %niter.nsub.236, 1
  %484 = trunc i64 %index.next.1.2 to i32
  %485 = add i32 %484, %423
  %486 = add i32 %485, 32
  %487 = sext i32 %486 to i64
  %488 = getelementptr inbounds float, float* %data_real, i64 %487
  %489 = bitcast float* %488 to <4 x float>*
  %wide.load.2.2 = load <4 x float>, <4 x float>* %489, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %490 = fmul <4 x float> %broadcast.splat210.2, %wide.load.2.2
  %491 = getelementptr inbounds float, float* %data_imag, i64 %487
  %492 = bitcast float* %491 to <4 x float>*
  %wide.load211.2.2 = load <4 x float>, <4 x float>* %492, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %493 = fmul <4 x float> %broadcast.splat213.2, %wide.load211.2.2
  %494 = fsub <4 x float> %490, %493
  %495 = fmul <4 x float> %broadcast.splat213.2, %wide.load.2.2
  %496 = fmul <4 x float> %broadcast.splat210.2, %wide.load211.2.2
  %497 = fadd <4 x float> %495, %496
  %498 = add nuw nsw i64 %index.next.1.2, %422
  %499 = getelementptr inbounds float, float* %data_real, i64 %498
  %500 = bitcast float* %499 to <4 x float>*
  %wide.load214.2.2 = load <4 x float>, <4 x float>* %500, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %501 = fsub <4 x float> %wide.load214.2.2, %494
  %502 = bitcast float* %488 to <4 x float>*
  store <4 x float> %501, <4 x float>* %502, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %503 = bitcast float* %499 to <4 x float>*
  %wide.load215.2.2 = load <4 x float>, <4 x float>* %503, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %504 = fadd <4 x float> %494, %wide.load215.2.2
  %505 = bitcast float* %499 to <4 x float>*
  store <4 x float> %504, <4 x float>* %505, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %506 = getelementptr inbounds float, float* %data_imag, i64 %498
  %507 = bitcast float* %506 to <4 x float>*
  %wide.load216.2.2 = load <4 x float>, <4 x float>* %507, align 4, !tbaa !2, !alias.scope !33
  %508 = fsub <4 x float> %wide.load216.2.2, %497
  %509 = bitcast float* %491 to <4 x float>*
  store <4 x float> %508, <4 x float>* %509, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %510 = bitcast float* %506 to <4 x float>*
  %wide.load217.2.2 = load <4 x float>, <4 x float>* %510, align 4, !tbaa !2, !alias.scope !33
  %511 = fadd <4 x float> %497, %wide.load217.2.2
  %512 = bitcast float* %506 to <4 x float>*
  store <4 x float> %511, <4 x float>* %512, align 4, !tbaa !2, !alias.scope !33
  %index.next.2.2 = add nuw nsw i64 %index.next.1.2, 4
  %niter.nsub.2.2 = sub i64 %niter.nsub.1.2, 1
  %513 = trunc i64 %index.next.2.2 to i32
  %514 = add i32 %513, %423
  %515 = add i32 %514, 32
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds float, float* %data_real, i64 %516
  %518 = bitcast float* %517 to <4 x float>*
  %wide.load.3.2 = load <4 x float>, <4 x float>* %518, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %519 = fmul <4 x float> %broadcast.splat210.2, %wide.load.3.2
  %520 = getelementptr inbounds float, float* %data_imag, i64 %516
  %521 = bitcast float* %520 to <4 x float>*
  %wide.load211.3.2 = load <4 x float>, <4 x float>* %521, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %522 = fmul <4 x float> %broadcast.splat213.2, %wide.load211.3.2
  %523 = fsub <4 x float> %519, %522
  %524 = fmul <4 x float> %broadcast.splat213.2, %wide.load.3.2
  %525 = fmul <4 x float> %broadcast.splat210.2, %wide.load211.3.2
  %526 = fadd <4 x float> %524, %525
  %527 = add nuw nsw i64 %index.next.2.2, %422
  %528 = getelementptr inbounds float, float* %data_real, i64 %527
  %529 = bitcast float* %528 to <4 x float>*
  %wide.load214.3.2 = load <4 x float>, <4 x float>* %529, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %530 = fsub <4 x float> %wide.load214.3.2, %523
  %531 = bitcast float* %517 to <4 x float>*
  store <4 x float> %530, <4 x float>* %531, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %532 = bitcast float* %528 to <4 x float>*
  %wide.load215.3.2 = load <4 x float>, <4 x float>* %532, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %533 = fadd <4 x float> %523, %wide.load215.3.2
  %534 = bitcast float* %528 to <4 x float>*
  store <4 x float> %533, <4 x float>* %534, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %535 = getelementptr inbounds float, float* %data_imag, i64 %527
  %536 = bitcast float* %535 to <4 x float>*
  %wide.load216.3.2 = load <4 x float>, <4 x float>* %536, align 4, !tbaa !2, !alias.scope !33
  %537 = fsub <4 x float> %wide.load216.3.2, %526
  %538 = bitcast float* %520 to <4 x float>*
  store <4 x float> %537, <4 x float>* %538, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %539 = bitcast float* %535 to <4 x float>*
  %wide.load217.3.2 = load <4 x float>, <4 x float>* %539, align 4, !tbaa !2, !alias.scope !33
  %540 = fadd <4 x float> %526, %wide.load217.3.2
  %541 = bitcast float* %535 to <4 x float>*
  store <4 x float> %540, <4 x float>* %541, align 4, !tbaa !2, !alias.scope !33
  %index.next.3.2 = add i64 %index.next.2.2, 4
  %niter.nsub.3.2 = sub i64 %niter.nsub.2.2, 1
  %niter.ncmp.3.2 = icmp eq i64 %niter.nsub.3.2, 0
  br i1 %niter.ncmp.3.2, label %middle.block.unr-lcssa.loopexit.2, label %vector.body.2, !llvm.loop !36

middle.block.unr-lcssa.loopexit.2:                ; preds = %vector.body.2
  %index.unr.ph.2 = phi i64 [ %index.next.3.2, %vector.body.2 ]
  br label %middle.block.unr-lcssa.2

middle.block.unr-lcssa.2:                         ; preds = %middle.block.unr-lcssa.loopexit.2, %vector.ph.2
  %index.unr.2 = phi i64 [ 0, %vector.ph.2 ], [ %index.unr.ph.2, %middle.block.unr-lcssa.loopexit.2 ]
  br i1 false, label %vector.body.epil.preheader.2, label %middle.block.2

vector.body.epil.preheader.2:                     ; preds = %middle.block.unr-lcssa.2
  br label %vector.body.epil.2

vector.body.epil.2:                               ; preds = %vector.body.epil.2, %vector.body.epil.preheader.2
  %index.epil.2 = phi i64 [ %index.unr.2, %vector.body.epil.preheader.2 ], [ %index.next.epil.2, %vector.body.epil.2 ]
  %epil.iter.2 = phi i64 [ 0, %vector.body.epil.preheader.2 ], [ %epil.iter.sub.2, %vector.body.epil.2 ]
  %542 = trunc i64 %index.epil.2 to i32
  %543 = add i32 %542, %423
  %544 = add i32 %543, 32
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds float, float* %data_real, i64 %545
  %547 = bitcast float* %546 to <4 x float>*
  %wide.load.epil.2 = load <4 x float>, <4 x float>* %547, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %548 = fmul <4 x float> %broadcast.splat210.2, %wide.load.epil.2
  %549 = getelementptr inbounds float, float* %data_imag, i64 %545
  %550 = bitcast float* %549 to <4 x float>*
  %wide.load211.epil.2 = load <4 x float>, <4 x float>* %550, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %551 = fmul <4 x float> %broadcast.splat213.2, %wide.load211.epil.2
  %552 = fsub <4 x float> %548, %551
  %553 = fmul <4 x float> %broadcast.splat213.2, %wide.load.epil.2
  %554 = fmul <4 x float> %broadcast.splat210.2, %wide.load211.epil.2
  %555 = fadd <4 x float> %553, %554
  %556 = add nuw nsw i64 %index.epil.2, %422
  %557 = getelementptr inbounds float, float* %data_real, i64 %556
  %558 = bitcast float* %557 to <4 x float>*
  %wide.load214.epil.2 = load <4 x float>, <4 x float>* %558, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %559 = fsub <4 x float> %wide.load214.epil.2, %552
  %560 = bitcast float* %546 to <4 x float>*
  store <4 x float> %559, <4 x float>* %560, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %561 = bitcast float* %557 to <4 x float>*
  %wide.load215.epil.2 = load <4 x float>, <4 x float>* %561, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %562 = fadd <4 x float> %552, %wide.load215.epil.2
  %563 = bitcast float* %557 to <4 x float>*
  store <4 x float> %562, <4 x float>* %563, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %564 = getelementptr inbounds float, float* %data_imag, i64 %556
  %565 = bitcast float* %564 to <4 x float>*
  %wide.load216.epil.2 = load <4 x float>, <4 x float>* %565, align 4, !tbaa !2, !alias.scope !33
  %566 = fsub <4 x float> %wide.load216.epil.2, %555
  %567 = bitcast float* %549 to <4 x float>*
  store <4 x float> %566, <4 x float>* %567, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %568 = bitcast float* %564 to <4 x float>*
  %wide.load217.epil.2 = load <4 x float>, <4 x float>* %568, align 4, !tbaa !2, !alias.scope !33
  %569 = fadd <4 x float> %555, %wide.load217.epil.2
  %570 = bitcast float* %564 to <4 x float>*
  store <4 x float> %569, <4 x float>* %570, align 4, !tbaa !2, !alias.scope !33
  %index.next.epil.2 = add i64 %index.epil.2, 4
  %epil.iter.sub.2 = sub i64 %epil.iter.2, 1
  %epil.iter.cmp.2 = icmp ne i64 %epil.iter.sub.2, 0
  br i1 %epil.iter.cmp.2, label %vector.body.epil.2, label %middle.block.epilog-lcssa.2, !llvm.loop !37

middle.block.epilog-lcssa.2:                      ; preds = %vector.body.epil.2
  br label %middle.block.2

middle.block.2:                                   ; preds = %middle.block.epilog-lcssa.2, %middle.block.unr-lcssa.2
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.2, label %for.body11.us.preheader.2

for.body11.us.preheader.2:                        ; preds = %middle.block.2, %vector.memcheck.2, %vector.scevcheck.2, %for.body3.us.2
  %indvars.iv.ph.2 = phi i64 [ 0, %vector.memcheck.2 ], [ 0, %vector.scevcheck.2 ], [ 0, %for.body3.us.2 ], [ 32, %middle.block.2 ]
  %571 = sub i64 32, %indvars.iv.ph.2
  %572 = sub i64 31, %indvars.iv.ph.2
  br i1 false, label %for.body11.us.prol.preheader.2, label %for.body11.us.prol.loopexit.2

for.body11.us.prol.preheader.2:                   ; preds = %for.body11.us.preheader.2
  br label %for.body11.us.prol.2

for.body11.us.prol.2:                             ; preds = %for.body11.us.prol.2, %for.body11.us.prol.preheader.2
  %indvars.iv.prol.2 = phi i64 [ %indvars.iv.next.prol.2, %for.body11.us.prol.2 ], [ %indvars.iv.ph.2, %for.body11.us.prol.preheader.2 ]
  %prol.iter.2 = phi i64 [ 0, %for.body11.us.prol.preheader.2 ], [ %prol.iter.sub.2, %for.body11.us.prol.2 ]
  %573 = trunc i64 %indvars.iv.prol.2 to i32
  %add13.us.prol.2 = add i32 %573, %423
  %add14.us.prol.2 = add i32 %add13.us.prol.2, 32
  %idxprom15.us.prol.2 = sext i32 %add14.us.prol.2 to i64
  %arrayidx16.us.prol.2 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.prol.2
  %574 = load float, float* %arrayidx16.us.prol.2, align 4, !tbaa !2
  %mul17.us.prol.2 = fmul float %419, %574
  %arrayidx23.us.prol.2 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.prol.2
  %575 = load float, float* %arrayidx23.us.prol.2, align 4, !tbaa !2
  %mul24.us.prol.2 = fmul float %420, %575
  %sub25.us.prol.2 = fsub float %mul17.us.prol.2, %mul24.us.prol.2
  %mul32.us.prol.2 = fmul float %420, %574
  %mul39.us.prol.2 = fmul float %419, %575
  %add40.us.prol.2 = fadd float %mul32.us.prol.2, %mul39.us.prol.2
  %576 = add nuw nsw i64 %indvars.iv.prol.2, %422
  %arrayidx45.us.prol.2 = getelementptr inbounds float, float* %data_real, i64 %576
  %577 = load float, float* %arrayidx45.us.prol.2, align 4, !tbaa !2
  %sub46.us.prol.2 = fsub float %577, %sub25.us.prol.2
  store float %sub46.us.prol.2, float* %arrayidx16.us.prol.2, align 4, !tbaa !2
  %578 = load float, float* %arrayidx45.us.prol.2, align 4, !tbaa !2
  %add58.us.prol.2 = fadd float %sub25.us.prol.2, %578
  store float %add58.us.prol.2, float* %arrayidx45.us.prol.2, align 4, !tbaa !2
  %arrayidx63.us.prol.2 = getelementptr inbounds float, float* %data_imag, i64 %576
  %579 = load float, float* %arrayidx63.us.prol.2, align 4, !tbaa !2
  %sub64.us.prol.2 = fsub float %579, %add40.us.prol.2
  store float %sub64.us.prol.2, float* %arrayidx23.us.prol.2, align 4, !tbaa !2
  %580 = load float, float* %arrayidx63.us.prol.2, align 4, !tbaa !2
  %add76.us.prol.2 = fadd float %add40.us.prol.2, %580
  store float %add76.us.prol.2, float* %arrayidx63.us.prol.2, align 4, !tbaa !2
  %indvars.iv.next.prol.2 = add nuw nsw i64 %indvars.iv.prol.2, 1
  %prol.iter.sub.2 = sub i64 %prol.iter.2, 1
  %prol.iter.cmp.2 = icmp ne i64 %prol.iter.sub.2, 0
  br i1 %prol.iter.cmp.2, label %for.body11.us.prol.2, label %for.body11.us.prol.loopexit.unr-lcssa.2, !llvm.loop !38

for.body11.us.prol.loopexit.unr-lcssa.2:          ; preds = %for.body11.us.prol.2
  %indvars.iv.unr.ph.2 = phi i64 [ %indvars.iv.next.prol.2, %for.body11.us.prol.2 ]
  br label %for.body11.us.prol.loopexit.2

for.body11.us.prol.loopexit.2:                    ; preds = %for.body11.us.prol.loopexit.unr-lcssa.2, %for.body11.us.preheader.2
  %indvars.iv.unr.2 = phi i64 [ %indvars.iv.ph.2, %for.body11.us.preheader.2 ], [ %indvars.iv.unr.ph.2, %for.body11.us.prol.loopexit.unr-lcssa.2 ]
  %581 = icmp ult i64 %572, 3
  br i1 %581, label %for.cond9.for.inc77_crit_edge.us.loopexit.2, label %for.body11.us.preheader.new.2

for.body11.us.preheader.new.2:                    ; preds = %for.body11.us.prol.loopexit.2
  br label %for.body11.us.2

for.body11.us.2:                                  ; preds = %for.body11.us.2, %for.body11.us.preheader.new.2
  %indvars.iv.2 = phi i64 [ %indvars.iv.unr.2, %for.body11.us.preheader.new.2 ], [ %indvars.iv.next.3.2, %for.body11.us.2 ]
  %582 = trunc i64 %indvars.iv.2 to i32
  %add13.us.237 = add i32 %582, %423
  %add14.us.238 = add i32 %add13.us.237, 32
  %idxprom15.us.239 = sext i32 %add14.us.238 to i64
  %arrayidx16.us.240 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.239
  %583 = load float, float* %arrayidx16.us.240, align 4, !tbaa !2
  %mul17.us.241 = fmul float %419, %583
  %arrayidx23.us.242 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.239
  %584 = load float, float* %arrayidx23.us.242, align 4, !tbaa !2
  %mul24.us.243 = fmul float %420, %584
  %sub25.us.244 = fsub float %mul17.us.241, %mul24.us.243
  %mul32.us.245 = fmul float %420, %583
  %mul39.us.246 = fmul float %419, %584
  %add40.us.247 = fadd float %mul32.us.245, %mul39.us.246
  %585 = add nuw nsw i64 %indvars.iv.2, %422
  %arrayidx45.us.248 = getelementptr inbounds float, float* %data_real, i64 %585
  %586 = load float, float* %arrayidx45.us.248, align 4, !tbaa !2
  %sub46.us.249 = fsub float %586, %sub25.us.244
  store float %sub46.us.249, float* %arrayidx16.us.240, align 4, !tbaa !2
  %587 = load float, float* %arrayidx45.us.248, align 4, !tbaa !2
  %add58.us.250 = fadd float %sub25.us.244, %587
  store float %add58.us.250, float* %arrayidx45.us.248, align 4, !tbaa !2
  %arrayidx63.us.251 = getelementptr inbounds float, float* %data_imag, i64 %585
  %588 = load float, float* %arrayidx63.us.251, align 4, !tbaa !2
  %sub64.us.252 = fsub float %588, %add40.us.247
  store float %sub64.us.252, float* %arrayidx23.us.242, align 4, !tbaa !2
  %589 = load float, float* %arrayidx63.us.251, align 4, !tbaa !2
  %add76.us.253 = fadd float %add40.us.247, %589
  store float %add76.us.253, float* %arrayidx63.us.251, align 4, !tbaa !2
  %indvars.iv.next.254 = add nuw nsw i64 %indvars.iv.2, 1
  %590 = trunc i64 %indvars.iv.next.254 to i32
  %add13.us.1.2 = add i32 %590, %423
  %add14.us.1.2 = add i32 %add13.us.1.2, 32
  %idxprom15.us.1.2 = sext i32 %add14.us.1.2 to i64
  %arrayidx16.us.1.2 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.2
  %591 = load float, float* %arrayidx16.us.1.2, align 4, !tbaa !2
  %mul17.us.1.2 = fmul float %419, %591
  %arrayidx23.us.1.2 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.2
  %592 = load float, float* %arrayidx23.us.1.2, align 4, !tbaa !2
  %mul24.us.1.2 = fmul float %420, %592
  %sub25.us.1.2 = fsub float %mul17.us.1.2, %mul24.us.1.2
  %mul32.us.1.2 = fmul float %420, %591
  %mul39.us.1.2 = fmul float %419, %592
  %add40.us.1.2 = fadd float %mul32.us.1.2, %mul39.us.1.2
  %593 = add nuw nsw i64 %indvars.iv.next.254, %422
  %arrayidx45.us.1.2 = getelementptr inbounds float, float* %data_real, i64 %593
  %594 = load float, float* %arrayidx45.us.1.2, align 4, !tbaa !2
  %sub46.us.1.2 = fsub float %594, %sub25.us.1.2
  store float %sub46.us.1.2, float* %arrayidx16.us.1.2, align 4, !tbaa !2
  %595 = load float, float* %arrayidx45.us.1.2, align 4, !tbaa !2
  %add58.us.1.2 = fadd float %sub25.us.1.2, %595
  store float %add58.us.1.2, float* %arrayidx45.us.1.2, align 4, !tbaa !2
  %arrayidx63.us.1.2 = getelementptr inbounds float, float* %data_imag, i64 %593
  %596 = load float, float* %arrayidx63.us.1.2, align 4, !tbaa !2
  %sub64.us.1.2 = fsub float %596, %add40.us.1.2
  store float %sub64.us.1.2, float* %arrayidx23.us.1.2, align 4, !tbaa !2
  %597 = load float, float* %arrayidx63.us.1.2, align 4, !tbaa !2
  %add76.us.1.2 = fadd float %add40.us.1.2, %597
  store float %add76.us.1.2, float* %arrayidx63.us.1.2, align 4, !tbaa !2
  %indvars.iv.next.1.2 = add nuw nsw i64 %indvars.iv.next.254, 1
  %598 = trunc i64 %indvars.iv.next.1.2 to i32
  %add13.us.2.2 = add i32 %598, %423
  %add14.us.2.2 = add i32 %add13.us.2.2, 32
  %idxprom15.us.2.2 = sext i32 %add14.us.2.2 to i64
  %arrayidx16.us.2.2 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.2
  %599 = load float, float* %arrayidx16.us.2.2, align 4, !tbaa !2
  %mul17.us.2.2 = fmul float %419, %599
  %arrayidx23.us.2.2 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.2
  %600 = load float, float* %arrayidx23.us.2.2, align 4, !tbaa !2
  %mul24.us.2.2 = fmul float %420, %600
  %sub25.us.2.2 = fsub float %mul17.us.2.2, %mul24.us.2.2
  %mul32.us.2.2 = fmul float %420, %599
  %mul39.us.2.2 = fmul float %419, %600
  %add40.us.2.2 = fadd float %mul32.us.2.2, %mul39.us.2.2
  %601 = add nuw nsw i64 %indvars.iv.next.1.2, %422
  %arrayidx45.us.2.2 = getelementptr inbounds float, float* %data_real, i64 %601
  %602 = load float, float* %arrayidx45.us.2.2, align 4, !tbaa !2
  %sub46.us.2.2 = fsub float %602, %sub25.us.2.2
  store float %sub46.us.2.2, float* %arrayidx16.us.2.2, align 4, !tbaa !2
  %603 = load float, float* %arrayidx45.us.2.2, align 4, !tbaa !2
  %add58.us.2.2 = fadd float %sub25.us.2.2, %603
  store float %add58.us.2.2, float* %arrayidx45.us.2.2, align 4, !tbaa !2
  %arrayidx63.us.2.2 = getelementptr inbounds float, float* %data_imag, i64 %601
  %604 = load float, float* %arrayidx63.us.2.2, align 4, !tbaa !2
  %sub64.us.2.2 = fsub float %604, %add40.us.2.2
  store float %sub64.us.2.2, float* %arrayidx23.us.2.2, align 4, !tbaa !2
  %605 = load float, float* %arrayidx63.us.2.2, align 4, !tbaa !2
  %add76.us.2.2 = fadd float %add40.us.2.2, %605
  store float %add76.us.2.2, float* %arrayidx63.us.2.2, align 4, !tbaa !2
  %indvars.iv.next.2.2 = add nuw nsw i64 %indvars.iv.next.1.2, 1
  %606 = trunc i64 %indvars.iv.next.2.2 to i32
  %add13.us.3.2 = add i32 %606, %423
  %add14.us.3.2 = add i32 %add13.us.3.2, 32
  %idxprom15.us.3.2 = sext i32 %add14.us.3.2 to i64
  %arrayidx16.us.3.2 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.2
  %607 = load float, float* %arrayidx16.us.3.2, align 4, !tbaa !2
  %mul17.us.3.2 = fmul float %419, %607
  %arrayidx23.us.3.2 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.2
  %608 = load float, float* %arrayidx23.us.3.2, align 4, !tbaa !2
  %mul24.us.3.2 = fmul float %420, %608
  %sub25.us.3.2 = fsub float %mul17.us.3.2, %mul24.us.3.2
  %mul32.us.3.2 = fmul float %420, %607
  %mul39.us.3.2 = fmul float %419, %608
  %add40.us.3.2 = fadd float %mul32.us.3.2, %mul39.us.3.2
  %609 = add nuw nsw i64 %indvars.iv.next.2.2, %422
  %arrayidx45.us.3.2 = getelementptr inbounds float, float* %data_real, i64 %609
  %610 = load float, float* %arrayidx45.us.3.2, align 4, !tbaa !2
  %sub46.us.3.2 = fsub float %610, %sub25.us.3.2
  store float %sub46.us.3.2, float* %arrayidx16.us.3.2, align 4, !tbaa !2
  %611 = load float, float* %arrayidx45.us.3.2, align 4, !tbaa !2
  %add58.us.3.2 = fadd float %sub25.us.3.2, %611
  store float %add58.us.3.2, float* %arrayidx45.us.3.2, align 4, !tbaa !2
  %arrayidx63.us.3.2 = getelementptr inbounds float, float* %data_imag, i64 %609
  %612 = load float, float* %arrayidx63.us.3.2, align 4, !tbaa !2
  %sub64.us.3.2 = fsub float %612, %add40.us.3.2
  store float %sub64.us.3.2, float* %arrayidx23.us.3.2, align 4, !tbaa !2
  %613 = load float, float* %arrayidx63.us.3.2, align 4, !tbaa !2
  %add76.us.3.2 = fadd float %add40.us.3.2, %613
  store float %add76.us.3.2, float* %arrayidx63.us.3.2, align 4, !tbaa !2
  %indvars.iv.next.3.2 = add nuw nsw i64 %indvars.iv.next.2.2, 1
  %exitcond.3.2 = icmp eq i64 %indvars.iv.next.3.2, 32
  br i1 %exitcond.3.2, label %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.2, label %for.body11.us.2, !llvm.loop !39

for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.2: ; preds = %for.body11.us.2
  br label %for.cond9.for.inc77_crit_edge.us.loopexit.2

for.cond9.for.inc77_crit_edge.us.loopexit.2:      ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.2, %for.body11.us.prol.loopexit.2
  br label %for.cond9.for.inc77_crit_edge.us.2

for.cond9.for.inc77_crit_edge.us.2:               ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.2, %middle.block.2
  %indvars.iv.next163.2 = add nuw nsw i64 %indvars.iv162.2, 1
  %exitcond168.2 = icmp eq i64 %indvars.iv.next163.2, 4
  br i1 %exitcond168.2, label %for.end79.loopexit.2, label %for.body3.us.2

for.end79.loopexit.2:                             ; preds = %for.cond9.for.inc77_crit_edge.us.2
  br label %for.end79.2

for.end79.2:                                      ; preds = %for.end79.loopexit.2, %for.end79.1
  br i1 true, label %for.body3.us.preheader.3, label %for.end79.3

for.body3.us.preheader.3:                         ; preds = %for.end79.2
  %scevgep171.3 = getelementptr float, float* %data_real, i64 16
  %scevgep180.3 = getelementptr float, float* %data_imag, i64 16
  br label %for.body3.us.3

for.body3.us.3:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.3, %for.body3.us.preheader.3
  %indvars.iv162.3 = phi i64 [ 0, %for.body3.us.preheader.3 ], [ %indvars.iv.next163.3, %for.cond9.for.inc77_crit_edge.us.3 ]
  %614 = trunc i64 %indvars.iv162.3 to i32
  %615 = mul i32 32, %614
  %616 = add i32 16, %615
  %617 = sext i32 %616 to i64
  %scevgep.3 = getelementptr float, float* %data_real, i64 %617
  %scevgep172.3 = getelementptr float, float* %scevgep171.3, i64 %617
  %618 = mul i64 32, %indvars.iv162.3
  %scevgep174.3 = getelementptr float, float* %data_real, i64 %618
  %619 = add i64 %618, 16
  %scevgep176.3 = getelementptr float, float* %data_real, i64 %619
  %scevgep178.3 = getelementptr float, float* %data_imag, i64 %617
  %scevgep181.3 = getelementptr float, float* %scevgep180.3, i64 %617
  %scevgep183.3 = getelementptr float, float* %data_imag, i64 %618
  %scevgep185.3 = getelementptr float, float* %data_imag, i64 %619
  %620 = trunc i64 %indvars.iv162.3 to i32
  %621 = mul i32 32, %620
  %622 = add i32 16, %621
  %623 = add nsw i64 %indvars.iv162.3, 7
  %arrayidx.us.3 = getelementptr inbounds float, float* %coef_real, i64 %623
  %624 = load float, float* %arrayidx.us.3, align 4, !tbaa !2
  %arrayidx8.us.3 = getelementptr inbounds float, float* %coef_imag, i64 %623
  %625 = load float, float* %arrayidx8.us.3, align 4, !tbaa !2
  %626 = shl nuw nsw i64 %indvars.iv162.3, 1
  %627 = mul nsw i64 %626, 16
  %628 = trunc i64 %627 to i32
  br i1 false, label %for.body11.us.preheader.3, label %vector.scevcheck.3

vector.scevcheck.3:                               ; preds = %for.body3.us.3
  %629 = add i32 %622, 15
  %630 = icmp slt i32 %629, %622
  br i1 %630, label %for.body11.us.preheader.3, label %vector.memcheck.3

vector.memcheck.3:                                ; preds = %vector.scevcheck.3
  %bound0.3 = icmp ult float* %scevgep.3, %scevgep176.3
  %bound1.3 = icmp ult float* %scevgep174.3, %scevgep172.3
  %found.conflict.3 = and i1 %bound0.3, %bound1.3
  %bound0187.3 = icmp ugt float* %scevgep180.3, %data_real
  %bound1188.3 = icmp ugt float* %scevgep171.3, %data_imag
  %found.conflict189.3 = and i1 %bound0187.3, %bound1188.3
  %conflict.rdx.3 = or i1 %found.conflict.3, %found.conflict189.3
  %bound0190.3 = icmp ult float* %scevgep.3, %scevgep185.3
  %bound1191.3 = icmp ult float* %scevgep183.3, %scevgep172.3
  %found.conflict192.3 = and i1 %bound0190.3, %bound1191.3
  %conflict.rdx193.3 = or i1 %conflict.rdx.3, %found.conflict192.3
  %bound0194.3 = icmp ult float* %scevgep174.3, %scevgep181.3
  %bound1195.3 = icmp ult float* %scevgep178.3, %scevgep176.3
  %found.conflict196.3 = and i1 %bound0194.3, %bound1195.3
  %conflict.rdx197.3 = or i1 %conflict.rdx193.3, %found.conflict196.3
  %bound0198.3 = icmp ult float* %scevgep174.3, %scevgep185.3
  %bound1199.3 = icmp ult float* %scevgep183.3, %scevgep176.3
  %found.conflict200.3 = and i1 %bound0198.3, %bound1199.3
  %conflict.rdx201.3 = or i1 %conflict.rdx197.3, %found.conflict200.3
  %bound0202.3 = icmp ult float* %scevgep178.3, %scevgep185.3
  %bound1203.3 = icmp ult float* %scevgep183.3, %scevgep181.3
  %found.conflict204.3 = and i1 %bound0202.3, %bound1203.3
  %conflict.rdx205.3 = or i1 %conflict.rdx201.3, %found.conflict204.3
  br i1 %conflict.rdx205.3, label %for.body11.us.preheader.3, label %vector.ph.3

vector.ph.3:                                      ; preds = %vector.memcheck.3
  %broadcast.splatinsert209.3 = insertelement <4 x float> undef, float %624, i32 0
  %broadcast.splat210.3 = shufflevector <4 x float> %broadcast.splatinsert209.3, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert212.3 = insertelement <4 x float> undef, float %625, i32 0
  %broadcast.splat213.3 = shufflevector <4 x float> %broadcast.splatinsert212.3, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block.unr-lcssa.3, label %vector.ph.new.3

vector.ph.new.3:                                  ; preds = %vector.ph.3
  br label %vector.body.3

vector.body.3:                                    ; preds = %vector.body.3, %vector.ph.new.3
  %index.3 = phi i64 [ 0, %vector.ph.new.3 ], [ %index.next.3.3, %vector.body.3 ]
  %niter.3 = phi i64 [ 4, %vector.ph.new.3 ], [ %niter.nsub.3.3, %vector.body.3 ]
  %631 = trunc i64 %index.3 to i32
  %632 = add i32 %631, %628
  %633 = add i32 %632, 16
  %634 = sext i32 %633 to i64
  %635 = getelementptr inbounds float, float* %data_real, i64 %634
  %636 = bitcast float* %635 to <4 x float>*
  %wide.load.355 = load <4 x float>, <4 x float>* %636, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %637 = fmul <4 x float> %broadcast.splat210.3, %wide.load.355
  %638 = getelementptr inbounds float, float* %data_imag, i64 %634
  %639 = bitcast float* %638 to <4 x float>*
  %wide.load211.356 = load <4 x float>, <4 x float>* %639, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %640 = fmul <4 x float> %broadcast.splat213.3, %wide.load211.356
  %641 = fsub <4 x float> %637, %640
  %642 = fmul <4 x float> %broadcast.splat213.3, %wide.load.355
  %643 = fmul <4 x float> %broadcast.splat210.3, %wide.load211.356
  %644 = fadd <4 x float> %642, %643
  %645 = add nuw nsw i64 %index.3, %627
  %646 = getelementptr inbounds float, float* %data_real, i64 %645
  %647 = bitcast float* %646 to <4 x float>*
  %wide.load214.357 = load <4 x float>, <4 x float>* %647, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %648 = fsub <4 x float> %wide.load214.357, %641
  %649 = bitcast float* %635 to <4 x float>*
  store <4 x float> %648, <4 x float>* %649, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %650 = bitcast float* %646 to <4 x float>*
  %wide.load215.358 = load <4 x float>, <4 x float>* %650, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %651 = fadd <4 x float> %641, %wide.load215.358
  %652 = bitcast float* %646 to <4 x float>*
  store <4 x float> %651, <4 x float>* %652, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %653 = getelementptr inbounds float, float* %data_imag, i64 %645
  %654 = bitcast float* %653 to <4 x float>*
  %wide.load216.359 = load <4 x float>, <4 x float>* %654, align 4, !tbaa !2, !alias.scope !33
  %655 = fsub <4 x float> %wide.load216.359, %644
  %656 = bitcast float* %638 to <4 x float>*
  store <4 x float> %655, <4 x float>* %656, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %657 = bitcast float* %653 to <4 x float>*
  %wide.load217.360 = load <4 x float>, <4 x float>* %657, align 4, !tbaa !2, !alias.scope !33
  %658 = fadd <4 x float> %644, %wide.load217.360
  %659 = bitcast float* %653 to <4 x float>*
  store <4 x float> %658, <4 x float>* %659, align 4, !tbaa !2, !alias.scope !33
  %index.next.361 = add nuw nsw i64 %index.3, 4
  %niter.nsub.362 = sub i64 %niter.3, 1
  %660 = trunc i64 %index.next.361 to i32
  %661 = add i32 %660, %628
  %662 = add i32 %661, 16
  %663 = sext i32 %662 to i64
  %664 = getelementptr inbounds float, float* %data_real, i64 %663
  %665 = bitcast float* %664 to <4 x float>*
  %wide.load.1.3 = load <4 x float>, <4 x float>* %665, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %666 = fmul <4 x float> %broadcast.splat210.3, %wide.load.1.3
  %667 = getelementptr inbounds float, float* %data_imag, i64 %663
  %668 = bitcast float* %667 to <4 x float>*
  %wide.load211.1.3 = load <4 x float>, <4 x float>* %668, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %669 = fmul <4 x float> %broadcast.splat213.3, %wide.load211.1.3
  %670 = fsub <4 x float> %666, %669
  %671 = fmul <4 x float> %broadcast.splat213.3, %wide.load.1.3
  %672 = fmul <4 x float> %broadcast.splat210.3, %wide.load211.1.3
  %673 = fadd <4 x float> %671, %672
  %674 = add nuw nsw i64 %index.next.361, %627
  %675 = getelementptr inbounds float, float* %data_real, i64 %674
  %676 = bitcast float* %675 to <4 x float>*
  %wide.load214.1.3 = load <4 x float>, <4 x float>* %676, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %677 = fsub <4 x float> %wide.load214.1.3, %670
  %678 = bitcast float* %664 to <4 x float>*
  store <4 x float> %677, <4 x float>* %678, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %679 = bitcast float* %675 to <4 x float>*
  %wide.load215.1.3 = load <4 x float>, <4 x float>* %679, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %680 = fadd <4 x float> %670, %wide.load215.1.3
  %681 = bitcast float* %675 to <4 x float>*
  store <4 x float> %680, <4 x float>* %681, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %682 = getelementptr inbounds float, float* %data_imag, i64 %674
  %683 = bitcast float* %682 to <4 x float>*
  %wide.load216.1.3 = load <4 x float>, <4 x float>* %683, align 4, !tbaa !2, !alias.scope !33
  %684 = fsub <4 x float> %wide.load216.1.3, %673
  %685 = bitcast float* %667 to <4 x float>*
  store <4 x float> %684, <4 x float>* %685, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %686 = bitcast float* %682 to <4 x float>*
  %wide.load217.1.3 = load <4 x float>, <4 x float>* %686, align 4, !tbaa !2, !alias.scope !33
  %687 = fadd <4 x float> %673, %wide.load217.1.3
  %688 = bitcast float* %682 to <4 x float>*
  store <4 x float> %687, <4 x float>* %688, align 4, !tbaa !2, !alias.scope !33
  %index.next.1.3 = add nuw nsw i64 %index.next.361, 4
  %niter.nsub.1.3 = sub i64 %niter.nsub.362, 1
  %689 = trunc i64 %index.next.1.3 to i32
  %690 = add i32 %689, %628
  %691 = add i32 %690, 16
  %692 = sext i32 %691 to i64
  %693 = getelementptr inbounds float, float* %data_real, i64 %692
  %694 = bitcast float* %693 to <4 x float>*
  %wide.load.2.3 = load <4 x float>, <4 x float>* %694, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %695 = fmul <4 x float> %broadcast.splat210.3, %wide.load.2.3
  %696 = getelementptr inbounds float, float* %data_imag, i64 %692
  %697 = bitcast float* %696 to <4 x float>*
  %wide.load211.2.3 = load <4 x float>, <4 x float>* %697, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %698 = fmul <4 x float> %broadcast.splat213.3, %wide.load211.2.3
  %699 = fsub <4 x float> %695, %698
  %700 = fmul <4 x float> %broadcast.splat213.3, %wide.load.2.3
  %701 = fmul <4 x float> %broadcast.splat210.3, %wide.load211.2.3
  %702 = fadd <4 x float> %700, %701
  %703 = add nuw nsw i64 %index.next.1.3, %627
  %704 = getelementptr inbounds float, float* %data_real, i64 %703
  %705 = bitcast float* %704 to <4 x float>*
  %wide.load214.2.3 = load <4 x float>, <4 x float>* %705, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %706 = fsub <4 x float> %wide.load214.2.3, %699
  %707 = bitcast float* %693 to <4 x float>*
  store <4 x float> %706, <4 x float>* %707, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %708 = bitcast float* %704 to <4 x float>*
  %wide.load215.2.3 = load <4 x float>, <4 x float>* %708, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %709 = fadd <4 x float> %699, %wide.load215.2.3
  %710 = bitcast float* %704 to <4 x float>*
  store <4 x float> %709, <4 x float>* %710, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %711 = getelementptr inbounds float, float* %data_imag, i64 %703
  %712 = bitcast float* %711 to <4 x float>*
  %wide.load216.2.3 = load <4 x float>, <4 x float>* %712, align 4, !tbaa !2, !alias.scope !33
  %713 = fsub <4 x float> %wide.load216.2.3, %702
  %714 = bitcast float* %696 to <4 x float>*
  store <4 x float> %713, <4 x float>* %714, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %715 = bitcast float* %711 to <4 x float>*
  %wide.load217.2.3 = load <4 x float>, <4 x float>* %715, align 4, !tbaa !2, !alias.scope !33
  %716 = fadd <4 x float> %702, %wide.load217.2.3
  %717 = bitcast float* %711 to <4 x float>*
  store <4 x float> %716, <4 x float>* %717, align 4, !tbaa !2, !alias.scope !33
  %index.next.2.3 = add nuw nsw i64 %index.next.1.3, 4
  %niter.nsub.2.3 = sub i64 %niter.nsub.1.3, 1
  %718 = trunc i64 %index.next.2.3 to i32
  %719 = add i32 %718, %628
  %720 = add i32 %719, 16
  %721 = sext i32 %720 to i64
  %722 = getelementptr inbounds float, float* %data_real, i64 %721
  %723 = bitcast float* %722 to <4 x float>*
  %wide.load.3.3 = load <4 x float>, <4 x float>* %723, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %724 = fmul <4 x float> %broadcast.splat210.3, %wide.load.3.3
  %725 = getelementptr inbounds float, float* %data_imag, i64 %721
  %726 = bitcast float* %725 to <4 x float>*
  %wide.load211.3.3 = load <4 x float>, <4 x float>* %726, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %727 = fmul <4 x float> %broadcast.splat213.3, %wide.load211.3.3
  %728 = fsub <4 x float> %724, %727
  %729 = fmul <4 x float> %broadcast.splat213.3, %wide.load.3.3
  %730 = fmul <4 x float> %broadcast.splat210.3, %wide.load211.3.3
  %731 = fadd <4 x float> %729, %730
  %732 = add nuw nsw i64 %index.next.2.3, %627
  %733 = getelementptr inbounds float, float* %data_real, i64 %732
  %734 = bitcast float* %733 to <4 x float>*
  %wide.load214.3.3 = load <4 x float>, <4 x float>* %734, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %735 = fsub <4 x float> %wide.load214.3.3, %728
  %736 = bitcast float* %722 to <4 x float>*
  store <4 x float> %735, <4 x float>* %736, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %737 = bitcast float* %733 to <4 x float>*
  %wide.load215.3.3 = load <4 x float>, <4 x float>* %737, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %738 = fadd <4 x float> %728, %wide.load215.3.3
  %739 = bitcast float* %733 to <4 x float>*
  store <4 x float> %738, <4 x float>* %739, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %740 = getelementptr inbounds float, float* %data_imag, i64 %732
  %741 = bitcast float* %740 to <4 x float>*
  %wide.load216.3.3 = load <4 x float>, <4 x float>* %741, align 4, !tbaa !2, !alias.scope !33
  %742 = fsub <4 x float> %wide.load216.3.3, %731
  %743 = bitcast float* %725 to <4 x float>*
  store <4 x float> %742, <4 x float>* %743, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %744 = bitcast float* %740 to <4 x float>*
  %wide.load217.3.3 = load <4 x float>, <4 x float>* %744, align 4, !tbaa !2, !alias.scope !33
  %745 = fadd <4 x float> %731, %wide.load217.3.3
  %746 = bitcast float* %740 to <4 x float>*
  store <4 x float> %745, <4 x float>* %746, align 4, !tbaa !2, !alias.scope !33
  %index.next.3.3 = add i64 %index.next.2.3, 4
  %niter.nsub.3.3 = sub i64 %niter.nsub.2.3, 1
  %niter.ncmp.3.3 = icmp eq i64 %niter.nsub.3.3, 0
  br i1 %niter.ncmp.3.3, label %middle.block.unr-lcssa.loopexit.3, label %vector.body.3, !llvm.loop !36

middle.block.unr-lcssa.loopexit.3:                ; preds = %vector.body.3
  %index.unr.ph.3 = phi i64 [ %index.next.3.3, %vector.body.3 ]
  br label %middle.block.unr-lcssa.3

middle.block.unr-lcssa.3:                         ; preds = %middle.block.unr-lcssa.loopexit.3, %vector.ph.3
  %index.unr.3 = phi i64 [ 0, %vector.ph.3 ], [ %index.unr.ph.3, %middle.block.unr-lcssa.loopexit.3 ]
  br i1 false, label %vector.body.epil.preheader.3, label %middle.block.3

vector.body.epil.preheader.3:                     ; preds = %middle.block.unr-lcssa.3
  br label %vector.body.epil.3

vector.body.epil.3:                               ; preds = %vector.body.epil.3, %vector.body.epil.preheader.3
  %index.epil.3 = phi i64 [ %index.unr.3, %vector.body.epil.preheader.3 ], [ %index.next.epil.3, %vector.body.epil.3 ]
  %epil.iter.3 = phi i64 [ 0, %vector.body.epil.preheader.3 ], [ %epil.iter.sub.3, %vector.body.epil.3 ]
  %747 = trunc i64 %index.epil.3 to i32
  %748 = add i32 %747, %628
  %749 = add i32 %748, 16
  %750 = sext i32 %749 to i64
  %751 = getelementptr inbounds float, float* %data_real, i64 %750
  %752 = bitcast float* %751 to <4 x float>*
  %wide.load.epil.3 = load <4 x float>, <4 x float>* %752, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %753 = fmul <4 x float> %broadcast.splat210.3, %wide.load.epil.3
  %754 = getelementptr inbounds float, float* %data_imag, i64 %750
  %755 = bitcast float* %754 to <4 x float>*
  %wide.load211.epil.3 = load <4 x float>, <4 x float>* %755, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %756 = fmul <4 x float> %broadcast.splat213.3, %wide.load211.epil.3
  %757 = fsub <4 x float> %753, %756
  %758 = fmul <4 x float> %broadcast.splat213.3, %wide.load.epil.3
  %759 = fmul <4 x float> %broadcast.splat210.3, %wide.load211.epil.3
  %760 = fadd <4 x float> %758, %759
  %761 = add nuw nsw i64 %index.epil.3, %627
  %762 = getelementptr inbounds float, float* %data_real, i64 %761
  %763 = bitcast float* %762 to <4 x float>*
  %wide.load214.epil.3 = load <4 x float>, <4 x float>* %763, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %764 = fsub <4 x float> %wide.load214.epil.3, %757
  %765 = bitcast float* %751 to <4 x float>*
  store <4 x float> %764, <4 x float>* %765, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %766 = bitcast float* %762 to <4 x float>*
  %wide.load215.epil.3 = load <4 x float>, <4 x float>* %766, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %767 = fadd <4 x float> %757, %wide.load215.epil.3
  %768 = bitcast float* %762 to <4 x float>*
  store <4 x float> %767, <4 x float>* %768, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %769 = getelementptr inbounds float, float* %data_imag, i64 %761
  %770 = bitcast float* %769 to <4 x float>*
  %wide.load216.epil.3 = load <4 x float>, <4 x float>* %770, align 4, !tbaa !2, !alias.scope !33
  %771 = fsub <4 x float> %wide.load216.epil.3, %760
  %772 = bitcast float* %754 to <4 x float>*
  store <4 x float> %771, <4 x float>* %772, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %773 = bitcast float* %769 to <4 x float>*
  %wide.load217.epil.3 = load <4 x float>, <4 x float>* %773, align 4, !tbaa !2, !alias.scope !33
  %774 = fadd <4 x float> %760, %wide.load217.epil.3
  %775 = bitcast float* %769 to <4 x float>*
  store <4 x float> %774, <4 x float>* %775, align 4, !tbaa !2, !alias.scope !33
  %index.next.epil.3 = add i64 %index.epil.3, 4
  %epil.iter.sub.3 = sub i64 %epil.iter.3, 1
  %epil.iter.cmp.3 = icmp ne i64 %epil.iter.sub.3, 0
  br i1 %epil.iter.cmp.3, label %vector.body.epil.3, label %middle.block.epilog-lcssa.3, !llvm.loop !37

middle.block.epilog-lcssa.3:                      ; preds = %vector.body.epil.3
  br label %middle.block.3

middle.block.3:                                   ; preds = %middle.block.epilog-lcssa.3, %middle.block.unr-lcssa.3
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.3, label %for.body11.us.preheader.3

for.body11.us.preheader.3:                        ; preds = %middle.block.3, %vector.memcheck.3, %vector.scevcheck.3, %for.body3.us.3
  %indvars.iv.ph.3 = phi i64 [ 0, %vector.memcheck.3 ], [ 0, %vector.scevcheck.3 ], [ 0, %for.body3.us.3 ], [ 16, %middle.block.3 ]
  %776 = sub i64 16, %indvars.iv.ph.3
  %777 = sub i64 15, %indvars.iv.ph.3
  br i1 false, label %for.body11.us.prol.preheader.3, label %for.body11.us.prol.loopexit.3

for.body11.us.prol.preheader.3:                   ; preds = %for.body11.us.preheader.3
  br label %for.body11.us.prol.3

for.body11.us.prol.3:                             ; preds = %for.body11.us.prol.3, %for.body11.us.prol.preheader.3
  %indvars.iv.prol.3 = phi i64 [ %indvars.iv.next.prol.3, %for.body11.us.prol.3 ], [ %indvars.iv.ph.3, %for.body11.us.prol.preheader.3 ]
  %prol.iter.3 = phi i64 [ 0, %for.body11.us.prol.preheader.3 ], [ %prol.iter.sub.3, %for.body11.us.prol.3 ]
  %778 = trunc i64 %indvars.iv.prol.3 to i32
  %add13.us.prol.3 = add i32 %778, %628
  %add14.us.prol.3 = add i32 %add13.us.prol.3, 16
  %idxprom15.us.prol.3 = sext i32 %add14.us.prol.3 to i64
  %arrayidx16.us.prol.3 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.prol.3
  %779 = load float, float* %arrayidx16.us.prol.3, align 4, !tbaa !2
  %mul17.us.prol.3 = fmul float %624, %779
  %arrayidx23.us.prol.3 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.prol.3
  %780 = load float, float* %arrayidx23.us.prol.3, align 4, !tbaa !2
  %mul24.us.prol.3 = fmul float %625, %780
  %sub25.us.prol.3 = fsub float %mul17.us.prol.3, %mul24.us.prol.3
  %mul32.us.prol.3 = fmul float %625, %779
  %mul39.us.prol.3 = fmul float %624, %780
  %add40.us.prol.3 = fadd float %mul32.us.prol.3, %mul39.us.prol.3
  %781 = add nuw nsw i64 %indvars.iv.prol.3, %627
  %arrayidx45.us.prol.3 = getelementptr inbounds float, float* %data_real, i64 %781
  %782 = load float, float* %arrayidx45.us.prol.3, align 4, !tbaa !2
  %sub46.us.prol.3 = fsub float %782, %sub25.us.prol.3
  store float %sub46.us.prol.3, float* %arrayidx16.us.prol.3, align 4, !tbaa !2
  %783 = load float, float* %arrayidx45.us.prol.3, align 4, !tbaa !2
  %add58.us.prol.3 = fadd float %sub25.us.prol.3, %783
  store float %add58.us.prol.3, float* %arrayidx45.us.prol.3, align 4, !tbaa !2
  %arrayidx63.us.prol.3 = getelementptr inbounds float, float* %data_imag, i64 %781
  %784 = load float, float* %arrayidx63.us.prol.3, align 4, !tbaa !2
  %sub64.us.prol.3 = fsub float %784, %add40.us.prol.3
  store float %sub64.us.prol.3, float* %arrayidx23.us.prol.3, align 4, !tbaa !2
  %785 = load float, float* %arrayidx63.us.prol.3, align 4, !tbaa !2
  %add76.us.prol.3 = fadd float %add40.us.prol.3, %785
  store float %add76.us.prol.3, float* %arrayidx63.us.prol.3, align 4, !tbaa !2
  %indvars.iv.next.prol.3 = add nuw nsw i64 %indvars.iv.prol.3, 1
  %prol.iter.sub.3 = sub i64 %prol.iter.3, 1
  %prol.iter.cmp.3 = icmp ne i64 %prol.iter.sub.3, 0
  br i1 %prol.iter.cmp.3, label %for.body11.us.prol.3, label %for.body11.us.prol.loopexit.unr-lcssa.3, !llvm.loop !38

for.body11.us.prol.loopexit.unr-lcssa.3:          ; preds = %for.body11.us.prol.3
  %indvars.iv.unr.ph.3 = phi i64 [ %indvars.iv.next.prol.3, %for.body11.us.prol.3 ]
  br label %for.body11.us.prol.loopexit.3

for.body11.us.prol.loopexit.3:                    ; preds = %for.body11.us.prol.loopexit.unr-lcssa.3, %for.body11.us.preheader.3
  %indvars.iv.unr.3 = phi i64 [ %indvars.iv.ph.3, %for.body11.us.preheader.3 ], [ %indvars.iv.unr.ph.3, %for.body11.us.prol.loopexit.unr-lcssa.3 ]
  %786 = icmp ult i64 %777, 3
  br i1 %786, label %for.cond9.for.inc77_crit_edge.us.loopexit.3, label %for.body11.us.preheader.new.3

for.body11.us.preheader.new.3:                    ; preds = %for.body11.us.prol.loopexit.3
  br label %for.body11.us.3

for.body11.us.3:                                  ; preds = %for.body11.us.3, %for.body11.us.preheader.new.3
  %indvars.iv.3 = phi i64 [ %indvars.iv.unr.3, %for.body11.us.preheader.new.3 ], [ %indvars.iv.next.3.3, %for.body11.us.3 ]
  %787 = trunc i64 %indvars.iv.3 to i32
  %add13.us.363 = add i32 %787, %628
  %add14.us.364 = add i32 %add13.us.363, 16
  %idxprom15.us.365 = sext i32 %add14.us.364 to i64
  %arrayidx16.us.366 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.365
  %788 = load float, float* %arrayidx16.us.366, align 4, !tbaa !2
  %mul17.us.367 = fmul float %624, %788
  %arrayidx23.us.368 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.365
  %789 = load float, float* %arrayidx23.us.368, align 4, !tbaa !2
  %mul24.us.369 = fmul float %625, %789
  %sub25.us.370 = fsub float %mul17.us.367, %mul24.us.369
  %mul32.us.371 = fmul float %625, %788
  %mul39.us.372 = fmul float %624, %789
  %add40.us.373 = fadd float %mul32.us.371, %mul39.us.372
  %790 = add nuw nsw i64 %indvars.iv.3, %627
  %arrayidx45.us.374 = getelementptr inbounds float, float* %data_real, i64 %790
  %791 = load float, float* %arrayidx45.us.374, align 4, !tbaa !2
  %sub46.us.375 = fsub float %791, %sub25.us.370
  store float %sub46.us.375, float* %arrayidx16.us.366, align 4, !tbaa !2
  %792 = load float, float* %arrayidx45.us.374, align 4, !tbaa !2
  %add58.us.376 = fadd float %sub25.us.370, %792
  store float %add58.us.376, float* %arrayidx45.us.374, align 4, !tbaa !2
  %arrayidx63.us.377 = getelementptr inbounds float, float* %data_imag, i64 %790
  %793 = load float, float* %arrayidx63.us.377, align 4, !tbaa !2
  %sub64.us.378 = fsub float %793, %add40.us.373
  store float %sub64.us.378, float* %arrayidx23.us.368, align 4, !tbaa !2
  %794 = load float, float* %arrayidx63.us.377, align 4, !tbaa !2
  %add76.us.379 = fadd float %add40.us.373, %794
  store float %add76.us.379, float* %arrayidx63.us.377, align 4, !tbaa !2
  %indvars.iv.next.380 = add nuw nsw i64 %indvars.iv.3, 1
  %795 = trunc i64 %indvars.iv.next.380 to i32
  %add13.us.1.3 = add i32 %795, %628
  %add14.us.1.3 = add i32 %add13.us.1.3, 16
  %idxprom15.us.1.3 = sext i32 %add14.us.1.3 to i64
  %arrayidx16.us.1.3 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.3
  %796 = load float, float* %arrayidx16.us.1.3, align 4, !tbaa !2
  %mul17.us.1.3 = fmul float %624, %796
  %arrayidx23.us.1.3 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.3
  %797 = load float, float* %arrayidx23.us.1.3, align 4, !tbaa !2
  %mul24.us.1.3 = fmul float %625, %797
  %sub25.us.1.3 = fsub float %mul17.us.1.3, %mul24.us.1.3
  %mul32.us.1.3 = fmul float %625, %796
  %mul39.us.1.3 = fmul float %624, %797
  %add40.us.1.3 = fadd float %mul32.us.1.3, %mul39.us.1.3
  %798 = add nuw nsw i64 %indvars.iv.next.380, %627
  %arrayidx45.us.1.3 = getelementptr inbounds float, float* %data_real, i64 %798
  %799 = load float, float* %arrayidx45.us.1.3, align 4, !tbaa !2
  %sub46.us.1.3 = fsub float %799, %sub25.us.1.3
  store float %sub46.us.1.3, float* %arrayidx16.us.1.3, align 4, !tbaa !2
  %800 = load float, float* %arrayidx45.us.1.3, align 4, !tbaa !2
  %add58.us.1.3 = fadd float %sub25.us.1.3, %800
  store float %add58.us.1.3, float* %arrayidx45.us.1.3, align 4, !tbaa !2
  %arrayidx63.us.1.3 = getelementptr inbounds float, float* %data_imag, i64 %798
  %801 = load float, float* %arrayidx63.us.1.3, align 4, !tbaa !2
  %sub64.us.1.3 = fsub float %801, %add40.us.1.3
  store float %sub64.us.1.3, float* %arrayidx23.us.1.3, align 4, !tbaa !2
  %802 = load float, float* %arrayidx63.us.1.3, align 4, !tbaa !2
  %add76.us.1.3 = fadd float %add40.us.1.3, %802
  store float %add76.us.1.3, float* %arrayidx63.us.1.3, align 4, !tbaa !2
  %indvars.iv.next.1.3 = add nuw nsw i64 %indvars.iv.next.380, 1
  %803 = trunc i64 %indvars.iv.next.1.3 to i32
  %add13.us.2.3 = add i32 %803, %628
  %add14.us.2.3 = add i32 %add13.us.2.3, 16
  %idxprom15.us.2.3 = sext i32 %add14.us.2.3 to i64
  %arrayidx16.us.2.3 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.3
  %804 = load float, float* %arrayidx16.us.2.3, align 4, !tbaa !2
  %mul17.us.2.3 = fmul float %624, %804
  %arrayidx23.us.2.3 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.3
  %805 = load float, float* %arrayidx23.us.2.3, align 4, !tbaa !2
  %mul24.us.2.3 = fmul float %625, %805
  %sub25.us.2.3 = fsub float %mul17.us.2.3, %mul24.us.2.3
  %mul32.us.2.3 = fmul float %625, %804
  %mul39.us.2.3 = fmul float %624, %805
  %add40.us.2.3 = fadd float %mul32.us.2.3, %mul39.us.2.3
  %806 = add nuw nsw i64 %indvars.iv.next.1.3, %627
  %arrayidx45.us.2.3 = getelementptr inbounds float, float* %data_real, i64 %806
  %807 = load float, float* %arrayidx45.us.2.3, align 4, !tbaa !2
  %sub46.us.2.3 = fsub float %807, %sub25.us.2.3
  store float %sub46.us.2.3, float* %arrayidx16.us.2.3, align 4, !tbaa !2
  %808 = load float, float* %arrayidx45.us.2.3, align 4, !tbaa !2
  %add58.us.2.3 = fadd float %sub25.us.2.3, %808
  store float %add58.us.2.3, float* %arrayidx45.us.2.3, align 4, !tbaa !2
  %arrayidx63.us.2.3 = getelementptr inbounds float, float* %data_imag, i64 %806
  %809 = load float, float* %arrayidx63.us.2.3, align 4, !tbaa !2
  %sub64.us.2.3 = fsub float %809, %add40.us.2.3
  store float %sub64.us.2.3, float* %arrayidx23.us.2.3, align 4, !tbaa !2
  %810 = load float, float* %arrayidx63.us.2.3, align 4, !tbaa !2
  %add76.us.2.3 = fadd float %add40.us.2.3, %810
  store float %add76.us.2.3, float* %arrayidx63.us.2.3, align 4, !tbaa !2
  %indvars.iv.next.2.3 = add nuw nsw i64 %indvars.iv.next.1.3, 1
  %811 = trunc i64 %indvars.iv.next.2.3 to i32
  %add13.us.3.3 = add i32 %811, %628
  %add14.us.3.3 = add i32 %add13.us.3.3, 16
  %idxprom15.us.3.3 = sext i32 %add14.us.3.3 to i64
  %arrayidx16.us.3.3 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.3
  %812 = load float, float* %arrayidx16.us.3.3, align 4, !tbaa !2
  %mul17.us.3.3 = fmul float %624, %812
  %arrayidx23.us.3.3 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.3
  %813 = load float, float* %arrayidx23.us.3.3, align 4, !tbaa !2
  %mul24.us.3.3 = fmul float %625, %813
  %sub25.us.3.3 = fsub float %mul17.us.3.3, %mul24.us.3.3
  %mul32.us.3.3 = fmul float %625, %812
  %mul39.us.3.3 = fmul float %624, %813
  %add40.us.3.3 = fadd float %mul32.us.3.3, %mul39.us.3.3
  %814 = add nuw nsw i64 %indvars.iv.next.2.3, %627
  %arrayidx45.us.3.3 = getelementptr inbounds float, float* %data_real, i64 %814
  %815 = load float, float* %arrayidx45.us.3.3, align 4, !tbaa !2
  %sub46.us.3.3 = fsub float %815, %sub25.us.3.3
  store float %sub46.us.3.3, float* %arrayidx16.us.3.3, align 4, !tbaa !2
  %816 = load float, float* %arrayidx45.us.3.3, align 4, !tbaa !2
  %add58.us.3.3 = fadd float %sub25.us.3.3, %816
  store float %add58.us.3.3, float* %arrayidx45.us.3.3, align 4, !tbaa !2
  %arrayidx63.us.3.3 = getelementptr inbounds float, float* %data_imag, i64 %814
  %817 = load float, float* %arrayidx63.us.3.3, align 4, !tbaa !2
  %sub64.us.3.3 = fsub float %817, %add40.us.3.3
  store float %sub64.us.3.3, float* %arrayidx23.us.3.3, align 4, !tbaa !2
  %818 = load float, float* %arrayidx63.us.3.3, align 4, !tbaa !2
  %add76.us.3.3 = fadd float %add40.us.3.3, %818
  store float %add76.us.3.3, float* %arrayidx63.us.3.3, align 4, !tbaa !2
  %indvars.iv.next.3.3 = add nuw nsw i64 %indvars.iv.next.2.3, 1
  %exitcond.3.3 = icmp eq i64 %indvars.iv.next.3.3, 16
  br i1 %exitcond.3.3, label %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.3, label %for.body11.us.3, !llvm.loop !39

for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.3: ; preds = %for.body11.us.3
  br label %for.cond9.for.inc77_crit_edge.us.loopexit.3

for.cond9.for.inc77_crit_edge.us.loopexit.3:      ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.3, %for.body11.us.prol.loopexit.3
  br label %for.cond9.for.inc77_crit_edge.us.3

for.cond9.for.inc77_crit_edge.us.3:               ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.3, %middle.block.3
  %indvars.iv.next163.3 = add nuw nsw i64 %indvars.iv162.3, 1
  %exitcond168.3 = icmp eq i64 %indvars.iv.next163.3, 8
  br i1 %exitcond168.3, label %for.end79.loopexit.3, label %for.body3.us.3

for.end79.loopexit.3:                             ; preds = %for.cond9.for.inc77_crit_edge.us.3
  br label %for.end79.3

for.end79.3:                                      ; preds = %for.end79.loopexit.3, %for.end79.2
  br i1 true, label %for.body3.us.preheader.4, label %for.end79.4

for.body3.us.preheader.4:                         ; preds = %for.end79.3
  %scevgep171.4 = getelementptr float, float* %data_real, i64 8
  %scevgep180.4 = getelementptr float, float* %data_imag, i64 8
  br label %for.body3.us.4

for.body3.us.4:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.4, %for.body3.us.preheader.4
  %indvars.iv162.4 = phi i64 [ 0, %for.body3.us.preheader.4 ], [ %indvars.iv.next163.4, %for.cond9.for.inc77_crit_edge.us.4 ]
  %819 = trunc i64 %indvars.iv162.4 to i32
  %820 = mul i32 16, %819
  %821 = add i32 8, %820
  %822 = sext i32 %821 to i64
  %scevgep.4 = getelementptr float, float* %data_real, i64 %822
  %scevgep172.4 = getelementptr float, float* %scevgep171.4, i64 %822
  %823 = mul i64 16, %indvars.iv162.4
  %scevgep174.4 = getelementptr float, float* %data_real, i64 %823
  %824 = add i64 %823, 8
  %scevgep176.4 = getelementptr float, float* %data_real, i64 %824
  %scevgep178.4 = getelementptr float, float* %data_imag, i64 %822
  %scevgep181.4 = getelementptr float, float* %scevgep180.4, i64 %822
  %scevgep183.4 = getelementptr float, float* %data_imag, i64 %823
  %scevgep185.4 = getelementptr float, float* %data_imag, i64 %824
  %825 = trunc i64 %indvars.iv162.4 to i32
  %826 = mul i32 16, %825
  %827 = add i32 8, %826
  %828 = add nsw i64 %indvars.iv162.4, 15
  %arrayidx.us.4 = getelementptr inbounds float, float* %coef_real, i64 %828
  %829 = load float, float* %arrayidx.us.4, align 4, !tbaa !2
  %arrayidx8.us.4 = getelementptr inbounds float, float* %coef_imag, i64 %828
  %830 = load float, float* %arrayidx8.us.4, align 4, !tbaa !2
  %831 = shl nuw nsw i64 %indvars.iv162.4, 1
  %832 = mul nsw i64 %831, 8
  %833 = trunc i64 %832 to i32
  br i1 false, label %for.body11.us.preheader.4, label %vector.scevcheck.4

vector.scevcheck.4:                               ; preds = %for.body3.us.4
  %834 = add i32 %827, 7
  %835 = icmp slt i32 %834, %827
  br i1 %835, label %for.body11.us.preheader.4, label %vector.memcheck.4

vector.memcheck.4:                                ; preds = %vector.scevcheck.4
  %bound0.4 = icmp ult float* %scevgep.4, %scevgep176.4
  %bound1.4 = icmp ult float* %scevgep174.4, %scevgep172.4
  %found.conflict.4 = and i1 %bound0.4, %bound1.4
  %bound0187.4 = icmp ugt float* %scevgep180.4, %data_real
  %bound1188.4 = icmp ugt float* %scevgep171.4, %data_imag
  %found.conflict189.4 = and i1 %bound0187.4, %bound1188.4
  %conflict.rdx.4 = or i1 %found.conflict.4, %found.conflict189.4
  %bound0190.4 = icmp ult float* %scevgep.4, %scevgep185.4
  %bound1191.4 = icmp ult float* %scevgep183.4, %scevgep172.4
  %found.conflict192.4 = and i1 %bound0190.4, %bound1191.4
  %conflict.rdx193.4 = or i1 %conflict.rdx.4, %found.conflict192.4
  %bound0194.4 = icmp ult float* %scevgep174.4, %scevgep181.4
  %bound1195.4 = icmp ult float* %scevgep178.4, %scevgep176.4
  %found.conflict196.4 = and i1 %bound0194.4, %bound1195.4
  %conflict.rdx197.4 = or i1 %conflict.rdx193.4, %found.conflict196.4
  %bound0198.4 = icmp ult float* %scevgep174.4, %scevgep185.4
  %bound1199.4 = icmp ult float* %scevgep183.4, %scevgep176.4
  %found.conflict200.4 = and i1 %bound0198.4, %bound1199.4
  %conflict.rdx201.4 = or i1 %conflict.rdx197.4, %found.conflict200.4
  %bound0202.4 = icmp ult float* %scevgep178.4, %scevgep185.4
  %bound1203.4 = icmp ult float* %scevgep183.4, %scevgep181.4
  %found.conflict204.4 = and i1 %bound0202.4, %bound1203.4
  %conflict.rdx205.4 = or i1 %conflict.rdx201.4, %found.conflict204.4
  br i1 %conflict.rdx205.4, label %for.body11.us.preheader.4, label %vector.ph.4

vector.ph.4:                                      ; preds = %vector.memcheck.4
  %broadcast.splatinsert209.4 = insertelement <4 x float> undef, float %829, i32 0
  %broadcast.splat210.4 = shufflevector <4 x float> %broadcast.splatinsert209.4, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert212.4 = insertelement <4 x float> undef, float %830, i32 0
  %broadcast.splat213.4 = shufflevector <4 x float> %broadcast.splatinsert212.4, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 true, label %middle.block.unr-lcssa.4, label %vector.ph.new.4

vector.ph.new.4:                                  ; preds = %vector.ph.4
  br label %vector.body.4

vector.body.4:                                    ; preds = %vector.body.4, %vector.ph.new.4
  %index.4 = phi i64 [ 0, %vector.ph.new.4 ], [ %index.next.3.4, %vector.body.4 ]
  %niter.4 = phi i64 [ 0, %vector.ph.new.4 ], [ %niter.nsub.3.4, %vector.body.4 ]
  %836 = trunc i64 %index.4 to i32
  %837 = add i32 %836, %833
  %838 = add i32 %837, 8
  %839 = sext i32 %838 to i64
  %840 = getelementptr inbounds float, float* %data_real, i64 %839
  %841 = bitcast float* %840 to <4 x float>*
  %wide.load.4 = load <4 x float>, <4 x float>* %841, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %842 = fmul <4 x float> %broadcast.splat210.4, %wide.load.4
  %843 = getelementptr inbounds float, float* %data_imag, i64 %839
  %844 = bitcast float* %843 to <4 x float>*
  %wide.load211.4 = load <4 x float>, <4 x float>* %844, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %845 = fmul <4 x float> %broadcast.splat213.4, %wide.load211.4
  %846 = fsub <4 x float> %842, %845
  %847 = fmul <4 x float> %broadcast.splat213.4, %wide.load.4
  %848 = fmul <4 x float> %broadcast.splat210.4, %wide.load211.4
  %849 = fadd <4 x float> %847, %848
  %850 = add nuw nsw i64 %index.4, %832
  %851 = getelementptr inbounds float, float* %data_real, i64 %850
  %852 = bitcast float* %851 to <4 x float>*
  %wide.load214.4 = load <4 x float>, <4 x float>* %852, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %853 = fsub <4 x float> %wide.load214.4, %846
  %854 = bitcast float* %840 to <4 x float>*
  store <4 x float> %853, <4 x float>* %854, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %855 = bitcast float* %851 to <4 x float>*
  %wide.load215.4 = load <4 x float>, <4 x float>* %855, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %856 = fadd <4 x float> %846, %wide.load215.4
  %857 = bitcast float* %851 to <4 x float>*
  store <4 x float> %856, <4 x float>* %857, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %858 = getelementptr inbounds float, float* %data_imag, i64 %850
  %859 = bitcast float* %858 to <4 x float>*
  %wide.load216.4 = load <4 x float>, <4 x float>* %859, align 4, !tbaa !2, !alias.scope !33
  %860 = fsub <4 x float> %wide.load216.4, %849
  %861 = bitcast float* %843 to <4 x float>*
  store <4 x float> %860, <4 x float>* %861, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %862 = bitcast float* %858 to <4 x float>*
  %wide.load217.4 = load <4 x float>, <4 x float>* %862, align 4, !tbaa !2, !alias.scope !33
  %863 = fadd <4 x float> %849, %wide.load217.4
  %864 = bitcast float* %858 to <4 x float>*
  store <4 x float> %863, <4 x float>* %864, align 4, !tbaa !2, !alias.scope !33
  %index.next.4 = add nuw nsw i64 %index.4, 4
  %niter.nsub.4 = sub i64 %niter.4, 1
  %865 = trunc i64 %index.next.4 to i32
  %866 = add i32 %865, %833
  %867 = add i32 %866, 8
  %868 = sext i32 %867 to i64
  %869 = getelementptr inbounds float, float* %data_real, i64 %868
  %870 = bitcast float* %869 to <4 x float>*
  %wide.load.1.4 = load <4 x float>, <4 x float>* %870, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %871 = fmul <4 x float> %broadcast.splat210.4, %wide.load.1.4
  %872 = getelementptr inbounds float, float* %data_imag, i64 %868
  %873 = bitcast float* %872 to <4 x float>*
  %wide.load211.1.4 = load <4 x float>, <4 x float>* %873, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %874 = fmul <4 x float> %broadcast.splat213.4, %wide.load211.1.4
  %875 = fsub <4 x float> %871, %874
  %876 = fmul <4 x float> %broadcast.splat213.4, %wide.load.1.4
  %877 = fmul <4 x float> %broadcast.splat210.4, %wide.load211.1.4
  %878 = fadd <4 x float> %876, %877
  %879 = add nuw nsw i64 %index.next.4, %832
  %880 = getelementptr inbounds float, float* %data_real, i64 %879
  %881 = bitcast float* %880 to <4 x float>*
  %wide.load214.1.4 = load <4 x float>, <4 x float>* %881, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %882 = fsub <4 x float> %wide.load214.1.4, %875
  %883 = bitcast float* %869 to <4 x float>*
  store <4 x float> %882, <4 x float>* %883, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %884 = bitcast float* %880 to <4 x float>*
  %wide.load215.1.4 = load <4 x float>, <4 x float>* %884, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %885 = fadd <4 x float> %875, %wide.load215.1.4
  %886 = bitcast float* %880 to <4 x float>*
  store <4 x float> %885, <4 x float>* %886, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %887 = getelementptr inbounds float, float* %data_imag, i64 %879
  %888 = bitcast float* %887 to <4 x float>*
  %wide.load216.1.4 = load <4 x float>, <4 x float>* %888, align 4, !tbaa !2, !alias.scope !33
  %889 = fsub <4 x float> %wide.load216.1.4, %878
  %890 = bitcast float* %872 to <4 x float>*
  store <4 x float> %889, <4 x float>* %890, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %891 = bitcast float* %887 to <4 x float>*
  %wide.load217.1.4 = load <4 x float>, <4 x float>* %891, align 4, !tbaa !2, !alias.scope !33
  %892 = fadd <4 x float> %878, %wide.load217.1.4
  %893 = bitcast float* %887 to <4 x float>*
  store <4 x float> %892, <4 x float>* %893, align 4, !tbaa !2, !alias.scope !33
  %index.next.1.4 = add nuw nsw i64 %index.next.4, 4
  %niter.nsub.1.4 = sub i64 %niter.nsub.4, 1
  %894 = trunc i64 %index.next.1.4 to i32
  %895 = add i32 %894, %833
  %896 = add i32 %895, 8
  %897 = sext i32 %896 to i64
  %898 = getelementptr inbounds float, float* %data_real, i64 %897
  %899 = bitcast float* %898 to <4 x float>*
  %wide.load.2.4 = load <4 x float>, <4 x float>* %899, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %900 = fmul <4 x float> %broadcast.splat210.4, %wide.load.2.4
  %901 = getelementptr inbounds float, float* %data_imag, i64 %897
  %902 = bitcast float* %901 to <4 x float>*
  %wide.load211.2.4 = load <4 x float>, <4 x float>* %902, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %903 = fmul <4 x float> %broadcast.splat213.4, %wide.load211.2.4
  %904 = fsub <4 x float> %900, %903
  %905 = fmul <4 x float> %broadcast.splat213.4, %wide.load.2.4
  %906 = fmul <4 x float> %broadcast.splat210.4, %wide.load211.2.4
  %907 = fadd <4 x float> %905, %906
  %908 = add nuw nsw i64 %index.next.1.4, %832
  %909 = getelementptr inbounds float, float* %data_real, i64 %908
  %910 = bitcast float* %909 to <4 x float>*
  %wide.load214.2.4 = load <4 x float>, <4 x float>* %910, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %911 = fsub <4 x float> %wide.load214.2.4, %904
  %912 = bitcast float* %898 to <4 x float>*
  store <4 x float> %911, <4 x float>* %912, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %913 = bitcast float* %909 to <4 x float>*
  %wide.load215.2.4 = load <4 x float>, <4 x float>* %913, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %914 = fadd <4 x float> %904, %wide.load215.2.4
  %915 = bitcast float* %909 to <4 x float>*
  store <4 x float> %914, <4 x float>* %915, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %916 = getelementptr inbounds float, float* %data_imag, i64 %908
  %917 = bitcast float* %916 to <4 x float>*
  %wide.load216.2.4 = load <4 x float>, <4 x float>* %917, align 4, !tbaa !2, !alias.scope !33
  %918 = fsub <4 x float> %wide.load216.2.4, %907
  %919 = bitcast float* %901 to <4 x float>*
  store <4 x float> %918, <4 x float>* %919, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %920 = bitcast float* %916 to <4 x float>*
  %wide.load217.2.4 = load <4 x float>, <4 x float>* %920, align 4, !tbaa !2, !alias.scope !33
  %921 = fadd <4 x float> %907, %wide.load217.2.4
  %922 = bitcast float* %916 to <4 x float>*
  store <4 x float> %921, <4 x float>* %922, align 4, !tbaa !2, !alias.scope !33
  %index.next.2.4 = add nuw nsw i64 %index.next.1.4, 4
  %niter.nsub.2.4 = sub i64 %niter.nsub.1.4, 1
  %923 = trunc i64 %index.next.2.4 to i32
  %924 = add i32 %923, %833
  %925 = add i32 %924, 8
  %926 = sext i32 %925 to i64
  %927 = getelementptr inbounds float, float* %data_real, i64 %926
  %928 = bitcast float* %927 to <4 x float>*
  %wide.load.3.4 = load <4 x float>, <4 x float>* %928, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %929 = fmul <4 x float> %broadcast.splat210.4, %wide.load.3.4
  %930 = getelementptr inbounds float, float* %data_imag, i64 %926
  %931 = bitcast float* %930 to <4 x float>*
  %wide.load211.3.4 = load <4 x float>, <4 x float>* %931, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %932 = fmul <4 x float> %broadcast.splat213.4, %wide.load211.3.4
  %933 = fsub <4 x float> %929, %932
  %934 = fmul <4 x float> %broadcast.splat213.4, %wide.load.3.4
  %935 = fmul <4 x float> %broadcast.splat210.4, %wide.load211.3.4
  %936 = fadd <4 x float> %934, %935
  %937 = add nuw nsw i64 %index.next.2.4, %832
  %938 = getelementptr inbounds float, float* %data_real, i64 %937
  %939 = bitcast float* %938 to <4 x float>*
  %wide.load214.3.4 = load <4 x float>, <4 x float>* %939, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %940 = fsub <4 x float> %wide.load214.3.4, %933
  %941 = bitcast float* %927 to <4 x float>*
  store <4 x float> %940, <4 x float>* %941, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %942 = bitcast float* %938 to <4 x float>*
  %wide.load215.3.4 = load <4 x float>, <4 x float>* %942, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %943 = fadd <4 x float> %933, %wide.load215.3.4
  %944 = bitcast float* %938 to <4 x float>*
  store <4 x float> %943, <4 x float>* %944, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %945 = getelementptr inbounds float, float* %data_imag, i64 %937
  %946 = bitcast float* %945 to <4 x float>*
  %wide.load216.3.4 = load <4 x float>, <4 x float>* %946, align 4, !tbaa !2, !alias.scope !33
  %947 = fsub <4 x float> %wide.load216.3.4, %936
  %948 = bitcast float* %930 to <4 x float>*
  store <4 x float> %947, <4 x float>* %948, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %949 = bitcast float* %945 to <4 x float>*
  %wide.load217.3.4 = load <4 x float>, <4 x float>* %949, align 4, !tbaa !2, !alias.scope !33
  %950 = fadd <4 x float> %936, %wide.load217.3.4
  %951 = bitcast float* %945 to <4 x float>*
  store <4 x float> %950, <4 x float>* %951, align 4, !tbaa !2, !alias.scope !33
  %index.next.3.4 = add i64 %index.next.2.4, 4
  %niter.nsub.3.4 = sub i64 %niter.nsub.2.4, 1
  %niter.ncmp.3.4 = icmp eq i64 %niter.nsub.3.4, 0
  br i1 %niter.ncmp.3.4, label %middle.block.unr-lcssa.loopexit.4, label %vector.body.4, !llvm.loop !36

middle.block.unr-lcssa.loopexit.4:                ; preds = %vector.body.4
  %index.unr.ph.4 = phi i64 [ %index.next.3.4, %vector.body.4 ]
  br label %middle.block.unr-lcssa.4

middle.block.unr-lcssa.4:                         ; preds = %middle.block.unr-lcssa.loopexit.4, %vector.ph.4
  %index.unr.4 = phi i64 [ 0, %vector.ph.4 ], [ %index.unr.ph.4, %middle.block.unr-lcssa.loopexit.4 ]
  br i1 true, label %vector.body.epil.preheader.4, label %middle.block.4

vector.body.epil.preheader.4:                     ; preds = %middle.block.unr-lcssa.4
  br label %vector.body.epil.4

vector.body.epil.4:                               ; preds = %vector.body.epil.4, %vector.body.epil.preheader.4
  %index.epil.4 = phi i64 [ %index.unr.4, %vector.body.epil.preheader.4 ], [ %index.next.epil.4, %vector.body.epil.4 ]
  %epil.iter.4 = phi i64 [ 2, %vector.body.epil.preheader.4 ], [ %epil.iter.sub.4, %vector.body.epil.4 ]
  %952 = trunc i64 %index.epil.4 to i32
  %953 = add i32 %952, %833
  %954 = add i32 %953, 8
  %955 = sext i32 %954 to i64
  %956 = getelementptr inbounds float, float* %data_real, i64 %955
  %957 = bitcast float* %956 to <4 x float>*
  %wide.load.epil.4 = load <4 x float>, <4 x float>* %957, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %958 = fmul <4 x float> %broadcast.splat210.4, %wide.load.epil.4
  %959 = getelementptr inbounds float, float* %data_imag, i64 %955
  %960 = bitcast float* %959 to <4 x float>*
  %wide.load211.epil.4 = load <4 x float>, <4 x float>* %960, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %961 = fmul <4 x float> %broadcast.splat213.4, %wide.load211.epil.4
  %962 = fsub <4 x float> %958, %961
  %963 = fmul <4 x float> %broadcast.splat213.4, %wide.load.epil.4
  %964 = fmul <4 x float> %broadcast.splat210.4, %wide.load211.epil.4
  %965 = fadd <4 x float> %963, %964
  %966 = add nuw nsw i64 %index.epil.4, %832
  %967 = getelementptr inbounds float, float* %data_real, i64 %966
  %968 = bitcast float* %967 to <4 x float>*
  %wide.load214.epil.4 = load <4 x float>, <4 x float>* %968, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %969 = fsub <4 x float> %wide.load214.epil.4, %962
  %970 = bitcast float* %956 to <4 x float>*
  store <4 x float> %969, <4 x float>* %970, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %971 = bitcast float* %967 to <4 x float>*
  %wide.load215.epil.4 = load <4 x float>, <4 x float>* %971, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %972 = fadd <4 x float> %962, %wide.load215.epil.4
  %973 = bitcast float* %967 to <4 x float>*
  store <4 x float> %972, <4 x float>* %973, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %974 = getelementptr inbounds float, float* %data_imag, i64 %966
  %975 = bitcast float* %974 to <4 x float>*
  %wide.load216.epil.4 = load <4 x float>, <4 x float>* %975, align 4, !tbaa !2, !alias.scope !33
  %976 = fsub <4 x float> %wide.load216.epil.4, %965
  %977 = bitcast float* %959 to <4 x float>*
  store <4 x float> %976, <4 x float>* %977, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %978 = bitcast float* %974 to <4 x float>*
  %wide.load217.epil.4 = load <4 x float>, <4 x float>* %978, align 4, !tbaa !2, !alias.scope !33
  %979 = fadd <4 x float> %965, %wide.load217.epil.4
  %980 = bitcast float* %974 to <4 x float>*
  store <4 x float> %979, <4 x float>* %980, align 4, !tbaa !2, !alias.scope !33
  %index.next.epil.4 = add i64 %index.epil.4, 4
  %epil.iter.sub.4 = sub i64 %epil.iter.4, 1
  %epil.iter.cmp.4 = icmp ne i64 %epil.iter.sub.4, 0
  br i1 %epil.iter.cmp.4, label %vector.body.epil.4, label %middle.block.epilog-lcssa.4, !llvm.loop !37

middle.block.epilog-lcssa.4:                      ; preds = %vector.body.epil.4
  br label %middle.block.4

middle.block.4:                                   ; preds = %middle.block.epilog-lcssa.4, %middle.block.unr-lcssa.4
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.4, label %for.body11.us.preheader.4

for.body11.us.preheader.4:                        ; preds = %middle.block.4, %vector.memcheck.4, %vector.scevcheck.4, %for.body3.us.4
  %indvars.iv.ph.4 = phi i64 [ 0, %vector.memcheck.4 ], [ 0, %vector.scevcheck.4 ], [ 0, %for.body3.us.4 ], [ 8, %middle.block.4 ]
  %981 = sub i64 8, %indvars.iv.ph.4
  %982 = sub i64 7, %indvars.iv.ph.4
  br i1 false, label %for.body11.us.prol.preheader.4, label %for.body11.us.prol.loopexit.4

for.body11.us.prol.preheader.4:                   ; preds = %for.body11.us.preheader.4
  br label %for.body11.us.prol.4

for.body11.us.prol.4:                             ; preds = %for.body11.us.prol.4, %for.body11.us.prol.preheader.4
  %indvars.iv.prol.4 = phi i64 [ %indvars.iv.next.prol.4, %for.body11.us.prol.4 ], [ %indvars.iv.ph.4, %for.body11.us.prol.preheader.4 ]
  %prol.iter.4 = phi i64 [ 0, %for.body11.us.prol.preheader.4 ], [ %prol.iter.sub.4, %for.body11.us.prol.4 ]
  %983 = trunc i64 %indvars.iv.prol.4 to i32
  %add13.us.prol.4 = add i32 %983, %833
  %add14.us.prol.4 = add i32 %add13.us.prol.4, 8
  %idxprom15.us.prol.4 = sext i32 %add14.us.prol.4 to i64
  %arrayidx16.us.prol.4 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.prol.4
  %984 = load float, float* %arrayidx16.us.prol.4, align 4, !tbaa !2
  %mul17.us.prol.4 = fmul float %829, %984
  %arrayidx23.us.prol.4 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.prol.4
  %985 = load float, float* %arrayidx23.us.prol.4, align 4, !tbaa !2
  %mul24.us.prol.4 = fmul float %830, %985
  %sub25.us.prol.4 = fsub float %mul17.us.prol.4, %mul24.us.prol.4
  %mul32.us.prol.4 = fmul float %830, %984
  %mul39.us.prol.4 = fmul float %829, %985
  %add40.us.prol.4 = fadd float %mul32.us.prol.4, %mul39.us.prol.4
  %986 = add nuw nsw i64 %indvars.iv.prol.4, %832
  %arrayidx45.us.prol.4 = getelementptr inbounds float, float* %data_real, i64 %986
  %987 = load float, float* %arrayidx45.us.prol.4, align 4, !tbaa !2
  %sub46.us.prol.4 = fsub float %987, %sub25.us.prol.4
  store float %sub46.us.prol.4, float* %arrayidx16.us.prol.4, align 4, !tbaa !2
  %988 = load float, float* %arrayidx45.us.prol.4, align 4, !tbaa !2
  %add58.us.prol.4 = fadd float %sub25.us.prol.4, %988
  store float %add58.us.prol.4, float* %arrayidx45.us.prol.4, align 4, !tbaa !2
  %arrayidx63.us.prol.4 = getelementptr inbounds float, float* %data_imag, i64 %986
  %989 = load float, float* %arrayidx63.us.prol.4, align 4, !tbaa !2
  %sub64.us.prol.4 = fsub float %989, %add40.us.prol.4
  store float %sub64.us.prol.4, float* %arrayidx23.us.prol.4, align 4, !tbaa !2
  %990 = load float, float* %arrayidx63.us.prol.4, align 4, !tbaa !2
  %add76.us.prol.4 = fadd float %add40.us.prol.4, %990
  store float %add76.us.prol.4, float* %arrayidx63.us.prol.4, align 4, !tbaa !2
  %indvars.iv.next.prol.4 = add nuw nsw i64 %indvars.iv.prol.4, 1
  %prol.iter.sub.4 = sub i64 %prol.iter.4, 1
  %prol.iter.cmp.4 = icmp ne i64 %prol.iter.sub.4, 0
  br i1 %prol.iter.cmp.4, label %for.body11.us.prol.4, label %for.body11.us.prol.loopexit.unr-lcssa.4, !llvm.loop !38

for.body11.us.prol.loopexit.unr-lcssa.4:          ; preds = %for.body11.us.prol.4
  %indvars.iv.unr.ph.4 = phi i64 [ %indvars.iv.next.prol.4, %for.body11.us.prol.4 ]
  br label %for.body11.us.prol.loopexit.4

for.body11.us.prol.loopexit.4:                    ; preds = %for.body11.us.prol.loopexit.unr-lcssa.4, %for.body11.us.preheader.4
  %indvars.iv.unr.4 = phi i64 [ %indvars.iv.ph.4, %for.body11.us.preheader.4 ], [ %indvars.iv.unr.ph.4, %for.body11.us.prol.loopexit.unr-lcssa.4 ]
  %991 = icmp ult i64 %982, 3
  br i1 %991, label %for.cond9.for.inc77_crit_edge.us.loopexit.4, label %for.body11.us.preheader.new.4

for.body11.us.preheader.new.4:                    ; preds = %for.body11.us.prol.loopexit.4
  br label %for.body11.us.4

for.body11.us.4:                                  ; preds = %for.body11.us.4, %for.body11.us.preheader.new.4
  %indvars.iv.4 = phi i64 [ %indvars.iv.unr.4, %for.body11.us.preheader.new.4 ], [ %indvars.iv.next.3.4, %for.body11.us.4 ]
  %992 = trunc i64 %indvars.iv.4 to i32
  %add13.us.4 = add i32 %992, %833
  %add14.us.4 = add i32 %add13.us.4, 8
  %idxprom15.us.4 = sext i32 %add14.us.4 to i64
  %arrayidx16.us.4 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.4
  %993 = load float, float* %arrayidx16.us.4, align 4, !tbaa !2
  %mul17.us.4 = fmul float %829, %993
  %arrayidx23.us.4 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.4
  %994 = load float, float* %arrayidx23.us.4, align 4, !tbaa !2
  %mul24.us.4 = fmul float %830, %994
  %sub25.us.4 = fsub float %mul17.us.4, %mul24.us.4
  %mul32.us.4 = fmul float %830, %993
  %mul39.us.4 = fmul float %829, %994
  %add40.us.4 = fadd float %mul32.us.4, %mul39.us.4
  %995 = add nuw nsw i64 %indvars.iv.4, %832
  %arrayidx45.us.4 = getelementptr inbounds float, float* %data_real, i64 %995
  %996 = load float, float* %arrayidx45.us.4, align 4, !tbaa !2
  %sub46.us.4 = fsub float %996, %sub25.us.4
  store float %sub46.us.4, float* %arrayidx16.us.4, align 4, !tbaa !2
  %997 = load float, float* %arrayidx45.us.4, align 4, !tbaa !2
  %add58.us.4 = fadd float %sub25.us.4, %997
  store float %add58.us.4, float* %arrayidx45.us.4, align 4, !tbaa !2
  %arrayidx63.us.4 = getelementptr inbounds float, float* %data_imag, i64 %995
  %998 = load float, float* %arrayidx63.us.4, align 4, !tbaa !2
  %sub64.us.4 = fsub float %998, %add40.us.4
  store float %sub64.us.4, float* %arrayidx23.us.4, align 4, !tbaa !2
  %999 = load float, float* %arrayidx63.us.4, align 4, !tbaa !2
  %add76.us.4 = fadd float %add40.us.4, %999
  store float %add76.us.4, float* %arrayidx63.us.4, align 4, !tbaa !2
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv.4, 1
  %1000 = trunc i64 %indvars.iv.next.4 to i32
  %add13.us.1.4 = add i32 %1000, %833
  %add14.us.1.4 = add i32 %add13.us.1.4, 8
  %idxprom15.us.1.4 = sext i32 %add14.us.1.4 to i64
  %arrayidx16.us.1.4 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.4
  %1001 = load float, float* %arrayidx16.us.1.4, align 4, !tbaa !2
  %mul17.us.1.4 = fmul float %829, %1001
  %arrayidx23.us.1.4 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.4
  %1002 = load float, float* %arrayidx23.us.1.4, align 4, !tbaa !2
  %mul24.us.1.4 = fmul float %830, %1002
  %sub25.us.1.4 = fsub float %mul17.us.1.4, %mul24.us.1.4
  %mul32.us.1.4 = fmul float %830, %1001
  %mul39.us.1.4 = fmul float %829, %1002
  %add40.us.1.4 = fadd float %mul32.us.1.4, %mul39.us.1.4
  %1003 = add nuw nsw i64 %indvars.iv.next.4, %832
  %arrayidx45.us.1.4 = getelementptr inbounds float, float* %data_real, i64 %1003
  %1004 = load float, float* %arrayidx45.us.1.4, align 4, !tbaa !2
  %sub46.us.1.4 = fsub float %1004, %sub25.us.1.4
  store float %sub46.us.1.4, float* %arrayidx16.us.1.4, align 4, !tbaa !2
  %1005 = load float, float* %arrayidx45.us.1.4, align 4, !tbaa !2
  %add58.us.1.4 = fadd float %sub25.us.1.4, %1005
  store float %add58.us.1.4, float* %arrayidx45.us.1.4, align 4, !tbaa !2
  %arrayidx63.us.1.4 = getelementptr inbounds float, float* %data_imag, i64 %1003
  %1006 = load float, float* %arrayidx63.us.1.4, align 4, !tbaa !2
  %sub64.us.1.4 = fsub float %1006, %add40.us.1.4
  store float %sub64.us.1.4, float* %arrayidx23.us.1.4, align 4, !tbaa !2
  %1007 = load float, float* %arrayidx63.us.1.4, align 4, !tbaa !2
  %add76.us.1.4 = fadd float %add40.us.1.4, %1007
  store float %add76.us.1.4, float* %arrayidx63.us.1.4, align 4, !tbaa !2
  %indvars.iv.next.1.4 = add nuw nsw i64 %indvars.iv.next.4, 1
  %1008 = trunc i64 %indvars.iv.next.1.4 to i32
  %add13.us.2.4 = add i32 %1008, %833
  %add14.us.2.4 = add i32 %add13.us.2.4, 8
  %idxprom15.us.2.4 = sext i32 %add14.us.2.4 to i64
  %arrayidx16.us.2.4 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.4
  %1009 = load float, float* %arrayidx16.us.2.4, align 4, !tbaa !2
  %mul17.us.2.4 = fmul float %829, %1009
  %arrayidx23.us.2.4 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.4
  %1010 = load float, float* %arrayidx23.us.2.4, align 4, !tbaa !2
  %mul24.us.2.4 = fmul float %830, %1010
  %sub25.us.2.4 = fsub float %mul17.us.2.4, %mul24.us.2.4
  %mul32.us.2.4 = fmul float %830, %1009
  %mul39.us.2.4 = fmul float %829, %1010
  %add40.us.2.4 = fadd float %mul32.us.2.4, %mul39.us.2.4
  %1011 = add nuw nsw i64 %indvars.iv.next.1.4, %832
  %arrayidx45.us.2.4 = getelementptr inbounds float, float* %data_real, i64 %1011
  %1012 = load float, float* %arrayidx45.us.2.4, align 4, !tbaa !2
  %sub46.us.2.4 = fsub float %1012, %sub25.us.2.4
  store float %sub46.us.2.4, float* %arrayidx16.us.2.4, align 4, !tbaa !2
  %1013 = load float, float* %arrayidx45.us.2.4, align 4, !tbaa !2
  %add58.us.2.4 = fadd float %sub25.us.2.4, %1013
  store float %add58.us.2.4, float* %arrayidx45.us.2.4, align 4, !tbaa !2
  %arrayidx63.us.2.4 = getelementptr inbounds float, float* %data_imag, i64 %1011
  %1014 = load float, float* %arrayidx63.us.2.4, align 4, !tbaa !2
  %sub64.us.2.4 = fsub float %1014, %add40.us.2.4
  store float %sub64.us.2.4, float* %arrayidx23.us.2.4, align 4, !tbaa !2
  %1015 = load float, float* %arrayidx63.us.2.4, align 4, !tbaa !2
  %add76.us.2.4 = fadd float %add40.us.2.4, %1015
  store float %add76.us.2.4, float* %arrayidx63.us.2.4, align 4, !tbaa !2
  %indvars.iv.next.2.4 = add nuw nsw i64 %indvars.iv.next.1.4, 1
  %1016 = trunc i64 %indvars.iv.next.2.4 to i32
  %add13.us.3.4 = add i32 %1016, %833
  %add14.us.3.4 = add i32 %add13.us.3.4, 8
  %idxprom15.us.3.4 = sext i32 %add14.us.3.4 to i64
  %arrayidx16.us.3.4 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.4
  %1017 = load float, float* %arrayidx16.us.3.4, align 4, !tbaa !2
  %mul17.us.3.4 = fmul float %829, %1017
  %arrayidx23.us.3.4 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.4
  %1018 = load float, float* %arrayidx23.us.3.4, align 4, !tbaa !2
  %mul24.us.3.4 = fmul float %830, %1018
  %sub25.us.3.4 = fsub float %mul17.us.3.4, %mul24.us.3.4
  %mul32.us.3.4 = fmul float %830, %1017
  %mul39.us.3.4 = fmul float %829, %1018
  %add40.us.3.4 = fadd float %mul32.us.3.4, %mul39.us.3.4
  %1019 = add nuw nsw i64 %indvars.iv.next.2.4, %832
  %arrayidx45.us.3.4 = getelementptr inbounds float, float* %data_real, i64 %1019
  %1020 = load float, float* %arrayidx45.us.3.4, align 4, !tbaa !2
  %sub46.us.3.4 = fsub float %1020, %sub25.us.3.4
  store float %sub46.us.3.4, float* %arrayidx16.us.3.4, align 4, !tbaa !2
  %1021 = load float, float* %arrayidx45.us.3.4, align 4, !tbaa !2
  %add58.us.3.4 = fadd float %sub25.us.3.4, %1021
  store float %add58.us.3.4, float* %arrayidx45.us.3.4, align 4, !tbaa !2
  %arrayidx63.us.3.4 = getelementptr inbounds float, float* %data_imag, i64 %1019
  %1022 = load float, float* %arrayidx63.us.3.4, align 4, !tbaa !2
  %sub64.us.3.4 = fsub float %1022, %add40.us.3.4
  store float %sub64.us.3.4, float* %arrayidx23.us.3.4, align 4, !tbaa !2
  %1023 = load float, float* %arrayidx63.us.3.4, align 4, !tbaa !2
  %add76.us.3.4 = fadd float %add40.us.3.4, %1023
  store float %add76.us.3.4, float* %arrayidx63.us.3.4, align 4, !tbaa !2
  %indvars.iv.next.3.4 = add nuw nsw i64 %indvars.iv.next.2.4, 1
  %exitcond.3.4 = icmp eq i64 %indvars.iv.next.3.4, 8
  br i1 %exitcond.3.4, label %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.4, label %for.body11.us.4, !llvm.loop !39

for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.4: ; preds = %for.body11.us.4
  br label %for.cond9.for.inc77_crit_edge.us.loopexit.4

for.cond9.for.inc77_crit_edge.us.loopexit.4:      ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.4, %for.body11.us.prol.loopexit.4
  br label %for.cond9.for.inc77_crit_edge.us.4

for.cond9.for.inc77_crit_edge.us.4:               ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.4, %middle.block.4
  %indvars.iv.next163.4 = add nuw nsw i64 %indvars.iv162.4, 1
  %exitcond168.4 = icmp eq i64 %indvars.iv.next163.4, 16
  br i1 %exitcond168.4, label %for.end79.loopexit.4, label %for.body3.us.4

for.end79.loopexit.4:                             ; preds = %for.cond9.for.inc77_crit_edge.us.4
  br label %for.end79.4

for.end79.4:                                      ; preds = %for.end79.loopexit.4, %for.end79.3
  br i1 true, label %for.body3.us.preheader.5, label %for.end79.5

for.body3.us.preheader.5:                         ; preds = %for.end79.4
  %scevgep171.5 = getelementptr float, float* %data_real, i64 4
  %scevgep180.5 = getelementptr float, float* %data_imag, i64 4
  br label %for.body3.us.5

for.body3.us.5:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.5, %for.body3.us.preheader.5
  %indvars.iv162.5 = phi i64 [ 0, %for.body3.us.preheader.5 ], [ %indvars.iv.next163.5, %for.cond9.for.inc77_crit_edge.us.5 ]
  %1024 = trunc i64 %indvars.iv162.5 to i32
  %1025 = mul i32 8, %1024
  %1026 = add i32 4, %1025
  %1027 = sext i32 %1026 to i64
  %scevgep.5 = getelementptr float, float* %data_real, i64 %1027
  %scevgep172.5 = getelementptr float, float* %scevgep171.5, i64 %1027
  %1028 = mul i64 8, %indvars.iv162.5
  %scevgep174.5 = getelementptr float, float* %data_real, i64 %1028
  %1029 = add i64 %1028, 4
  %scevgep176.5 = getelementptr float, float* %data_real, i64 %1029
  %scevgep178.5 = getelementptr float, float* %data_imag, i64 %1027
  %scevgep181.5 = getelementptr float, float* %scevgep180.5, i64 %1027
  %scevgep183.5 = getelementptr float, float* %data_imag, i64 %1028
  %scevgep185.5 = getelementptr float, float* %data_imag, i64 %1029
  %1030 = trunc i64 %indvars.iv162.5 to i32
  %1031 = mul i32 8, %1030
  %1032 = add i32 4, %1031
  %1033 = add nsw i64 %indvars.iv162.5, 31
  %arrayidx.us.5 = getelementptr inbounds float, float* %coef_real, i64 %1033
  %1034 = load float, float* %arrayidx.us.5, align 4, !tbaa !2
  %arrayidx8.us.5 = getelementptr inbounds float, float* %coef_imag, i64 %1033
  %1035 = load float, float* %arrayidx8.us.5, align 4, !tbaa !2
  %1036 = shl nuw nsw i64 %indvars.iv162.5, 1
  %1037 = mul nsw i64 %1036, 4
  %1038 = trunc i64 %1037 to i32
  br i1 false, label %for.body11.us.preheader.5, label %vector.scevcheck.5

vector.scevcheck.5:                               ; preds = %for.body3.us.5
  %1039 = add i32 %1032, 3
  %1040 = icmp slt i32 %1039, %1032
  br i1 %1040, label %for.body11.us.preheader.5, label %vector.memcheck.5

vector.memcheck.5:                                ; preds = %vector.scevcheck.5
  %bound0.5 = icmp ult float* %scevgep.5, %scevgep176.5
  %bound1.5 = icmp ult float* %scevgep174.5, %scevgep172.5
  %found.conflict.5 = and i1 %bound0.5, %bound1.5
  %bound0187.5 = icmp ugt float* %scevgep180.5, %data_real
  %bound1188.5 = icmp ugt float* %scevgep171.5, %data_imag
  %found.conflict189.5 = and i1 %bound0187.5, %bound1188.5
  %conflict.rdx.5 = or i1 %found.conflict.5, %found.conflict189.5
  %bound0190.5 = icmp ult float* %scevgep.5, %scevgep185.5
  %bound1191.5 = icmp ult float* %scevgep183.5, %scevgep172.5
  %found.conflict192.5 = and i1 %bound0190.5, %bound1191.5
  %conflict.rdx193.5 = or i1 %conflict.rdx.5, %found.conflict192.5
  %bound0194.5 = icmp ult float* %scevgep174.5, %scevgep181.5
  %bound1195.5 = icmp ult float* %scevgep178.5, %scevgep176.5
  %found.conflict196.5 = and i1 %bound0194.5, %bound1195.5
  %conflict.rdx197.5 = or i1 %conflict.rdx193.5, %found.conflict196.5
  %bound0198.5 = icmp ult float* %scevgep174.5, %scevgep185.5
  %bound1199.5 = icmp ult float* %scevgep183.5, %scevgep176.5
  %found.conflict200.5 = and i1 %bound0198.5, %bound1199.5
  %conflict.rdx201.5 = or i1 %conflict.rdx197.5, %found.conflict200.5
  %bound0202.5 = icmp ult float* %scevgep178.5, %scevgep185.5
  %bound1203.5 = icmp ult float* %scevgep183.5, %scevgep181.5
  %found.conflict204.5 = and i1 %bound0202.5, %bound1203.5
  %conflict.rdx205.5 = or i1 %conflict.rdx201.5, %found.conflict204.5
  br i1 %conflict.rdx205.5, label %for.body11.us.preheader.5, label %vector.ph.5

vector.ph.5:                                      ; preds = %vector.memcheck.5
  %broadcast.splatinsert209.5 = insertelement <4 x float> undef, float %1034, i32 0
  %broadcast.splat210.5 = shufflevector <4 x float> %broadcast.splatinsert209.5, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert212.5 = insertelement <4 x float> undef, float %1035, i32 0
  %broadcast.splat213.5 = shufflevector <4 x float> %broadcast.splatinsert212.5, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 true, label %middle.block.unr-lcssa.5, label %vector.ph.new.5

vector.ph.new.5:                                  ; preds = %vector.ph.5
  br label %vector.body.5

vector.body.5:                                    ; preds = %vector.body.5, %vector.ph.new.5
  %index.5 = phi i64 [ 0, %vector.ph.new.5 ], [ %index.next.3.5, %vector.body.5 ]
  %niter.5 = phi i64 [ 0, %vector.ph.new.5 ], [ %niter.nsub.3.5, %vector.body.5 ]
  %1041 = trunc i64 %index.5 to i32
  %1042 = add i32 %1041, %1038
  %1043 = add i32 %1042, 4
  %1044 = sext i32 %1043 to i64
  %1045 = getelementptr inbounds float, float* %data_real, i64 %1044
  %1046 = bitcast float* %1045 to <4 x float>*
  %wide.load.5 = load <4 x float>, <4 x float>* %1046, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1047 = fmul <4 x float> %broadcast.splat210.5, %wide.load.5
  %1048 = getelementptr inbounds float, float* %data_imag, i64 %1044
  %1049 = bitcast float* %1048 to <4 x float>*
  %wide.load211.5 = load <4 x float>, <4 x float>* %1049, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1050 = fmul <4 x float> %broadcast.splat213.5, %wide.load211.5
  %1051 = fsub <4 x float> %1047, %1050
  %1052 = fmul <4 x float> %broadcast.splat213.5, %wide.load.5
  %1053 = fmul <4 x float> %broadcast.splat210.5, %wide.load211.5
  %1054 = fadd <4 x float> %1052, %1053
  %1055 = add nuw nsw i64 %index.5, %1037
  %1056 = getelementptr inbounds float, float* %data_real, i64 %1055
  %1057 = bitcast float* %1056 to <4 x float>*
  %wide.load214.5 = load <4 x float>, <4 x float>* %1057, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1058 = fsub <4 x float> %wide.load214.5, %1051
  %1059 = bitcast float* %1045 to <4 x float>*
  store <4 x float> %1058, <4 x float>* %1059, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1060 = bitcast float* %1056 to <4 x float>*
  %wide.load215.5 = load <4 x float>, <4 x float>* %1060, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1061 = fadd <4 x float> %1051, %wide.load215.5
  %1062 = bitcast float* %1056 to <4 x float>*
  store <4 x float> %1061, <4 x float>* %1062, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1063 = getelementptr inbounds float, float* %data_imag, i64 %1055
  %1064 = bitcast float* %1063 to <4 x float>*
  %wide.load216.5 = load <4 x float>, <4 x float>* %1064, align 4, !tbaa !2, !alias.scope !33
  %1065 = fsub <4 x float> %wide.load216.5, %1054
  %1066 = bitcast float* %1048 to <4 x float>*
  store <4 x float> %1065, <4 x float>* %1066, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1067 = bitcast float* %1063 to <4 x float>*
  %wide.load217.5 = load <4 x float>, <4 x float>* %1067, align 4, !tbaa !2, !alias.scope !33
  %1068 = fadd <4 x float> %1054, %wide.load217.5
  %1069 = bitcast float* %1063 to <4 x float>*
  store <4 x float> %1068, <4 x float>* %1069, align 4, !tbaa !2, !alias.scope !33
  %index.next.5 = add nuw nsw i64 %index.5, 4
  %niter.nsub.5 = sub i64 %niter.5, 1
  %1070 = trunc i64 %index.next.5 to i32
  %1071 = add i32 %1070, %1038
  %1072 = add i32 %1071, 4
  %1073 = sext i32 %1072 to i64
  %1074 = getelementptr inbounds float, float* %data_real, i64 %1073
  %1075 = bitcast float* %1074 to <4 x float>*
  %wide.load.1.5 = load <4 x float>, <4 x float>* %1075, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1076 = fmul <4 x float> %broadcast.splat210.5, %wide.load.1.5
  %1077 = getelementptr inbounds float, float* %data_imag, i64 %1073
  %1078 = bitcast float* %1077 to <4 x float>*
  %wide.load211.1.5 = load <4 x float>, <4 x float>* %1078, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1079 = fmul <4 x float> %broadcast.splat213.5, %wide.load211.1.5
  %1080 = fsub <4 x float> %1076, %1079
  %1081 = fmul <4 x float> %broadcast.splat213.5, %wide.load.1.5
  %1082 = fmul <4 x float> %broadcast.splat210.5, %wide.load211.1.5
  %1083 = fadd <4 x float> %1081, %1082
  %1084 = add nuw nsw i64 %index.next.5, %1037
  %1085 = getelementptr inbounds float, float* %data_real, i64 %1084
  %1086 = bitcast float* %1085 to <4 x float>*
  %wide.load214.1.5 = load <4 x float>, <4 x float>* %1086, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1087 = fsub <4 x float> %wide.load214.1.5, %1080
  %1088 = bitcast float* %1074 to <4 x float>*
  store <4 x float> %1087, <4 x float>* %1088, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1089 = bitcast float* %1085 to <4 x float>*
  %wide.load215.1.5 = load <4 x float>, <4 x float>* %1089, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1090 = fadd <4 x float> %1080, %wide.load215.1.5
  %1091 = bitcast float* %1085 to <4 x float>*
  store <4 x float> %1090, <4 x float>* %1091, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1092 = getelementptr inbounds float, float* %data_imag, i64 %1084
  %1093 = bitcast float* %1092 to <4 x float>*
  %wide.load216.1.5 = load <4 x float>, <4 x float>* %1093, align 4, !tbaa !2, !alias.scope !33
  %1094 = fsub <4 x float> %wide.load216.1.5, %1083
  %1095 = bitcast float* %1077 to <4 x float>*
  store <4 x float> %1094, <4 x float>* %1095, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1096 = bitcast float* %1092 to <4 x float>*
  %wide.load217.1.5 = load <4 x float>, <4 x float>* %1096, align 4, !tbaa !2, !alias.scope !33
  %1097 = fadd <4 x float> %1083, %wide.load217.1.5
  %1098 = bitcast float* %1092 to <4 x float>*
  store <4 x float> %1097, <4 x float>* %1098, align 4, !tbaa !2, !alias.scope !33
  %index.next.1.5 = add nuw nsw i64 %index.next.5, 4
  %niter.nsub.1.5 = sub i64 %niter.nsub.5, 1
  %1099 = trunc i64 %index.next.1.5 to i32
  %1100 = add i32 %1099, %1038
  %1101 = add i32 %1100, 4
  %1102 = sext i32 %1101 to i64
  %1103 = getelementptr inbounds float, float* %data_real, i64 %1102
  %1104 = bitcast float* %1103 to <4 x float>*
  %wide.load.2.5 = load <4 x float>, <4 x float>* %1104, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1105 = fmul <4 x float> %broadcast.splat210.5, %wide.load.2.5
  %1106 = getelementptr inbounds float, float* %data_imag, i64 %1102
  %1107 = bitcast float* %1106 to <4 x float>*
  %wide.load211.2.5 = load <4 x float>, <4 x float>* %1107, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1108 = fmul <4 x float> %broadcast.splat213.5, %wide.load211.2.5
  %1109 = fsub <4 x float> %1105, %1108
  %1110 = fmul <4 x float> %broadcast.splat213.5, %wide.load.2.5
  %1111 = fmul <4 x float> %broadcast.splat210.5, %wide.load211.2.5
  %1112 = fadd <4 x float> %1110, %1111
  %1113 = add nuw nsw i64 %index.next.1.5, %1037
  %1114 = getelementptr inbounds float, float* %data_real, i64 %1113
  %1115 = bitcast float* %1114 to <4 x float>*
  %wide.load214.2.5 = load <4 x float>, <4 x float>* %1115, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1116 = fsub <4 x float> %wide.load214.2.5, %1109
  %1117 = bitcast float* %1103 to <4 x float>*
  store <4 x float> %1116, <4 x float>* %1117, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1118 = bitcast float* %1114 to <4 x float>*
  %wide.load215.2.5 = load <4 x float>, <4 x float>* %1118, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1119 = fadd <4 x float> %1109, %wide.load215.2.5
  %1120 = bitcast float* %1114 to <4 x float>*
  store <4 x float> %1119, <4 x float>* %1120, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1121 = getelementptr inbounds float, float* %data_imag, i64 %1113
  %1122 = bitcast float* %1121 to <4 x float>*
  %wide.load216.2.5 = load <4 x float>, <4 x float>* %1122, align 4, !tbaa !2, !alias.scope !33
  %1123 = fsub <4 x float> %wide.load216.2.5, %1112
  %1124 = bitcast float* %1106 to <4 x float>*
  store <4 x float> %1123, <4 x float>* %1124, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1125 = bitcast float* %1121 to <4 x float>*
  %wide.load217.2.5 = load <4 x float>, <4 x float>* %1125, align 4, !tbaa !2, !alias.scope !33
  %1126 = fadd <4 x float> %1112, %wide.load217.2.5
  %1127 = bitcast float* %1121 to <4 x float>*
  store <4 x float> %1126, <4 x float>* %1127, align 4, !tbaa !2, !alias.scope !33
  %index.next.2.5 = add nuw nsw i64 %index.next.1.5, 4
  %niter.nsub.2.5 = sub i64 %niter.nsub.1.5, 1
  %1128 = trunc i64 %index.next.2.5 to i32
  %1129 = add i32 %1128, %1038
  %1130 = add i32 %1129, 4
  %1131 = sext i32 %1130 to i64
  %1132 = getelementptr inbounds float, float* %data_real, i64 %1131
  %1133 = bitcast float* %1132 to <4 x float>*
  %wide.load.3.5 = load <4 x float>, <4 x float>* %1133, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1134 = fmul <4 x float> %broadcast.splat210.5, %wide.load.3.5
  %1135 = getelementptr inbounds float, float* %data_imag, i64 %1131
  %1136 = bitcast float* %1135 to <4 x float>*
  %wide.load211.3.5 = load <4 x float>, <4 x float>* %1136, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1137 = fmul <4 x float> %broadcast.splat213.5, %wide.load211.3.5
  %1138 = fsub <4 x float> %1134, %1137
  %1139 = fmul <4 x float> %broadcast.splat213.5, %wide.load.3.5
  %1140 = fmul <4 x float> %broadcast.splat210.5, %wide.load211.3.5
  %1141 = fadd <4 x float> %1139, %1140
  %1142 = add nuw nsw i64 %index.next.2.5, %1037
  %1143 = getelementptr inbounds float, float* %data_real, i64 %1142
  %1144 = bitcast float* %1143 to <4 x float>*
  %wide.load214.3.5 = load <4 x float>, <4 x float>* %1144, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1145 = fsub <4 x float> %wide.load214.3.5, %1138
  %1146 = bitcast float* %1132 to <4 x float>*
  store <4 x float> %1145, <4 x float>* %1146, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1147 = bitcast float* %1143 to <4 x float>*
  %wide.load215.3.5 = load <4 x float>, <4 x float>* %1147, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1148 = fadd <4 x float> %1138, %wide.load215.3.5
  %1149 = bitcast float* %1143 to <4 x float>*
  store <4 x float> %1148, <4 x float>* %1149, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1150 = getelementptr inbounds float, float* %data_imag, i64 %1142
  %1151 = bitcast float* %1150 to <4 x float>*
  %wide.load216.3.5 = load <4 x float>, <4 x float>* %1151, align 4, !tbaa !2, !alias.scope !33
  %1152 = fsub <4 x float> %wide.load216.3.5, %1141
  %1153 = bitcast float* %1135 to <4 x float>*
  store <4 x float> %1152, <4 x float>* %1153, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1154 = bitcast float* %1150 to <4 x float>*
  %wide.load217.3.5 = load <4 x float>, <4 x float>* %1154, align 4, !tbaa !2, !alias.scope !33
  %1155 = fadd <4 x float> %1141, %wide.load217.3.5
  %1156 = bitcast float* %1150 to <4 x float>*
  store <4 x float> %1155, <4 x float>* %1156, align 4, !tbaa !2, !alias.scope !33
  %index.next.3.5 = add i64 %index.next.2.5, 4
  %niter.nsub.3.5 = sub i64 %niter.nsub.2.5, 1
  %niter.ncmp.3.5 = icmp eq i64 %niter.nsub.3.5, 0
  br i1 %niter.ncmp.3.5, label %middle.block.unr-lcssa.loopexit.5, label %vector.body.5, !llvm.loop !36

middle.block.unr-lcssa.loopexit.5:                ; preds = %vector.body.5
  %index.unr.ph.5 = phi i64 [ %index.next.3.5, %vector.body.5 ]
  br label %middle.block.unr-lcssa.5

middle.block.unr-lcssa.5:                         ; preds = %middle.block.unr-lcssa.loopexit.5, %vector.ph.5
  %index.unr.5 = phi i64 [ 0, %vector.ph.5 ], [ %index.unr.ph.5, %middle.block.unr-lcssa.loopexit.5 ]
  br i1 true, label %vector.body.epil.preheader.5, label %middle.block.5

vector.body.epil.preheader.5:                     ; preds = %middle.block.unr-lcssa.5
  br label %vector.body.epil.5

vector.body.epil.5:                               ; preds = %vector.body.epil.5, %vector.body.epil.preheader.5
  %index.epil.5 = phi i64 [ %index.unr.5, %vector.body.epil.preheader.5 ], [ %index.next.epil.5, %vector.body.epil.5 ]
  %epil.iter.5 = phi i64 [ 1, %vector.body.epil.preheader.5 ], [ %epil.iter.sub.5, %vector.body.epil.5 ]
  %1157 = trunc i64 %index.epil.5 to i32
  %1158 = add i32 %1157, %1038
  %1159 = add i32 %1158, 4
  %1160 = sext i32 %1159 to i64
  %1161 = getelementptr inbounds float, float* %data_real, i64 %1160
  %1162 = bitcast float* %1161 to <4 x float>*
  %wide.load.epil.5 = load <4 x float>, <4 x float>* %1162, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1163 = fmul <4 x float> %broadcast.splat210.5, %wide.load.epil.5
  %1164 = getelementptr inbounds float, float* %data_imag, i64 %1160
  %1165 = bitcast float* %1164 to <4 x float>*
  %wide.load211.epil.5 = load <4 x float>, <4 x float>* %1165, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1166 = fmul <4 x float> %broadcast.splat213.5, %wide.load211.epil.5
  %1167 = fsub <4 x float> %1163, %1166
  %1168 = fmul <4 x float> %broadcast.splat213.5, %wide.load.epil.5
  %1169 = fmul <4 x float> %broadcast.splat210.5, %wide.load211.epil.5
  %1170 = fadd <4 x float> %1168, %1169
  %1171 = add nuw nsw i64 %index.epil.5, %1037
  %1172 = getelementptr inbounds float, float* %data_real, i64 %1171
  %1173 = bitcast float* %1172 to <4 x float>*
  %wide.load214.epil.5 = load <4 x float>, <4 x float>* %1173, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1174 = fsub <4 x float> %wide.load214.epil.5, %1167
  %1175 = bitcast float* %1161 to <4 x float>*
  store <4 x float> %1174, <4 x float>* %1175, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1176 = bitcast float* %1172 to <4 x float>*
  %wide.load215.epil.5 = load <4 x float>, <4 x float>* %1176, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1177 = fadd <4 x float> %1167, %wide.load215.epil.5
  %1178 = bitcast float* %1172 to <4 x float>*
  store <4 x float> %1177, <4 x float>* %1178, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1179 = getelementptr inbounds float, float* %data_imag, i64 %1171
  %1180 = bitcast float* %1179 to <4 x float>*
  %wide.load216.epil.5 = load <4 x float>, <4 x float>* %1180, align 4, !tbaa !2, !alias.scope !33
  %1181 = fsub <4 x float> %wide.load216.epil.5, %1170
  %1182 = bitcast float* %1164 to <4 x float>*
  store <4 x float> %1181, <4 x float>* %1182, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1183 = bitcast float* %1179 to <4 x float>*
  %wide.load217.epil.5 = load <4 x float>, <4 x float>* %1183, align 4, !tbaa !2, !alias.scope !33
  %1184 = fadd <4 x float> %1170, %wide.load217.epil.5
  %1185 = bitcast float* %1179 to <4 x float>*
  store <4 x float> %1184, <4 x float>* %1185, align 4, !tbaa !2, !alias.scope !33
  %index.next.epil.5 = add i64 %index.epil.5, 4
  %epil.iter.sub.5 = sub i64 %epil.iter.5, 1
  %epil.iter.cmp.5 = icmp ne i64 %epil.iter.sub.5, 0
  br i1 %epil.iter.cmp.5, label %vector.body.epil.5, label %middle.block.epilog-lcssa.5, !llvm.loop !37

middle.block.epilog-lcssa.5:                      ; preds = %vector.body.epil.5
  br label %middle.block.5

middle.block.5:                                   ; preds = %middle.block.epilog-lcssa.5, %middle.block.unr-lcssa.5
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.5, label %for.body11.us.preheader.5

for.body11.us.preheader.5:                        ; preds = %middle.block.5, %vector.memcheck.5, %vector.scevcheck.5, %for.body3.us.5
  %indvars.iv.ph.5 = phi i64 [ 0, %vector.memcheck.5 ], [ 0, %vector.scevcheck.5 ], [ 0, %for.body3.us.5 ], [ 4, %middle.block.5 ]
  %1186 = sub i64 4, %indvars.iv.ph.5
  %1187 = sub i64 3, %indvars.iv.ph.5
  br i1 false, label %for.body11.us.prol.preheader.5, label %for.body11.us.prol.loopexit.5

for.body11.us.prol.preheader.5:                   ; preds = %for.body11.us.preheader.5
  br label %for.body11.us.prol.5

for.body11.us.prol.5:                             ; preds = %for.body11.us.prol.5, %for.body11.us.prol.preheader.5
  %indvars.iv.prol.5 = phi i64 [ %indvars.iv.next.prol.5, %for.body11.us.prol.5 ], [ %indvars.iv.ph.5, %for.body11.us.prol.preheader.5 ]
  %prol.iter.5 = phi i64 [ 0, %for.body11.us.prol.preheader.5 ], [ %prol.iter.sub.5, %for.body11.us.prol.5 ]
  %1188 = trunc i64 %indvars.iv.prol.5 to i32
  %add13.us.prol.5 = add i32 %1188, %1038
  %add14.us.prol.5 = add i32 %add13.us.prol.5, 4
  %idxprom15.us.prol.5 = sext i32 %add14.us.prol.5 to i64
  %arrayidx16.us.prol.5 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.prol.5
  %1189 = load float, float* %arrayidx16.us.prol.5, align 4, !tbaa !2
  %mul17.us.prol.5 = fmul float %1034, %1189
  %arrayidx23.us.prol.5 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.prol.5
  %1190 = load float, float* %arrayidx23.us.prol.5, align 4, !tbaa !2
  %mul24.us.prol.5 = fmul float %1035, %1190
  %sub25.us.prol.5 = fsub float %mul17.us.prol.5, %mul24.us.prol.5
  %mul32.us.prol.5 = fmul float %1035, %1189
  %mul39.us.prol.5 = fmul float %1034, %1190
  %add40.us.prol.5 = fadd float %mul32.us.prol.5, %mul39.us.prol.5
  %1191 = add nuw nsw i64 %indvars.iv.prol.5, %1037
  %arrayidx45.us.prol.5 = getelementptr inbounds float, float* %data_real, i64 %1191
  %1192 = load float, float* %arrayidx45.us.prol.5, align 4, !tbaa !2
  %sub46.us.prol.5 = fsub float %1192, %sub25.us.prol.5
  store float %sub46.us.prol.5, float* %arrayidx16.us.prol.5, align 4, !tbaa !2
  %1193 = load float, float* %arrayidx45.us.prol.5, align 4, !tbaa !2
  %add58.us.prol.5 = fadd float %sub25.us.prol.5, %1193
  store float %add58.us.prol.5, float* %arrayidx45.us.prol.5, align 4, !tbaa !2
  %arrayidx63.us.prol.5 = getelementptr inbounds float, float* %data_imag, i64 %1191
  %1194 = load float, float* %arrayidx63.us.prol.5, align 4, !tbaa !2
  %sub64.us.prol.5 = fsub float %1194, %add40.us.prol.5
  store float %sub64.us.prol.5, float* %arrayidx23.us.prol.5, align 4, !tbaa !2
  %1195 = load float, float* %arrayidx63.us.prol.5, align 4, !tbaa !2
  %add76.us.prol.5 = fadd float %add40.us.prol.5, %1195
  store float %add76.us.prol.5, float* %arrayidx63.us.prol.5, align 4, !tbaa !2
  %indvars.iv.next.prol.5 = add nuw nsw i64 %indvars.iv.prol.5, 1
  %prol.iter.sub.5 = sub i64 %prol.iter.5, 1
  %prol.iter.cmp.5 = icmp ne i64 %prol.iter.sub.5, 0
  br i1 %prol.iter.cmp.5, label %for.body11.us.prol.5, label %for.body11.us.prol.loopexit.unr-lcssa.5, !llvm.loop !38

for.body11.us.prol.loopexit.unr-lcssa.5:          ; preds = %for.body11.us.prol.5
  %indvars.iv.unr.ph.5 = phi i64 [ %indvars.iv.next.prol.5, %for.body11.us.prol.5 ]
  br label %for.body11.us.prol.loopexit.5

for.body11.us.prol.loopexit.5:                    ; preds = %for.body11.us.prol.loopexit.unr-lcssa.5, %for.body11.us.preheader.5
  %indvars.iv.unr.5 = phi i64 [ %indvars.iv.ph.5, %for.body11.us.preheader.5 ], [ %indvars.iv.unr.ph.5, %for.body11.us.prol.loopexit.unr-lcssa.5 ]
  %1196 = icmp ult i64 %1187, 3
  br i1 %1196, label %for.cond9.for.inc77_crit_edge.us.loopexit.5, label %for.body11.us.preheader.new.5

for.body11.us.preheader.new.5:                    ; preds = %for.body11.us.prol.loopexit.5
  br label %for.body11.us.5

for.body11.us.5:                                  ; preds = %for.body11.us.5, %for.body11.us.preheader.new.5
  %indvars.iv.5 = phi i64 [ %indvars.iv.unr.5, %for.body11.us.preheader.new.5 ], [ %indvars.iv.next.3.5, %for.body11.us.5 ]
  %1197 = trunc i64 %indvars.iv.5 to i32
  %add13.us.5 = add i32 %1197, %1038
  %add14.us.5 = add i32 %add13.us.5, 4
  %idxprom15.us.5 = sext i32 %add14.us.5 to i64
  %arrayidx16.us.5 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.5
  %1198 = load float, float* %arrayidx16.us.5, align 4, !tbaa !2
  %mul17.us.5 = fmul float %1034, %1198
  %arrayidx23.us.5 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.5
  %1199 = load float, float* %arrayidx23.us.5, align 4, !tbaa !2
  %mul24.us.5 = fmul float %1035, %1199
  %sub25.us.5 = fsub float %mul17.us.5, %mul24.us.5
  %mul32.us.5 = fmul float %1035, %1198
  %mul39.us.5 = fmul float %1034, %1199
  %add40.us.5 = fadd float %mul32.us.5, %mul39.us.5
  %1200 = add nuw nsw i64 %indvars.iv.5, %1037
  %arrayidx45.us.5 = getelementptr inbounds float, float* %data_real, i64 %1200
  %1201 = load float, float* %arrayidx45.us.5, align 4, !tbaa !2
  %sub46.us.5 = fsub float %1201, %sub25.us.5
  store float %sub46.us.5, float* %arrayidx16.us.5, align 4, !tbaa !2
  %1202 = load float, float* %arrayidx45.us.5, align 4, !tbaa !2
  %add58.us.5 = fadd float %sub25.us.5, %1202
  store float %add58.us.5, float* %arrayidx45.us.5, align 4, !tbaa !2
  %arrayidx63.us.5 = getelementptr inbounds float, float* %data_imag, i64 %1200
  %1203 = load float, float* %arrayidx63.us.5, align 4, !tbaa !2
  %sub64.us.5 = fsub float %1203, %add40.us.5
  store float %sub64.us.5, float* %arrayidx23.us.5, align 4, !tbaa !2
  %1204 = load float, float* %arrayidx63.us.5, align 4, !tbaa !2
  %add76.us.5 = fadd float %add40.us.5, %1204
  store float %add76.us.5, float* %arrayidx63.us.5, align 4, !tbaa !2
  %indvars.iv.next.5 = add nuw nsw i64 %indvars.iv.5, 1
  %1205 = trunc i64 %indvars.iv.next.5 to i32
  %add13.us.1.5 = add i32 %1205, %1038
  %add14.us.1.5 = add i32 %add13.us.1.5, 4
  %idxprom15.us.1.5 = sext i32 %add14.us.1.5 to i64
  %arrayidx16.us.1.5 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.5
  %1206 = load float, float* %arrayidx16.us.1.5, align 4, !tbaa !2
  %mul17.us.1.5 = fmul float %1034, %1206
  %arrayidx23.us.1.5 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.5
  %1207 = load float, float* %arrayidx23.us.1.5, align 4, !tbaa !2
  %mul24.us.1.5 = fmul float %1035, %1207
  %sub25.us.1.5 = fsub float %mul17.us.1.5, %mul24.us.1.5
  %mul32.us.1.5 = fmul float %1035, %1206
  %mul39.us.1.5 = fmul float %1034, %1207
  %add40.us.1.5 = fadd float %mul32.us.1.5, %mul39.us.1.5
  %1208 = add nuw nsw i64 %indvars.iv.next.5, %1037
  %arrayidx45.us.1.5 = getelementptr inbounds float, float* %data_real, i64 %1208
  %1209 = load float, float* %arrayidx45.us.1.5, align 4, !tbaa !2
  %sub46.us.1.5 = fsub float %1209, %sub25.us.1.5
  store float %sub46.us.1.5, float* %arrayidx16.us.1.5, align 4, !tbaa !2
  %1210 = load float, float* %arrayidx45.us.1.5, align 4, !tbaa !2
  %add58.us.1.5 = fadd float %sub25.us.1.5, %1210
  store float %add58.us.1.5, float* %arrayidx45.us.1.5, align 4, !tbaa !2
  %arrayidx63.us.1.5 = getelementptr inbounds float, float* %data_imag, i64 %1208
  %1211 = load float, float* %arrayidx63.us.1.5, align 4, !tbaa !2
  %sub64.us.1.5 = fsub float %1211, %add40.us.1.5
  store float %sub64.us.1.5, float* %arrayidx23.us.1.5, align 4, !tbaa !2
  %1212 = load float, float* %arrayidx63.us.1.5, align 4, !tbaa !2
  %add76.us.1.5 = fadd float %add40.us.1.5, %1212
  store float %add76.us.1.5, float* %arrayidx63.us.1.5, align 4, !tbaa !2
  %indvars.iv.next.1.5 = add nuw nsw i64 %indvars.iv.next.5, 1
  %1213 = trunc i64 %indvars.iv.next.1.5 to i32
  %add13.us.2.5 = add i32 %1213, %1038
  %add14.us.2.5 = add i32 %add13.us.2.5, 4
  %idxprom15.us.2.5 = sext i32 %add14.us.2.5 to i64
  %arrayidx16.us.2.5 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.5
  %1214 = load float, float* %arrayidx16.us.2.5, align 4, !tbaa !2
  %mul17.us.2.5 = fmul float %1034, %1214
  %arrayidx23.us.2.5 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.5
  %1215 = load float, float* %arrayidx23.us.2.5, align 4, !tbaa !2
  %mul24.us.2.5 = fmul float %1035, %1215
  %sub25.us.2.5 = fsub float %mul17.us.2.5, %mul24.us.2.5
  %mul32.us.2.5 = fmul float %1035, %1214
  %mul39.us.2.5 = fmul float %1034, %1215
  %add40.us.2.5 = fadd float %mul32.us.2.5, %mul39.us.2.5
  %1216 = add nuw nsw i64 %indvars.iv.next.1.5, %1037
  %arrayidx45.us.2.5 = getelementptr inbounds float, float* %data_real, i64 %1216
  %1217 = load float, float* %arrayidx45.us.2.5, align 4, !tbaa !2
  %sub46.us.2.5 = fsub float %1217, %sub25.us.2.5
  store float %sub46.us.2.5, float* %arrayidx16.us.2.5, align 4, !tbaa !2
  %1218 = load float, float* %arrayidx45.us.2.5, align 4, !tbaa !2
  %add58.us.2.5 = fadd float %sub25.us.2.5, %1218
  store float %add58.us.2.5, float* %arrayidx45.us.2.5, align 4, !tbaa !2
  %arrayidx63.us.2.5 = getelementptr inbounds float, float* %data_imag, i64 %1216
  %1219 = load float, float* %arrayidx63.us.2.5, align 4, !tbaa !2
  %sub64.us.2.5 = fsub float %1219, %add40.us.2.5
  store float %sub64.us.2.5, float* %arrayidx23.us.2.5, align 4, !tbaa !2
  %1220 = load float, float* %arrayidx63.us.2.5, align 4, !tbaa !2
  %add76.us.2.5 = fadd float %add40.us.2.5, %1220
  store float %add76.us.2.5, float* %arrayidx63.us.2.5, align 4, !tbaa !2
  %indvars.iv.next.2.5 = add nuw nsw i64 %indvars.iv.next.1.5, 1
  %1221 = trunc i64 %indvars.iv.next.2.5 to i32
  %add13.us.3.5 = add i32 %1221, %1038
  %add14.us.3.5 = add i32 %add13.us.3.5, 4
  %idxprom15.us.3.5 = sext i32 %add14.us.3.5 to i64
  %arrayidx16.us.3.5 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.5
  %1222 = load float, float* %arrayidx16.us.3.5, align 4, !tbaa !2
  %mul17.us.3.5 = fmul float %1034, %1222
  %arrayidx23.us.3.5 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.5
  %1223 = load float, float* %arrayidx23.us.3.5, align 4, !tbaa !2
  %mul24.us.3.5 = fmul float %1035, %1223
  %sub25.us.3.5 = fsub float %mul17.us.3.5, %mul24.us.3.5
  %mul32.us.3.5 = fmul float %1035, %1222
  %mul39.us.3.5 = fmul float %1034, %1223
  %add40.us.3.5 = fadd float %mul32.us.3.5, %mul39.us.3.5
  %1224 = add nuw nsw i64 %indvars.iv.next.2.5, %1037
  %arrayidx45.us.3.5 = getelementptr inbounds float, float* %data_real, i64 %1224
  %1225 = load float, float* %arrayidx45.us.3.5, align 4, !tbaa !2
  %sub46.us.3.5 = fsub float %1225, %sub25.us.3.5
  store float %sub46.us.3.5, float* %arrayidx16.us.3.5, align 4, !tbaa !2
  %1226 = load float, float* %arrayidx45.us.3.5, align 4, !tbaa !2
  %add58.us.3.5 = fadd float %sub25.us.3.5, %1226
  store float %add58.us.3.5, float* %arrayidx45.us.3.5, align 4, !tbaa !2
  %arrayidx63.us.3.5 = getelementptr inbounds float, float* %data_imag, i64 %1224
  %1227 = load float, float* %arrayidx63.us.3.5, align 4, !tbaa !2
  %sub64.us.3.5 = fsub float %1227, %add40.us.3.5
  store float %sub64.us.3.5, float* %arrayidx23.us.3.5, align 4, !tbaa !2
  %1228 = load float, float* %arrayidx63.us.3.5, align 4, !tbaa !2
  %add76.us.3.5 = fadd float %add40.us.3.5, %1228
  store float %add76.us.3.5, float* %arrayidx63.us.3.5, align 4, !tbaa !2
  %indvars.iv.next.3.5 = add nuw nsw i64 %indvars.iv.next.2.5, 1
  %exitcond.3.5 = icmp eq i64 %indvars.iv.next.3.5, 4
  br i1 %exitcond.3.5, label %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.5, label %for.body11.us.5, !llvm.loop !39

for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.5: ; preds = %for.body11.us.5
  br label %for.cond9.for.inc77_crit_edge.us.loopexit.5

for.cond9.for.inc77_crit_edge.us.loopexit.5:      ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.5, %for.body11.us.prol.loopexit.5
  br label %for.cond9.for.inc77_crit_edge.us.5

for.cond9.for.inc77_crit_edge.us.5:               ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.5, %middle.block.5
  %indvars.iv.next163.5 = add nuw nsw i64 %indvars.iv162.5, 1
  %exitcond168.5 = icmp eq i64 %indvars.iv.next163.5, 32
  br i1 %exitcond168.5, label %for.end79.loopexit.5, label %for.body3.us.5

for.end79.loopexit.5:                             ; preds = %for.cond9.for.inc77_crit_edge.us.5
  br label %for.end79.5

for.end79.5:                                      ; preds = %for.end79.loopexit.5, %for.end79.4
  br i1 true, label %for.body3.us.preheader.6, label %for.end79.6

for.body3.us.preheader.6:                         ; preds = %for.end79.5
  %scevgep171.6 = getelementptr float, float* %data_real, i64 2
  %scevgep180.6 = getelementptr float, float* %data_imag, i64 2
  br label %for.body3.us.6

for.body3.us.6:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.6, %for.body3.us.preheader.6
  %indvars.iv162.6 = phi i64 [ 0, %for.body3.us.preheader.6 ], [ %indvars.iv.next163.6, %for.cond9.for.inc77_crit_edge.us.6 ]
  %1229 = trunc i64 %indvars.iv162.6 to i32
  %1230 = mul i32 4, %1229
  %1231 = add i32 2, %1230
  %1232 = sext i32 %1231 to i64
  %scevgep.6 = getelementptr float, float* %data_real, i64 %1232
  %scevgep172.6 = getelementptr float, float* %scevgep171.6, i64 %1232
  %1233 = mul i64 4, %indvars.iv162.6
  %scevgep174.6 = getelementptr float, float* %data_real, i64 %1233
  %1234 = add i64 %1233, 2
  %scevgep176.6 = getelementptr float, float* %data_real, i64 %1234
  %scevgep178.6 = getelementptr float, float* %data_imag, i64 %1232
  %scevgep181.6 = getelementptr float, float* %scevgep180.6, i64 %1232
  %scevgep183.6 = getelementptr float, float* %data_imag, i64 %1233
  %scevgep185.6 = getelementptr float, float* %data_imag, i64 %1234
  %1235 = trunc i64 %indvars.iv162.6 to i32
  %1236 = mul i32 4, %1235
  %1237 = add i32 2, %1236
  %1238 = add nsw i64 %indvars.iv162.6, 63
  %arrayidx.us.6 = getelementptr inbounds float, float* %coef_real, i64 %1238
  %1239 = load float, float* %arrayidx.us.6, align 4, !tbaa !2
  %arrayidx8.us.6 = getelementptr inbounds float, float* %coef_imag, i64 %1238
  %1240 = load float, float* %arrayidx8.us.6, align 4, !tbaa !2
  %1241 = shl nuw nsw i64 %indvars.iv162.6, 1
  %1242 = mul nsw i64 %1241, 2
  %1243 = trunc i64 %1242 to i32
  br i1 true, label %for.body11.us.preheader.6, label %vector.scevcheck.6

vector.scevcheck.6:                               ; preds = %for.body3.us.6
  %1244 = add i32 %1237, 1
  %1245 = icmp slt i32 %1244, %1237
  br i1 %1245, label %for.body11.us.preheader.6, label %vector.memcheck.6

vector.memcheck.6:                                ; preds = %vector.scevcheck.6
  %bound0.6 = icmp ult float* %scevgep.6, %scevgep176.6
  %bound1.6 = icmp ult float* %scevgep174.6, %scevgep172.6
  %found.conflict.6 = and i1 %bound0.6, %bound1.6
  %bound0187.6 = icmp ugt float* %scevgep180.6, %data_real
  %bound1188.6 = icmp ugt float* %scevgep171.6, %data_imag
  %found.conflict189.6 = and i1 %bound0187.6, %bound1188.6
  %conflict.rdx.6 = or i1 %found.conflict.6, %found.conflict189.6
  %bound0190.6 = icmp ult float* %scevgep.6, %scevgep185.6
  %bound1191.6 = icmp ult float* %scevgep183.6, %scevgep172.6
  %found.conflict192.6 = and i1 %bound0190.6, %bound1191.6
  %conflict.rdx193.6 = or i1 %conflict.rdx.6, %found.conflict192.6
  %bound0194.6 = icmp ult float* %scevgep174.6, %scevgep181.6
  %bound1195.6 = icmp ult float* %scevgep178.6, %scevgep176.6
  %found.conflict196.6 = and i1 %bound0194.6, %bound1195.6
  %conflict.rdx197.6 = or i1 %conflict.rdx193.6, %found.conflict196.6
  %bound0198.6 = icmp ult float* %scevgep174.6, %scevgep185.6
  %bound1199.6 = icmp ult float* %scevgep183.6, %scevgep176.6
  %found.conflict200.6 = and i1 %bound0198.6, %bound1199.6
  %conflict.rdx201.6 = or i1 %conflict.rdx197.6, %found.conflict200.6
  %bound0202.6 = icmp ult float* %scevgep178.6, %scevgep185.6
  %bound1203.6 = icmp ult float* %scevgep183.6, %scevgep181.6
  %found.conflict204.6 = and i1 %bound0202.6, %bound1203.6
  %conflict.rdx205.6 = or i1 %conflict.rdx201.6, %found.conflict204.6
  br i1 %conflict.rdx205.6, label %for.body11.us.preheader.6, label %vector.ph.6

vector.ph.6:                                      ; preds = %vector.memcheck.6
  %broadcast.splatinsert209.6 = insertelement <4 x float> undef, float %1239, i32 0
  %broadcast.splat210.6 = shufflevector <4 x float> %broadcast.splatinsert209.6, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert212.6 = insertelement <4 x float> undef, float %1240, i32 0
  %broadcast.splat213.6 = shufflevector <4 x float> %broadcast.splatinsert212.6, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block.unr-lcssa.6, label %vector.ph.new.6

vector.ph.new.6:                                  ; preds = %vector.ph.6
  br label %vector.body.6

vector.body.6:                                    ; preds = %vector.body.6, %vector.ph.new.6
  %index.6 = phi i64 [ 0, %vector.ph.new.6 ], [ %index.next.3.6, %vector.body.6 ]
  %niter.6 = phi i64 [ 4611686018427387904, %vector.ph.new.6 ], [ %niter.nsub.3.6, %vector.body.6 ]
  %1246 = trunc i64 %index.6 to i32
  %1247 = add i32 %1246, %1243
  %1248 = add i32 %1247, 2
  %1249 = sext i32 %1248 to i64
  %1250 = getelementptr inbounds float, float* %data_real, i64 %1249
  %1251 = bitcast float* %1250 to <4 x float>*
  %wide.load.6 = load <4 x float>, <4 x float>* %1251, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1252 = fmul <4 x float> %broadcast.splat210.6, %wide.load.6
  %1253 = getelementptr inbounds float, float* %data_imag, i64 %1249
  %1254 = bitcast float* %1253 to <4 x float>*
  %wide.load211.6 = load <4 x float>, <4 x float>* %1254, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1255 = fmul <4 x float> %broadcast.splat213.6, %wide.load211.6
  %1256 = fsub <4 x float> %1252, %1255
  %1257 = fmul <4 x float> %broadcast.splat213.6, %wide.load.6
  %1258 = fmul <4 x float> %broadcast.splat210.6, %wide.load211.6
  %1259 = fadd <4 x float> %1257, %1258
  %1260 = add nuw nsw i64 %index.6, %1242
  %1261 = getelementptr inbounds float, float* %data_real, i64 %1260
  %1262 = bitcast float* %1261 to <4 x float>*
  %wide.load214.6 = load <4 x float>, <4 x float>* %1262, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1263 = fsub <4 x float> %wide.load214.6, %1256
  %1264 = bitcast float* %1250 to <4 x float>*
  store <4 x float> %1263, <4 x float>* %1264, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1265 = bitcast float* %1261 to <4 x float>*
  %wide.load215.6 = load <4 x float>, <4 x float>* %1265, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1266 = fadd <4 x float> %1256, %wide.load215.6
  %1267 = bitcast float* %1261 to <4 x float>*
  store <4 x float> %1266, <4 x float>* %1267, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1268 = getelementptr inbounds float, float* %data_imag, i64 %1260
  %1269 = bitcast float* %1268 to <4 x float>*
  %wide.load216.6 = load <4 x float>, <4 x float>* %1269, align 4, !tbaa !2, !alias.scope !33
  %1270 = fsub <4 x float> %wide.load216.6, %1259
  %1271 = bitcast float* %1253 to <4 x float>*
  store <4 x float> %1270, <4 x float>* %1271, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1272 = bitcast float* %1268 to <4 x float>*
  %wide.load217.6 = load <4 x float>, <4 x float>* %1272, align 4, !tbaa !2, !alias.scope !33
  %1273 = fadd <4 x float> %1259, %wide.load217.6
  %1274 = bitcast float* %1268 to <4 x float>*
  store <4 x float> %1273, <4 x float>* %1274, align 4, !tbaa !2, !alias.scope !33
  %index.next.6 = add nuw nsw i64 %index.6, 4
  %niter.nsub.6 = sub i64 %niter.6, 1
  %1275 = trunc i64 %index.next.6 to i32
  %1276 = add i32 %1275, %1243
  %1277 = add i32 %1276, 2
  %1278 = sext i32 %1277 to i64
  %1279 = getelementptr inbounds float, float* %data_real, i64 %1278
  %1280 = bitcast float* %1279 to <4 x float>*
  %wide.load.1.6 = load <4 x float>, <4 x float>* %1280, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1281 = fmul <4 x float> %broadcast.splat210.6, %wide.load.1.6
  %1282 = getelementptr inbounds float, float* %data_imag, i64 %1278
  %1283 = bitcast float* %1282 to <4 x float>*
  %wide.load211.1.6 = load <4 x float>, <4 x float>* %1283, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1284 = fmul <4 x float> %broadcast.splat213.6, %wide.load211.1.6
  %1285 = fsub <4 x float> %1281, %1284
  %1286 = fmul <4 x float> %broadcast.splat213.6, %wide.load.1.6
  %1287 = fmul <4 x float> %broadcast.splat210.6, %wide.load211.1.6
  %1288 = fadd <4 x float> %1286, %1287
  %1289 = add nuw nsw i64 %index.next.6, %1242
  %1290 = getelementptr inbounds float, float* %data_real, i64 %1289
  %1291 = bitcast float* %1290 to <4 x float>*
  %wide.load214.1.6 = load <4 x float>, <4 x float>* %1291, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1292 = fsub <4 x float> %wide.load214.1.6, %1285
  %1293 = bitcast float* %1279 to <4 x float>*
  store <4 x float> %1292, <4 x float>* %1293, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1294 = bitcast float* %1290 to <4 x float>*
  %wide.load215.1.6 = load <4 x float>, <4 x float>* %1294, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1295 = fadd <4 x float> %1285, %wide.load215.1.6
  %1296 = bitcast float* %1290 to <4 x float>*
  store <4 x float> %1295, <4 x float>* %1296, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1297 = getelementptr inbounds float, float* %data_imag, i64 %1289
  %1298 = bitcast float* %1297 to <4 x float>*
  %wide.load216.1.6 = load <4 x float>, <4 x float>* %1298, align 4, !tbaa !2, !alias.scope !33
  %1299 = fsub <4 x float> %wide.load216.1.6, %1288
  %1300 = bitcast float* %1282 to <4 x float>*
  store <4 x float> %1299, <4 x float>* %1300, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1301 = bitcast float* %1297 to <4 x float>*
  %wide.load217.1.6 = load <4 x float>, <4 x float>* %1301, align 4, !tbaa !2, !alias.scope !33
  %1302 = fadd <4 x float> %1288, %wide.load217.1.6
  %1303 = bitcast float* %1297 to <4 x float>*
  store <4 x float> %1302, <4 x float>* %1303, align 4, !tbaa !2, !alias.scope !33
  %index.next.1.6 = add nuw nsw i64 %index.next.6, 4
  %niter.nsub.1.6 = sub i64 %niter.nsub.6, 1
  %1304 = trunc i64 %index.next.1.6 to i32
  %1305 = add i32 %1304, %1243
  %1306 = add i32 %1305, 2
  %1307 = sext i32 %1306 to i64
  %1308 = getelementptr inbounds float, float* %data_real, i64 %1307
  %1309 = bitcast float* %1308 to <4 x float>*
  %wide.load.2.6 = load <4 x float>, <4 x float>* %1309, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1310 = fmul <4 x float> %broadcast.splat210.6, %wide.load.2.6
  %1311 = getelementptr inbounds float, float* %data_imag, i64 %1307
  %1312 = bitcast float* %1311 to <4 x float>*
  %wide.load211.2.6 = load <4 x float>, <4 x float>* %1312, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1313 = fmul <4 x float> %broadcast.splat213.6, %wide.load211.2.6
  %1314 = fsub <4 x float> %1310, %1313
  %1315 = fmul <4 x float> %broadcast.splat213.6, %wide.load.2.6
  %1316 = fmul <4 x float> %broadcast.splat210.6, %wide.load211.2.6
  %1317 = fadd <4 x float> %1315, %1316
  %1318 = add nuw nsw i64 %index.next.1.6, %1242
  %1319 = getelementptr inbounds float, float* %data_real, i64 %1318
  %1320 = bitcast float* %1319 to <4 x float>*
  %wide.load214.2.6 = load <4 x float>, <4 x float>* %1320, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1321 = fsub <4 x float> %wide.load214.2.6, %1314
  %1322 = bitcast float* %1308 to <4 x float>*
  store <4 x float> %1321, <4 x float>* %1322, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1323 = bitcast float* %1319 to <4 x float>*
  %wide.load215.2.6 = load <4 x float>, <4 x float>* %1323, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1324 = fadd <4 x float> %1314, %wide.load215.2.6
  %1325 = bitcast float* %1319 to <4 x float>*
  store <4 x float> %1324, <4 x float>* %1325, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1326 = getelementptr inbounds float, float* %data_imag, i64 %1318
  %1327 = bitcast float* %1326 to <4 x float>*
  %wide.load216.2.6 = load <4 x float>, <4 x float>* %1327, align 4, !tbaa !2, !alias.scope !33
  %1328 = fsub <4 x float> %wide.load216.2.6, %1317
  %1329 = bitcast float* %1311 to <4 x float>*
  store <4 x float> %1328, <4 x float>* %1329, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1330 = bitcast float* %1326 to <4 x float>*
  %wide.load217.2.6 = load <4 x float>, <4 x float>* %1330, align 4, !tbaa !2, !alias.scope !33
  %1331 = fadd <4 x float> %1317, %wide.load217.2.6
  %1332 = bitcast float* %1326 to <4 x float>*
  store <4 x float> %1331, <4 x float>* %1332, align 4, !tbaa !2, !alias.scope !33
  %index.next.2.6 = add nuw nsw i64 %index.next.1.6, 4
  %niter.nsub.2.6 = sub i64 %niter.nsub.1.6, 1
  %1333 = trunc i64 %index.next.2.6 to i32
  %1334 = add i32 %1333, %1243
  %1335 = add i32 %1334, 2
  %1336 = sext i32 %1335 to i64
  %1337 = getelementptr inbounds float, float* %data_real, i64 %1336
  %1338 = bitcast float* %1337 to <4 x float>*
  %wide.load.3.6 = load <4 x float>, <4 x float>* %1338, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1339 = fmul <4 x float> %broadcast.splat210.6, %wide.load.3.6
  %1340 = getelementptr inbounds float, float* %data_imag, i64 %1336
  %1341 = bitcast float* %1340 to <4 x float>*
  %wide.load211.3.6 = load <4 x float>, <4 x float>* %1341, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1342 = fmul <4 x float> %broadcast.splat213.6, %wide.load211.3.6
  %1343 = fsub <4 x float> %1339, %1342
  %1344 = fmul <4 x float> %broadcast.splat213.6, %wide.load.3.6
  %1345 = fmul <4 x float> %broadcast.splat210.6, %wide.load211.3.6
  %1346 = fadd <4 x float> %1344, %1345
  %1347 = add nuw nsw i64 %index.next.2.6, %1242
  %1348 = getelementptr inbounds float, float* %data_real, i64 %1347
  %1349 = bitcast float* %1348 to <4 x float>*
  %wide.load214.3.6 = load <4 x float>, <4 x float>* %1349, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1350 = fsub <4 x float> %wide.load214.3.6, %1343
  %1351 = bitcast float* %1337 to <4 x float>*
  store <4 x float> %1350, <4 x float>* %1351, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1352 = bitcast float* %1348 to <4 x float>*
  %wide.load215.3.6 = load <4 x float>, <4 x float>* %1352, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1353 = fadd <4 x float> %1343, %wide.load215.3.6
  %1354 = bitcast float* %1348 to <4 x float>*
  store <4 x float> %1353, <4 x float>* %1354, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1355 = getelementptr inbounds float, float* %data_imag, i64 %1347
  %1356 = bitcast float* %1355 to <4 x float>*
  %wide.load216.3.6 = load <4 x float>, <4 x float>* %1356, align 4, !tbaa !2, !alias.scope !33
  %1357 = fsub <4 x float> %wide.load216.3.6, %1346
  %1358 = bitcast float* %1340 to <4 x float>*
  store <4 x float> %1357, <4 x float>* %1358, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1359 = bitcast float* %1355 to <4 x float>*
  %wide.load217.3.6 = load <4 x float>, <4 x float>* %1359, align 4, !tbaa !2, !alias.scope !33
  %1360 = fadd <4 x float> %1346, %wide.load217.3.6
  %1361 = bitcast float* %1355 to <4 x float>*
  store <4 x float> %1360, <4 x float>* %1361, align 4, !tbaa !2, !alias.scope !33
  %index.next.3.6 = add i64 %index.next.2.6, 4
  %niter.nsub.3.6 = sub i64 %niter.nsub.2.6, 1
  %niter.ncmp.3.6 = icmp eq i64 %niter.nsub.3.6, 0
  br i1 %niter.ncmp.3.6, label %middle.block.unr-lcssa.loopexit.6, label %vector.body.6, !llvm.loop !36

middle.block.unr-lcssa.loopexit.6:                ; preds = %vector.body.6
  %index.unr.ph.6 = phi i64 [ %index.next.3.6, %vector.body.6 ]
  br label %middle.block.unr-lcssa.6

middle.block.unr-lcssa.6:                         ; preds = %middle.block.unr-lcssa.loopexit.6, %vector.ph.6
  %index.unr.6 = phi i64 [ 0, %vector.ph.6 ], [ %index.unr.ph.6, %middle.block.unr-lcssa.loopexit.6 ]
  br i1 false, label %vector.body.epil.preheader.6, label %middle.block.6

vector.body.epil.preheader.6:                     ; preds = %middle.block.unr-lcssa.6
  br label %vector.body.epil.6

vector.body.epil.6:                               ; preds = %vector.body.epil.6, %vector.body.epil.preheader.6
  %index.epil.6 = phi i64 [ %index.unr.6, %vector.body.epil.preheader.6 ], [ %index.next.epil.6, %vector.body.epil.6 ]
  %epil.iter.6 = phi i64 [ 0, %vector.body.epil.preheader.6 ], [ %epil.iter.sub.6, %vector.body.epil.6 ]
  %1362 = trunc i64 %index.epil.6 to i32
  %1363 = add i32 %1362, %1243
  %1364 = add i32 %1363, 2
  %1365 = sext i32 %1364 to i64
  %1366 = getelementptr inbounds float, float* %data_real, i64 %1365
  %1367 = bitcast float* %1366 to <4 x float>*
  %wide.load.epil.6 = load <4 x float>, <4 x float>* %1367, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1368 = fmul <4 x float> %broadcast.splat210.6, %wide.load.epil.6
  %1369 = getelementptr inbounds float, float* %data_imag, i64 %1365
  %1370 = bitcast float* %1369 to <4 x float>*
  %wide.load211.epil.6 = load <4 x float>, <4 x float>* %1370, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1371 = fmul <4 x float> %broadcast.splat213.6, %wide.load211.epil.6
  %1372 = fsub <4 x float> %1368, %1371
  %1373 = fmul <4 x float> %broadcast.splat213.6, %wide.load.epil.6
  %1374 = fmul <4 x float> %broadcast.splat210.6, %wide.load211.epil.6
  %1375 = fadd <4 x float> %1373, %1374
  %1376 = add nuw nsw i64 %index.epil.6, %1242
  %1377 = getelementptr inbounds float, float* %data_real, i64 %1376
  %1378 = bitcast float* %1377 to <4 x float>*
  %wide.load214.epil.6 = load <4 x float>, <4 x float>* %1378, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1379 = fsub <4 x float> %wide.load214.epil.6, %1372
  %1380 = bitcast float* %1366 to <4 x float>*
  store <4 x float> %1379, <4 x float>* %1380, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1381 = bitcast float* %1377 to <4 x float>*
  %wide.load215.epil.6 = load <4 x float>, <4 x float>* %1381, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1382 = fadd <4 x float> %1372, %wide.load215.epil.6
  %1383 = bitcast float* %1377 to <4 x float>*
  store <4 x float> %1382, <4 x float>* %1383, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1384 = getelementptr inbounds float, float* %data_imag, i64 %1376
  %1385 = bitcast float* %1384 to <4 x float>*
  %wide.load216.epil.6 = load <4 x float>, <4 x float>* %1385, align 4, !tbaa !2, !alias.scope !33
  %1386 = fsub <4 x float> %wide.load216.epil.6, %1375
  %1387 = bitcast float* %1369 to <4 x float>*
  store <4 x float> %1386, <4 x float>* %1387, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1388 = bitcast float* %1384 to <4 x float>*
  %wide.load217.epil.6 = load <4 x float>, <4 x float>* %1388, align 4, !tbaa !2, !alias.scope !33
  %1389 = fadd <4 x float> %1375, %wide.load217.epil.6
  %1390 = bitcast float* %1384 to <4 x float>*
  store <4 x float> %1389, <4 x float>* %1390, align 4, !tbaa !2, !alias.scope !33
  %index.next.epil.6 = add i64 %index.epil.6, 4
  %epil.iter.sub.6 = sub i64 %epil.iter.6, 1
  %epil.iter.cmp.6 = icmp ne i64 %epil.iter.sub.6, 0
  br i1 %epil.iter.cmp.6, label %vector.body.epil.6, label %middle.block.epilog-lcssa.6, !llvm.loop !37

middle.block.epilog-lcssa.6:                      ; preds = %vector.body.epil.6
  br label %middle.block.6

middle.block.6:                                   ; preds = %middle.block.epilog-lcssa.6, %middle.block.unr-lcssa.6
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.6, label %for.body11.us.preheader.6

for.body11.us.preheader.6:                        ; preds = %middle.block.6, %vector.memcheck.6, %vector.scevcheck.6, %for.body3.us.6
  br i1 true, label %for.body11.us.prol.preheader.6, label %for.body11.us.prol.loopexit.6

for.body11.us.prol.preheader.6:                   ; preds = %for.body11.us.preheader.6
  br label %for.body11.us.prol.6

for.body11.us.prol.6:                             ; preds = %for.body11.us.prol.6, %for.body11.us.prol.preheader.6
  %indvars.iv.prol.6 = phi i64 [ %indvars.iv.next.prol.6, %for.body11.us.prol.6 ], [ 0, %for.body11.us.prol.preheader.6 ]
  %prol.iter.6 = phi i64 [ 2, %for.body11.us.prol.preheader.6 ], [ %prol.iter.sub.6, %for.body11.us.prol.6 ]
  %1391 = trunc i64 %indvars.iv.prol.6 to i32
  %add13.us.prol.6 = add i32 %1391, %1243
  %add14.us.prol.6 = add i32 %add13.us.prol.6, 2
  %idxprom15.us.prol.6 = sext i32 %add14.us.prol.6 to i64
  %arrayidx16.us.prol.6 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.prol.6
  %1392 = load float, float* %arrayidx16.us.prol.6, align 4, !tbaa !2
  %mul17.us.prol.6 = fmul float %1239, %1392
  %arrayidx23.us.prol.6 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.prol.6
  %1393 = load float, float* %arrayidx23.us.prol.6, align 4, !tbaa !2
  %mul24.us.prol.6 = fmul float %1240, %1393
  %sub25.us.prol.6 = fsub float %mul17.us.prol.6, %mul24.us.prol.6
  %mul32.us.prol.6 = fmul float %1240, %1392
  %mul39.us.prol.6 = fmul float %1239, %1393
  %add40.us.prol.6 = fadd float %mul32.us.prol.6, %mul39.us.prol.6
  %1394 = add nuw nsw i64 %indvars.iv.prol.6, %1242
  %arrayidx45.us.prol.6 = getelementptr inbounds float, float* %data_real, i64 %1394
  %1395 = load float, float* %arrayidx45.us.prol.6, align 4, !tbaa !2
  %sub46.us.prol.6 = fsub float %1395, %sub25.us.prol.6
  store float %sub46.us.prol.6, float* %arrayidx16.us.prol.6, align 4, !tbaa !2
  %1396 = load float, float* %arrayidx45.us.prol.6, align 4, !tbaa !2
  %add58.us.prol.6 = fadd float %sub25.us.prol.6, %1396
  store float %add58.us.prol.6, float* %arrayidx45.us.prol.6, align 4, !tbaa !2
  %arrayidx63.us.prol.6 = getelementptr inbounds float, float* %data_imag, i64 %1394
  %1397 = load float, float* %arrayidx63.us.prol.6, align 4, !tbaa !2
  %sub64.us.prol.6 = fsub float %1397, %add40.us.prol.6
  store float %sub64.us.prol.6, float* %arrayidx23.us.prol.6, align 4, !tbaa !2
  %1398 = load float, float* %arrayidx63.us.prol.6, align 4, !tbaa !2
  %add76.us.prol.6 = fadd float %add40.us.prol.6, %1398
  store float %add76.us.prol.6, float* %arrayidx63.us.prol.6, align 4, !tbaa !2
  %indvars.iv.next.prol.6 = add nuw nsw i64 %indvars.iv.prol.6, 1
  %prol.iter.sub.6 = sub i64 %prol.iter.6, 1
  %prol.iter.cmp.6 = icmp ne i64 %prol.iter.sub.6, 0
  br i1 %prol.iter.cmp.6, label %for.body11.us.prol.6, label %for.body11.us.prol.loopexit.unr-lcssa.6, !llvm.loop !38

for.body11.us.prol.loopexit.unr-lcssa.6:          ; preds = %for.body11.us.prol.6
  %indvars.iv.unr.ph.6 = phi i64 [ %indvars.iv.next.prol.6, %for.body11.us.prol.6 ]
  br label %for.body11.us.prol.loopexit.6

for.body11.us.prol.loopexit.6:                    ; preds = %for.body11.us.prol.loopexit.unr-lcssa.6, %for.body11.us.preheader.6
  %indvars.iv.unr.6 = phi i64 [ 0, %for.body11.us.preheader.6 ], [ %indvars.iv.unr.ph.6, %for.body11.us.prol.loopexit.unr-lcssa.6 ]
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.loopexit.6, label %for.body11.us.preheader.new.6

for.body11.us.preheader.new.6:                    ; preds = %for.body11.us.prol.loopexit.6
  br label %for.body11.us.6

for.body11.us.6:                                  ; preds = %for.body11.us.6, %for.body11.us.preheader.new.6
  %indvars.iv.6 = phi i64 [ %indvars.iv.unr.6, %for.body11.us.preheader.new.6 ], [ %indvars.iv.next.3.6, %for.body11.us.6 ]
  %1399 = trunc i64 %indvars.iv.6 to i32
  %add13.us.6 = add i32 %1399, %1243
  %add14.us.6 = add i32 %add13.us.6, 2
  %idxprom15.us.6 = sext i32 %add14.us.6 to i64
  %arrayidx16.us.6 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.6
  %1400 = load float, float* %arrayidx16.us.6, align 4, !tbaa !2
  %mul17.us.6 = fmul float %1239, %1400
  %arrayidx23.us.6 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.6
  %1401 = load float, float* %arrayidx23.us.6, align 4, !tbaa !2
  %mul24.us.6 = fmul float %1240, %1401
  %sub25.us.6 = fsub float %mul17.us.6, %mul24.us.6
  %mul32.us.6 = fmul float %1240, %1400
  %mul39.us.6 = fmul float %1239, %1401
  %add40.us.6 = fadd float %mul32.us.6, %mul39.us.6
  %1402 = add nuw nsw i64 %indvars.iv.6, %1242
  %arrayidx45.us.6 = getelementptr inbounds float, float* %data_real, i64 %1402
  %1403 = load float, float* %arrayidx45.us.6, align 4, !tbaa !2
  %sub46.us.6 = fsub float %1403, %sub25.us.6
  store float %sub46.us.6, float* %arrayidx16.us.6, align 4, !tbaa !2
  %1404 = load float, float* %arrayidx45.us.6, align 4, !tbaa !2
  %add58.us.6 = fadd float %sub25.us.6, %1404
  store float %add58.us.6, float* %arrayidx45.us.6, align 4, !tbaa !2
  %arrayidx63.us.6 = getelementptr inbounds float, float* %data_imag, i64 %1402
  %1405 = load float, float* %arrayidx63.us.6, align 4, !tbaa !2
  %sub64.us.6 = fsub float %1405, %add40.us.6
  store float %sub64.us.6, float* %arrayidx23.us.6, align 4, !tbaa !2
  %1406 = load float, float* %arrayidx63.us.6, align 4, !tbaa !2
  %add76.us.6 = fadd float %add40.us.6, %1406
  store float %add76.us.6, float* %arrayidx63.us.6, align 4, !tbaa !2
  %indvars.iv.next.6 = add nuw nsw i64 %indvars.iv.6, 1
  %1407 = trunc i64 %indvars.iv.next.6 to i32
  %add13.us.1.6 = add i32 %1407, %1243
  %add14.us.1.6 = add i32 %add13.us.1.6, 2
  %idxprom15.us.1.6 = sext i32 %add14.us.1.6 to i64
  %arrayidx16.us.1.6 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.6
  %1408 = load float, float* %arrayidx16.us.1.6, align 4, !tbaa !2
  %mul17.us.1.6 = fmul float %1239, %1408
  %arrayidx23.us.1.6 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.6
  %1409 = load float, float* %arrayidx23.us.1.6, align 4, !tbaa !2
  %mul24.us.1.6 = fmul float %1240, %1409
  %sub25.us.1.6 = fsub float %mul17.us.1.6, %mul24.us.1.6
  %mul32.us.1.6 = fmul float %1240, %1408
  %mul39.us.1.6 = fmul float %1239, %1409
  %add40.us.1.6 = fadd float %mul32.us.1.6, %mul39.us.1.6
  %1410 = add nuw nsw i64 %indvars.iv.next.6, %1242
  %arrayidx45.us.1.6 = getelementptr inbounds float, float* %data_real, i64 %1410
  %1411 = load float, float* %arrayidx45.us.1.6, align 4, !tbaa !2
  %sub46.us.1.6 = fsub float %1411, %sub25.us.1.6
  store float %sub46.us.1.6, float* %arrayidx16.us.1.6, align 4, !tbaa !2
  %1412 = load float, float* %arrayidx45.us.1.6, align 4, !tbaa !2
  %add58.us.1.6 = fadd float %sub25.us.1.6, %1412
  store float %add58.us.1.6, float* %arrayidx45.us.1.6, align 4, !tbaa !2
  %arrayidx63.us.1.6 = getelementptr inbounds float, float* %data_imag, i64 %1410
  %1413 = load float, float* %arrayidx63.us.1.6, align 4, !tbaa !2
  %sub64.us.1.6 = fsub float %1413, %add40.us.1.6
  store float %sub64.us.1.6, float* %arrayidx23.us.1.6, align 4, !tbaa !2
  %1414 = load float, float* %arrayidx63.us.1.6, align 4, !tbaa !2
  %add76.us.1.6 = fadd float %add40.us.1.6, %1414
  store float %add76.us.1.6, float* %arrayidx63.us.1.6, align 4, !tbaa !2
  %indvars.iv.next.1.6 = add nuw nsw i64 %indvars.iv.next.6, 1
  %1415 = trunc i64 %indvars.iv.next.1.6 to i32
  %add13.us.2.6 = add i32 %1415, %1243
  %add14.us.2.6 = add i32 %add13.us.2.6, 2
  %idxprom15.us.2.6 = sext i32 %add14.us.2.6 to i64
  %arrayidx16.us.2.6 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.6
  %1416 = load float, float* %arrayidx16.us.2.6, align 4, !tbaa !2
  %mul17.us.2.6 = fmul float %1239, %1416
  %arrayidx23.us.2.6 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.6
  %1417 = load float, float* %arrayidx23.us.2.6, align 4, !tbaa !2
  %mul24.us.2.6 = fmul float %1240, %1417
  %sub25.us.2.6 = fsub float %mul17.us.2.6, %mul24.us.2.6
  %mul32.us.2.6 = fmul float %1240, %1416
  %mul39.us.2.6 = fmul float %1239, %1417
  %add40.us.2.6 = fadd float %mul32.us.2.6, %mul39.us.2.6
  %1418 = add nuw nsw i64 %indvars.iv.next.1.6, %1242
  %arrayidx45.us.2.6 = getelementptr inbounds float, float* %data_real, i64 %1418
  %1419 = load float, float* %arrayidx45.us.2.6, align 4, !tbaa !2
  %sub46.us.2.6 = fsub float %1419, %sub25.us.2.6
  store float %sub46.us.2.6, float* %arrayidx16.us.2.6, align 4, !tbaa !2
  %1420 = load float, float* %arrayidx45.us.2.6, align 4, !tbaa !2
  %add58.us.2.6 = fadd float %sub25.us.2.6, %1420
  store float %add58.us.2.6, float* %arrayidx45.us.2.6, align 4, !tbaa !2
  %arrayidx63.us.2.6 = getelementptr inbounds float, float* %data_imag, i64 %1418
  %1421 = load float, float* %arrayidx63.us.2.6, align 4, !tbaa !2
  %sub64.us.2.6 = fsub float %1421, %add40.us.2.6
  store float %sub64.us.2.6, float* %arrayidx23.us.2.6, align 4, !tbaa !2
  %1422 = load float, float* %arrayidx63.us.2.6, align 4, !tbaa !2
  %add76.us.2.6 = fadd float %add40.us.2.6, %1422
  store float %add76.us.2.6, float* %arrayidx63.us.2.6, align 4, !tbaa !2
  %indvars.iv.next.2.6 = add nuw nsw i64 %indvars.iv.next.1.6, 1
  %1423 = trunc i64 %indvars.iv.next.2.6 to i32
  %add13.us.3.6 = add i32 %1423, %1243
  %add14.us.3.6 = add i32 %add13.us.3.6, 2
  %idxprom15.us.3.6 = sext i32 %add14.us.3.6 to i64
  %arrayidx16.us.3.6 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.6
  %1424 = load float, float* %arrayidx16.us.3.6, align 4, !tbaa !2
  %mul17.us.3.6 = fmul float %1239, %1424
  %arrayidx23.us.3.6 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.6
  %1425 = load float, float* %arrayidx23.us.3.6, align 4, !tbaa !2
  %mul24.us.3.6 = fmul float %1240, %1425
  %sub25.us.3.6 = fsub float %mul17.us.3.6, %mul24.us.3.6
  %mul32.us.3.6 = fmul float %1240, %1424
  %mul39.us.3.6 = fmul float %1239, %1425
  %add40.us.3.6 = fadd float %mul32.us.3.6, %mul39.us.3.6
  %1426 = add nuw nsw i64 %indvars.iv.next.2.6, %1242
  %arrayidx45.us.3.6 = getelementptr inbounds float, float* %data_real, i64 %1426
  %1427 = load float, float* %arrayidx45.us.3.6, align 4, !tbaa !2
  %sub46.us.3.6 = fsub float %1427, %sub25.us.3.6
  store float %sub46.us.3.6, float* %arrayidx16.us.3.6, align 4, !tbaa !2
  %1428 = load float, float* %arrayidx45.us.3.6, align 4, !tbaa !2
  %add58.us.3.6 = fadd float %sub25.us.3.6, %1428
  store float %add58.us.3.6, float* %arrayidx45.us.3.6, align 4, !tbaa !2
  %arrayidx63.us.3.6 = getelementptr inbounds float, float* %data_imag, i64 %1426
  %1429 = load float, float* %arrayidx63.us.3.6, align 4, !tbaa !2
  %sub64.us.3.6 = fsub float %1429, %add40.us.3.6
  store float %sub64.us.3.6, float* %arrayidx23.us.3.6, align 4, !tbaa !2
  %1430 = load float, float* %arrayidx63.us.3.6, align 4, !tbaa !2
  %add76.us.3.6 = fadd float %add40.us.3.6, %1430
  store float %add76.us.3.6, float* %arrayidx63.us.3.6, align 4, !tbaa !2
  %indvars.iv.next.3.6 = add nuw nsw i64 %indvars.iv.next.2.6, 1
  %exitcond.3.6 = icmp eq i64 %indvars.iv.next.3.6, 2
  br i1 %exitcond.3.6, label %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.6, label %for.body11.us.6, !llvm.loop !39

for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.6: ; preds = %for.body11.us.6
  br label %for.cond9.for.inc77_crit_edge.us.loopexit.6

for.cond9.for.inc77_crit_edge.us.loopexit.6:      ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.6, %for.body11.us.prol.loopexit.6
  br label %for.cond9.for.inc77_crit_edge.us.6

for.cond9.for.inc77_crit_edge.us.6:               ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.6, %middle.block.6
  %indvars.iv.next163.6 = add nuw nsw i64 %indvars.iv162.6, 1
  %exitcond168.6 = icmp eq i64 %indvars.iv.next163.6, 64
  br i1 %exitcond168.6, label %for.end79.loopexit.6, label %for.body3.us.6

for.end79.loopexit.6:                             ; preds = %for.cond9.for.inc77_crit_edge.us.6
  br label %for.end79.6

for.end79.6:                                      ; preds = %for.end79.loopexit.6, %for.end79.5
  br i1 true, label %for.body3.us.preheader.7, label %for.end79.7

for.body3.us.preheader.7:                         ; preds = %for.end79.6
  %scevgep171.7 = getelementptr float, float* %data_real, i64 1
  %scevgep180.7 = getelementptr float, float* %data_imag, i64 1
  br label %for.body3.us.7

for.body3.us.7:                                   ; preds = %for.cond9.for.inc77_crit_edge.us.7, %for.body3.us.preheader.7
  %indvars.iv162.7 = phi i64 [ 0, %for.body3.us.preheader.7 ], [ %indvars.iv.next163.7, %for.cond9.for.inc77_crit_edge.us.7 ]
  %1431 = trunc i64 %indvars.iv162.7 to i32
  %1432 = mul i32 2, %1431
  %1433 = add i32 1, %1432
  %1434 = sext i32 %1433 to i64
  %scevgep.7 = getelementptr float, float* %data_real, i64 %1434
  %scevgep172.7 = getelementptr float, float* %scevgep171.7, i64 %1434
  %1435 = mul i64 2, %indvars.iv162.7
  %scevgep174.7 = getelementptr float, float* %data_real, i64 %1435
  %1436 = add i64 %1435, 1
  %scevgep176.7 = getelementptr float, float* %data_real, i64 %1436
  %scevgep178.7 = getelementptr float, float* %data_imag, i64 %1434
  %scevgep181.7 = getelementptr float, float* %scevgep180.7, i64 %1434
  %scevgep183.7 = getelementptr float, float* %data_imag, i64 %1435
  %scevgep185.7 = getelementptr float, float* %data_imag, i64 %1436
  %1437 = trunc i64 %indvars.iv162.7 to i32
  %1438 = mul i32 2, %1437
  %1439 = add i32 1, %1438
  %1440 = add nsw i64 %indvars.iv162.7, 127
  %arrayidx.us.7 = getelementptr inbounds float, float* %coef_real, i64 %1440
  %1441 = load float, float* %arrayidx.us.7, align 4, !tbaa !2
  %arrayidx8.us.7 = getelementptr inbounds float, float* %coef_imag, i64 %1440
  %1442 = load float, float* %arrayidx8.us.7, align 4, !tbaa !2
  %1443 = shl nuw nsw i64 %indvars.iv162.7, 1
  %1444 = trunc i64 %1443 to i32
  br i1 true, label %for.body11.us.preheader.7, label %vector.scevcheck.7

vector.scevcheck.7:                               ; preds = %for.body3.us.7
  br i1 false, label %for.body11.us.preheader.7, label %vector.memcheck.7

vector.memcheck.7:                                ; preds = %vector.scevcheck.7
  %bound0.7 = icmp ult float* %scevgep.7, %scevgep176.7
  %bound1.7 = icmp ult float* %scevgep174.7, %scevgep172.7
  %found.conflict.7 = and i1 %bound0.7, %bound1.7
  %bound0187.7 = icmp ugt float* %scevgep180.7, %data_real
  %bound1188.7 = icmp ugt float* %scevgep171.7, %data_imag
  %found.conflict189.7 = and i1 %bound0187.7, %bound1188.7
  %conflict.rdx.7 = or i1 %found.conflict.7, %found.conflict189.7
  %bound0190.7 = icmp ult float* %scevgep.7, %scevgep185.7
  %bound1191.7 = icmp ult float* %scevgep183.7, %scevgep172.7
  %found.conflict192.7 = and i1 %bound0190.7, %bound1191.7
  %conflict.rdx193.7 = or i1 %conflict.rdx.7, %found.conflict192.7
  %bound0194.7 = icmp ult float* %scevgep174.7, %scevgep181.7
  %bound1195.7 = icmp ult float* %scevgep178.7, %scevgep176.7
  %found.conflict196.7 = and i1 %bound0194.7, %bound1195.7
  %conflict.rdx197.7 = or i1 %conflict.rdx193.7, %found.conflict196.7
  %bound0198.7 = icmp ult float* %scevgep174.7, %scevgep185.7
  %bound1199.7 = icmp ult float* %scevgep183.7, %scevgep176.7
  %found.conflict200.7 = and i1 %bound0198.7, %bound1199.7
  %conflict.rdx201.7 = or i1 %conflict.rdx197.7, %found.conflict200.7
  %bound0202.7 = icmp ult float* %scevgep178.7, %scevgep185.7
  %bound1203.7 = icmp ult float* %scevgep183.7, %scevgep181.7
  %found.conflict204.7 = and i1 %bound0202.7, %bound1203.7
  %conflict.rdx205.7 = or i1 %conflict.rdx201.7, %found.conflict204.7
  br i1 %conflict.rdx205.7, label %for.body11.us.preheader.7, label %vector.ph.7

vector.ph.7:                                      ; preds = %vector.memcheck.7
  %broadcast.splatinsert209.7 = insertelement <4 x float> undef, float %1441, i32 0
  %broadcast.splat210.7 = shufflevector <4 x float> %broadcast.splatinsert209.7, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert212.7 = insertelement <4 x float> undef, float %1442, i32 0
  %broadcast.splat213.7 = shufflevector <4 x float> %broadcast.splatinsert212.7, <4 x float> undef, <4 x i32> zeroinitializer
  br i1 false, label %middle.block.unr-lcssa.7, label %vector.ph.new.7

vector.ph.new.7:                                  ; preds = %vector.ph.7
  br label %vector.body.7

vector.body.7:                                    ; preds = %vector.body.7, %vector.ph.new.7
  %index.7 = phi i64 [ 0, %vector.ph.new.7 ], [ %index.next.3.7, %vector.body.7 ]
  %niter.7 = phi i64 [ 4611686018427387904, %vector.ph.new.7 ], [ %niter.nsub.3.7, %vector.body.7 ]
  %1445 = trunc i64 %index.7 to i32
  %1446 = add i32 %1445, %1444
  %1447 = add i32 %1446, 1
  %1448 = sext i32 %1447 to i64
  %1449 = getelementptr inbounds float, float* %data_real, i64 %1448
  %1450 = bitcast float* %1449 to <4 x float>*
  %wide.load.7 = load <4 x float>, <4 x float>* %1450, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1451 = fmul <4 x float> %broadcast.splat210.7, %wide.load.7
  %1452 = getelementptr inbounds float, float* %data_imag, i64 %1448
  %1453 = bitcast float* %1452 to <4 x float>*
  %wide.load211.7 = load <4 x float>, <4 x float>* %1453, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1454 = fmul <4 x float> %broadcast.splat213.7, %wide.load211.7
  %1455 = fsub <4 x float> %1451, %1454
  %1456 = fmul <4 x float> %broadcast.splat213.7, %wide.load.7
  %1457 = fmul <4 x float> %broadcast.splat210.7, %wide.load211.7
  %1458 = fadd <4 x float> %1456, %1457
  %1459 = add nuw nsw i64 %index.7, %1443
  %1460 = getelementptr inbounds float, float* %data_real, i64 %1459
  %1461 = bitcast float* %1460 to <4 x float>*
  %wide.load214.7 = load <4 x float>, <4 x float>* %1461, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1462 = fsub <4 x float> %wide.load214.7, %1455
  %1463 = bitcast float* %1449 to <4 x float>*
  store <4 x float> %1462, <4 x float>* %1463, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1464 = bitcast float* %1460 to <4 x float>*
  %wide.load215.7 = load <4 x float>, <4 x float>* %1464, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1465 = fadd <4 x float> %1455, %wide.load215.7
  %1466 = bitcast float* %1460 to <4 x float>*
  store <4 x float> %1465, <4 x float>* %1466, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1467 = getelementptr inbounds float, float* %data_imag, i64 %1459
  %1468 = bitcast float* %1467 to <4 x float>*
  %wide.load216.7 = load <4 x float>, <4 x float>* %1468, align 4, !tbaa !2, !alias.scope !33
  %1469 = fsub <4 x float> %wide.load216.7, %1458
  %1470 = bitcast float* %1452 to <4 x float>*
  store <4 x float> %1469, <4 x float>* %1470, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1471 = bitcast float* %1467 to <4 x float>*
  %wide.load217.7 = load <4 x float>, <4 x float>* %1471, align 4, !tbaa !2, !alias.scope !33
  %1472 = fadd <4 x float> %1458, %wide.load217.7
  %1473 = bitcast float* %1467 to <4 x float>*
  store <4 x float> %1472, <4 x float>* %1473, align 4, !tbaa !2, !alias.scope !33
  %index.next.7 = add nuw nsw i64 %index.7, 4
  %niter.nsub.7 = sub i64 %niter.7, 1
  %1474 = trunc i64 %index.next.7 to i32
  %1475 = add i32 %1474, %1444
  %1476 = add i32 %1475, 1
  %1477 = sext i32 %1476 to i64
  %1478 = getelementptr inbounds float, float* %data_real, i64 %1477
  %1479 = bitcast float* %1478 to <4 x float>*
  %wide.load.1.7 = load <4 x float>, <4 x float>* %1479, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1480 = fmul <4 x float> %broadcast.splat210.7, %wide.load.1.7
  %1481 = getelementptr inbounds float, float* %data_imag, i64 %1477
  %1482 = bitcast float* %1481 to <4 x float>*
  %wide.load211.1.7 = load <4 x float>, <4 x float>* %1482, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1483 = fmul <4 x float> %broadcast.splat213.7, %wide.load211.1.7
  %1484 = fsub <4 x float> %1480, %1483
  %1485 = fmul <4 x float> %broadcast.splat213.7, %wide.load.1.7
  %1486 = fmul <4 x float> %broadcast.splat210.7, %wide.load211.1.7
  %1487 = fadd <4 x float> %1485, %1486
  %1488 = add nuw nsw i64 %index.next.7, %1443
  %1489 = getelementptr inbounds float, float* %data_real, i64 %1488
  %1490 = bitcast float* %1489 to <4 x float>*
  %wide.load214.1.7 = load <4 x float>, <4 x float>* %1490, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1491 = fsub <4 x float> %wide.load214.1.7, %1484
  %1492 = bitcast float* %1478 to <4 x float>*
  store <4 x float> %1491, <4 x float>* %1492, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1493 = bitcast float* %1489 to <4 x float>*
  %wide.load215.1.7 = load <4 x float>, <4 x float>* %1493, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1494 = fadd <4 x float> %1484, %wide.load215.1.7
  %1495 = bitcast float* %1489 to <4 x float>*
  store <4 x float> %1494, <4 x float>* %1495, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1496 = getelementptr inbounds float, float* %data_imag, i64 %1488
  %1497 = bitcast float* %1496 to <4 x float>*
  %wide.load216.1.7 = load <4 x float>, <4 x float>* %1497, align 4, !tbaa !2, !alias.scope !33
  %1498 = fsub <4 x float> %wide.load216.1.7, %1487
  %1499 = bitcast float* %1481 to <4 x float>*
  store <4 x float> %1498, <4 x float>* %1499, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1500 = bitcast float* %1496 to <4 x float>*
  %wide.load217.1.7 = load <4 x float>, <4 x float>* %1500, align 4, !tbaa !2, !alias.scope !33
  %1501 = fadd <4 x float> %1487, %wide.load217.1.7
  %1502 = bitcast float* %1496 to <4 x float>*
  store <4 x float> %1501, <4 x float>* %1502, align 4, !tbaa !2, !alias.scope !33
  %index.next.1.7 = add nuw nsw i64 %index.next.7, 4
  %niter.nsub.1.7 = sub i64 %niter.nsub.7, 1
  %1503 = trunc i64 %index.next.1.7 to i32
  %1504 = add i32 %1503, %1444
  %1505 = add i32 %1504, 1
  %1506 = sext i32 %1505 to i64
  %1507 = getelementptr inbounds float, float* %data_real, i64 %1506
  %1508 = bitcast float* %1507 to <4 x float>*
  %wide.load.2.7 = load <4 x float>, <4 x float>* %1508, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1509 = fmul <4 x float> %broadcast.splat210.7, %wide.load.2.7
  %1510 = getelementptr inbounds float, float* %data_imag, i64 %1506
  %1511 = bitcast float* %1510 to <4 x float>*
  %wide.load211.2.7 = load <4 x float>, <4 x float>* %1511, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1512 = fmul <4 x float> %broadcast.splat213.7, %wide.load211.2.7
  %1513 = fsub <4 x float> %1509, %1512
  %1514 = fmul <4 x float> %broadcast.splat213.7, %wide.load.2.7
  %1515 = fmul <4 x float> %broadcast.splat210.7, %wide.load211.2.7
  %1516 = fadd <4 x float> %1514, %1515
  %1517 = add nuw nsw i64 %index.next.1.7, %1443
  %1518 = getelementptr inbounds float, float* %data_real, i64 %1517
  %1519 = bitcast float* %1518 to <4 x float>*
  %wide.load214.2.7 = load <4 x float>, <4 x float>* %1519, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1520 = fsub <4 x float> %wide.load214.2.7, %1513
  %1521 = bitcast float* %1507 to <4 x float>*
  store <4 x float> %1520, <4 x float>* %1521, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1522 = bitcast float* %1518 to <4 x float>*
  %wide.load215.2.7 = load <4 x float>, <4 x float>* %1522, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1523 = fadd <4 x float> %1513, %wide.load215.2.7
  %1524 = bitcast float* %1518 to <4 x float>*
  store <4 x float> %1523, <4 x float>* %1524, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1525 = getelementptr inbounds float, float* %data_imag, i64 %1517
  %1526 = bitcast float* %1525 to <4 x float>*
  %wide.load216.2.7 = load <4 x float>, <4 x float>* %1526, align 4, !tbaa !2, !alias.scope !33
  %1527 = fsub <4 x float> %wide.load216.2.7, %1516
  %1528 = bitcast float* %1510 to <4 x float>*
  store <4 x float> %1527, <4 x float>* %1528, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1529 = bitcast float* %1525 to <4 x float>*
  %wide.load217.2.7 = load <4 x float>, <4 x float>* %1529, align 4, !tbaa !2, !alias.scope !33
  %1530 = fadd <4 x float> %1516, %wide.load217.2.7
  %1531 = bitcast float* %1525 to <4 x float>*
  store <4 x float> %1530, <4 x float>* %1531, align 4, !tbaa !2, !alias.scope !33
  %index.next.2.7 = add nuw nsw i64 %index.next.1.7, 4
  %niter.nsub.2.7 = sub i64 %niter.nsub.1.7, 1
  %1532 = trunc i64 %index.next.2.7 to i32
  %1533 = add i32 %1532, %1444
  %1534 = add i32 %1533, 1
  %1535 = sext i32 %1534 to i64
  %1536 = getelementptr inbounds float, float* %data_real, i64 %1535
  %1537 = bitcast float* %1536 to <4 x float>*
  %wide.load.3.7 = load <4 x float>, <4 x float>* %1537, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1538 = fmul <4 x float> %broadcast.splat210.7, %wide.load.3.7
  %1539 = getelementptr inbounds float, float* %data_imag, i64 %1535
  %1540 = bitcast float* %1539 to <4 x float>*
  %wide.load211.3.7 = load <4 x float>, <4 x float>* %1540, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1541 = fmul <4 x float> %broadcast.splat213.7, %wide.load211.3.7
  %1542 = fsub <4 x float> %1538, %1541
  %1543 = fmul <4 x float> %broadcast.splat213.7, %wide.load.3.7
  %1544 = fmul <4 x float> %broadcast.splat210.7, %wide.load211.3.7
  %1545 = fadd <4 x float> %1543, %1544
  %1546 = add nuw nsw i64 %index.next.2.7, %1443
  %1547 = getelementptr inbounds float, float* %data_real, i64 %1546
  %1548 = bitcast float* %1547 to <4 x float>*
  %wide.load214.3.7 = load <4 x float>, <4 x float>* %1548, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1549 = fsub <4 x float> %wide.load214.3.7, %1542
  %1550 = bitcast float* %1536 to <4 x float>*
  store <4 x float> %1549, <4 x float>* %1550, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1551 = bitcast float* %1547 to <4 x float>*
  %wide.load215.3.7 = load <4 x float>, <4 x float>* %1551, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1552 = fadd <4 x float> %1542, %wide.load215.3.7
  %1553 = bitcast float* %1547 to <4 x float>*
  store <4 x float> %1552, <4 x float>* %1553, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1554 = getelementptr inbounds float, float* %data_imag, i64 %1546
  %1555 = bitcast float* %1554 to <4 x float>*
  %wide.load216.3.7 = load <4 x float>, <4 x float>* %1555, align 4, !tbaa !2, !alias.scope !33
  %1556 = fsub <4 x float> %wide.load216.3.7, %1545
  %1557 = bitcast float* %1539 to <4 x float>*
  store <4 x float> %1556, <4 x float>* %1557, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1558 = bitcast float* %1554 to <4 x float>*
  %wide.load217.3.7 = load <4 x float>, <4 x float>* %1558, align 4, !tbaa !2, !alias.scope !33
  %1559 = fadd <4 x float> %1545, %wide.load217.3.7
  %1560 = bitcast float* %1554 to <4 x float>*
  store <4 x float> %1559, <4 x float>* %1560, align 4, !tbaa !2, !alias.scope !33
  %index.next.3.7 = add i64 %index.next.2.7, 4
  %niter.nsub.3.7 = sub i64 %niter.nsub.2.7, 1
  %niter.ncmp.3.7 = icmp eq i64 %niter.nsub.3.7, 0
  br i1 %niter.ncmp.3.7, label %middle.block.unr-lcssa.loopexit.7, label %vector.body.7, !llvm.loop !36

middle.block.unr-lcssa.loopexit.7:                ; preds = %vector.body.7
  %index.unr.ph.7 = phi i64 [ %index.next.3.7, %vector.body.7 ]
  br label %middle.block.unr-lcssa.7

middle.block.unr-lcssa.7:                         ; preds = %middle.block.unr-lcssa.loopexit.7, %vector.ph.7
  %index.unr.7 = phi i64 [ 0, %vector.ph.7 ], [ %index.unr.ph.7, %middle.block.unr-lcssa.loopexit.7 ]
  br i1 false, label %vector.body.epil.preheader.7, label %middle.block.7

vector.body.epil.preheader.7:                     ; preds = %middle.block.unr-lcssa.7
  br label %vector.body.epil.7

vector.body.epil.7:                               ; preds = %vector.body.epil.7, %vector.body.epil.preheader.7
  %index.epil.7 = phi i64 [ %index.unr.7, %vector.body.epil.preheader.7 ], [ %index.next.epil.7, %vector.body.epil.7 ]
  %epil.iter.7 = phi i64 [ 0, %vector.body.epil.preheader.7 ], [ %epil.iter.sub.7, %vector.body.epil.7 ]
  %1561 = trunc i64 %index.epil.7 to i32
  %1562 = add i32 %1561, %1444
  %1563 = add i32 %1562, 1
  %1564 = sext i32 %1563 to i64
  %1565 = getelementptr inbounds float, float* %data_real, i64 %1564
  %1566 = bitcast float* %1565 to <4 x float>*
  %wide.load.epil.7 = load <4 x float>, <4 x float>* %1566, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1567 = fmul <4 x float> %broadcast.splat210.7, %wide.load.epil.7
  %1568 = getelementptr inbounds float, float* %data_imag, i64 %1564
  %1569 = bitcast float* %1568 to <4 x float>*
  %wide.load211.epil.7 = load <4 x float>, <4 x float>* %1569, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1570 = fmul <4 x float> %broadcast.splat213.7, %wide.load211.epil.7
  %1571 = fsub <4 x float> %1567, %1570
  %1572 = fmul <4 x float> %broadcast.splat213.7, %wide.load.epil.7
  %1573 = fmul <4 x float> %broadcast.splat210.7, %wide.load211.epil.7
  %1574 = fadd <4 x float> %1572, %1573
  %1575 = add nuw nsw i64 %index.epil.7, %1443
  %1576 = getelementptr inbounds float, float* %data_real, i64 %1575
  %1577 = bitcast float* %1576 to <4 x float>*
  %wide.load214.epil.7 = load <4 x float>, <4 x float>* %1577, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1578 = fsub <4 x float> %wide.load214.epil.7, %1571
  %1579 = bitcast float* %1565 to <4 x float>*
  store <4 x float> %1578, <4 x float>* %1579, align 4, !tbaa !2, !alias.scope !25, !noalias !28
  %1580 = bitcast float* %1576 to <4 x float>*
  %wide.load215.epil.7 = load <4 x float>, <4 x float>* %1580, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1581 = fadd <4 x float> %1571, %wide.load215.epil.7
  %1582 = bitcast float* %1576 to <4 x float>*
  store <4 x float> %1581, <4 x float>* %1582, align 4, !tbaa !2, !alias.scope !34, !noalias !35
  %1583 = getelementptr inbounds float, float* %data_imag, i64 %1575
  %1584 = bitcast float* %1583 to <4 x float>*
  %wide.load216.epil.7 = load <4 x float>, <4 x float>* %1584, align 4, !tbaa !2, !alias.scope !33
  %1585 = fsub <4 x float> %wide.load216.epil.7, %1574
  %1586 = bitcast float* %1568 to <4 x float>*
  store <4 x float> %1585, <4 x float>* %1586, align 4, !tbaa !2, !alias.scope !32, !noalias !33
  %1587 = bitcast float* %1583 to <4 x float>*
  %wide.load217.epil.7 = load <4 x float>, <4 x float>* %1587, align 4, !tbaa !2, !alias.scope !33
  %1588 = fadd <4 x float> %1574, %wide.load217.epil.7
  %1589 = bitcast float* %1583 to <4 x float>*
  store <4 x float> %1588, <4 x float>* %1589, align 4, !tbaa !2, !alias.scope !33
  %index.next.epil.7 = add i64 %index.epil.7, 4
  %epil.iter.sub.7 = sub i64 %epil.iter.7, 1
  %epil.iter.cmp.7 = icmp ne i64 %epil.iter.sub.7, 0
  br i1 %epil.iter.cmp.7, label %vector.body.epil.7, label %middle.block.epilog-lcssa.7, !llvm.loop !37

middle.block.epilog-lcssa.7:                      ; preds = %vector.body.epil.7
  br label %middle.block.7

middle.block.7:                                   ; preds = %middle.block.epilog-lcssa.7, %middle.block.unr-lcssa.7
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.7, label %for.body11.us.preheader.7

for.body11.us.preheader.7:                        ; preds = %middle.block.7, %vector.memcheck.7, %vector.scevcheck.7, %for.body3.us.7
  br i1 true, label %for.body11.us.prol.preheader.7, label %for.body11.us.prol.loopexit.7

for.body11.us.prol.preheader.7:                   ; preds = %for.body11.us.preheader.7
  br label %for.body11.us.prol.7

for.body11.us.prol.7:                             ; preds = %for.body11.us.prol.7, %for.body11.us.prol.preheader.7
  %indvars.iv.prol.7 = phi i64 [ %indvars.iv.next.prol.7, %for.body11.us.prol.7 ], [ 0, %for.body11.us.prol.preheader.7 ]
  %prol.iter.7 = phi i64 [ 1, %for.body11.us.prol.preheader.7 ], [ %prol.iter.sub.7, %for.body11.us.prol.7 ]
  %1590 = trunc i64 %indvars.iv.prol.7 to i32
  %add13.us.prol.7 = add i32 %1590, %1444
  %add14.us.prol.7 = add i32 %add13.us.prol.7, 1
  %idxprom15.us.prol.7 = sext i32 %add14.us.prol.7 to i64
  %arrayidx16.us.prol.7 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.prol.7
  %1591 = load float, float* %arrayidx16.us.prol.7, align 4, !tbaa !2
  %mul17.us.prol.7 = fmul float %1441, %1591
  %arrayidx23.us.prol.7 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.prol.7
  %1592 = load float, float* %arrayidx23.us.prol.7, align 4, !tbaa !2
  %mul24.us.prol.7 = fmul float %1442, %1592
  %sub25.us.prol.7 = fsub float %mul17.us.prol.7, %mul24.us.prol.7
  %mul32.us.prol.7 = fmul float %1442, %1591
  %mul39.us.prol.7 = fmul float %1441, %1592
  %add40.us.prol.7 = fadd float %mul32.us.prol.7, %mul39.us.prol.7
  %1593 = add nuw nsw i64 %indvars.iv.prol.7, %1443
  %arrayidx45.us.prol.7 = getelementptr inbounds float, float* %data_real, i64 %1593
  %1594 = load float, float* %arrayidx45.us.prol.7, align 4, !tbaa !2
  %sub46.us.prol.7 = fsub float %1594, %sub25.us.prol.7
  store float %sub46.us.prol.7, float* %arrayidx16.us.prol.7, align 4, !tbaa !2
  %1595 = load float, float* %arrayidx45.us.prol.7, align 4, !tbaa !2
  %add58.us.prol.7 = fadd float %sub25.us.prol.7, %1595
  store float %add58.us.prol.7, float* %arrayidx45.us.prol.7, align 4, !tbaa !2
  %arrayidx63.us.prol.7 = getelementptr inbounds float, float* %data_imag, i64 %1593
  %1596 = load float, float* %arrayidx63.us.prol.7, align 4, !tbaa !2
  %sub64.us.prol.7 = fsub float %1596, %add40.us.prol.7
  store float %sub64.us.prol.7, float* %arrayidx23.us.prol.7, align 4, !tbaa !2
  %1597 = load float, float* %arrayidx63.us.prol.7, align 4, !tbaa !2
  %add76.us.prol.7 = fadd float %add40.us.prol.7, %1597
  store float %add76.us.prol.7, float* %arrayidx63.us.prol.7, align 4, !tbaa !2
  %indvars.iv.next.prol.7 = add nuw nsw i64 %indvars.iv.prol.7, 1
  %prol.iter.sub.7 = sub i64 %prol.iter.7, 1
  %prol.iter.cmp.7 = icmp ne i64 %prol.iter.sub.7, 0
  br i1 %prol.iter.cmp.7, label %for.body11.us.prol.7, label %for.body11.us.prol.loopexit.unr-lcssa.7, !llvm.loop !38

for.body11.us.prol.loopexit.unr-lcssa.7:          ; preds = %for.body11.us.prol.7
  %indvars.iv.unr.ph.7 = phi i64 [ %indvars.iv.next.prol.7, %for.body11.us.prol.7 ]
  br label %for.body11.us.prol.loopexit.7

for.body11.us.prol.loopexit.7:                    ; preds = %for.body11.us.prol.loopexit.unr-lcssa.7, %for.body11.us.preheader.7
  %indvars.iv.unr.7 = phi i64 [ 0, %for.body11.us.preheader.7 ], [ %indvars.iv.unr.ph.7, %for.body11.us.prol.loopexit.unr-lcssa.7 ]
  br i1 true, label %for.cond9.for.inc77_crit_edge.us.loopexit.7, label %for.body11.us.preheader.new.7

for.body11.us.preheader.new.7:                    ; preds = %for.body11.us.prol.loopexit.7
  br label %for.body11.us.7

for.body11.us.7:                                  ; preds = %for.body11.us.7, %for.body11.us.preheader.new.7
  %indvars.iv.7 = phi i64 [ %indvars.iv.unr.7, %for.body11.us.preheader.new.7 ], [ %indvars.iv.next.3.7, %for.body11.us.7 ]
  %1598 = trunc i64 %indvars.iv.7 to i32
  %add13.us.7 = add i32 %1598, %1444
  %add14.us.7 = add i32 %add13.us.7, 1
  %idxprom15.us.7 = sext i32 %add14.us.7 to i64
  %arrayidx16.us.7 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.7
  %1599 = load float, float* %arrayidx16.us.7, align 4, !tbaa !2
  %mul17.us.7 = fmul float %1441, %1599
  %arrayidx23.us.7 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.7
  %1600 = load float, float* %arrayidx23.us.7, align 4, !tbaa !2
  %mul24.us.7 = fmul float %1442, %1600
  %sub25.us.7 = fsub float %mul17.us.7, %mul24.us.7
  %mul32.us.7 = fmul float %1442, %1599
  %mul39.us.7 = fmul float %1441, %1600
  %add40.us.7 = fadd float %mul32.us.7, %mul39.us.7
  %1601 = add nuw nsw i64 %indvars.iv.7, %1443
  %arrayidx45.us.7 = getelementptr inbounds float, float* %data_real, i64 %1601
  %1602 = load float, float* %arrayidx45.us.7, align 4, !tbaa !2
  %sub46.us.7 = fsub float %1602, %sub25.us.7
  store float %sub46.us.7, float* %arrayidx16.us.7, align 4, !tbaa !2
  %1603 = load float, float* %arrayidx45.us.7, align 4, !tbaa !2
  %add58.us.7 = fadd float %sub25.us.7, %1603
  store float %add58.us.7, float* %arrayidx45.us.7, align 4, !tbaa !2
  %arrayidx63.us.7 = getelementptr inbounds float, float* %data_imag, i64 %1601
  %1604 = load float, float* %arrayidx63.us.7, align 4, !tbaa !2
  %sub64.us.7 = fsub float %1604, %add40.us.7
  store float %sub64.us.7, float* %arrayidx23.us.7, align 4, !tbaa !2
  %1605 = load float, float* %arrayidx63.us.7, align 4, !tbaa !2
  %add76.us.7 = fadd float %add40.us.7, %1605
  store float %add76.us.7, float* %arrayidx63.us.7, align 4, !tbaa !2
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv.7, 1
  %1606 = trunc i64 %indvars.iv.next.7 to i32
  %add13.us.1.7 = add i32 %1606, %1444
  %add14.us.1.7 = add i32 %add13.us.1.7, 1
  %idxprom15.us.1.7 = sext i32 %add14.us.1.7 to i64
  %arrayidx16.us.1.7 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.1.7
  %1607 = load float, float* %arrayidx16.us.1.7, align 4, !tbaa !2
  %mul17.us.1.7 = fmul float %1441, %1607
  %arrayidx23.us.1.7 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.1.7
  %1608 = load float, float* %arrayidx23.us.1.7, align 4, !tbaa !2
  %mul24.us.1.7 = fmul float %1442, %1608
  %sub25.us.1.7 = fsub float %mul17.us.1.7, %mul24.us.1.7
  %mul32.us.1.7 = fmul float %1442, %1607
  %mul39.us.1.7 = fmul float %1441, %1608
  %add40.us.1.7 = fadd float %mul32.us.1.7, %mul39.us.1.7
  %1609 = add nuw nsw i64 %indvars.iv.next.7, %1443
  %arrayidx45.us.1.7 = getelementptr inbounds float, float* %data_real, i64 %1609
  %1610 = load float, float* %arrayidx45.us.1.7, align 4, !tbaa !2
  %sub46.us.1.7 = fsub float %1610, %sub25.us.1.7
  store float %sub46.us.1.7, float* %arrayidx16.us.1.7, align 4, !tbaa !2
  %1611 = load float, float* %arrayidx45.us.1.7, align 4, !tbaa !2
  %add58.us.1.7 = fadd float %sub25.us.1.7, %1611
  store float %add58.us.1.7, float* %arrayidx45.us.1.7, align 4, !tbaa !2
  %arrayidx63.us.1.7 = getelementptr inbounds float, float* %data_imag, i64 %1609
  %1612 = load float, float* %arrayidx63.us.1.7, align 4, !tbaa !2
  %sub64.us.1.7 = fsub float %1612, %add40.us.1.7
  store float %sub64.us.1.7, float* %arrayidx23.us.1.7, align 4, !tbaa !2
  %1613 = load float, float* %arrayidx63.us.1.7, align 4, !tbaa !2
  %add76.us.1.7 = fadd float %add40.us.1.7, %1613
  store float %add76.us.1.7, float* %arrayidx63.us.1.7, align 4, !tbaa !2
  %indvars.iv.next.1.7 = add nuw nsw i64 %indvars.iv.next.7, 1
  %1614 = trunc i64 %indvars.iv.next.1.7 to i32
  %add13.us.2.7 = add i32 %1614, %1444
  %add14.us.2.7 = add i32 %add13.us.2.7, 1
  %idxprom15.us.2.7 = sext i32 %add14.us.2.7 to i64
  %arrayidx16.us.2.7 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.2.7
  %1615 = load float, float* %arrayidx16.us.2.7, align 4, !tbaa !2
  %mul17.us.2.7 = fmul float %1441, %1615
  %arrayidx23.us.2.7 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.2.7
  %1616 = load float, float* %arrayidx23.us.2.7, align 4, !tbaa !2
  %mul24.us.2.7 = fmul float %1442, %1616
  %sub25.us.2.7 = fsub float %mul17.us.2.7, %mul24.us.2.7
  %mul32.us.2.7 = fmul float %1442, %1615
  %mul39.us.2.7 = fmul float %1441, %1616
  %add40.us.2.7 = fadd float %mul32.us.2.7, %mul39.us.2.7
  %1617 = add nuw nsw i64 %indvars.iv.next.1.7, %1443
  %arrayidx45.us.2.7 = getelementptr inbounds float, float* %data_real, i64 %1617
  %1618 = load float, float* %arrayidx45.us.2.7, align 4, !tbaa !2
  %sub46.us.2.7 = fsub float %1618, %sub25.us.2.7
  store float %sub46.us.2.7, float* %arrayidx16.us.2.7, align 4, !tbaa !2
  %1619 = load float, float* %arrayidx45.us.2.7, align 4, !tbaa !2
  %add58.us.2.7 = fadd float %sub25.us.2.7, %1619
  store float %add58.us.2.7, float* %arrayidx45.us.2.7, align 4, !tbaa !2
  %arrayidx63.us.2.7 = getelementptr inbounds float, float* %data_imag, i64 %1617
  %1620 = load float, float* %arrayidx63.us.2.7, align 4, !tbaa !2
  %sub64.us.2.7 = fsub float %1620, %add40.us.2.7
  store float %sub64.us.2.7, float* %arrayidx23.us.2.7, align 4, !tbaa !2
  %1621 = load float, float* %arrayidx63.us.2.7, align 4, !tbaa !2
  %add76.us.2.7 = fadd float %add40.us.2.7, %1621
  store float %add76.us.2.7, float* %arrayidx63.us.2.7, align 4, !tbaa !2
  %indvars.iv.next.2.7 = add nuw nsw i64 %indvars.iv.next.1.7, 1
  %1622 = trunc i64 %indvars.iv.next.2.7 to i32
  %add13.us.3.7 = add i32 %1622, %1444
  %add14.us.3.7 = add i32 %add13.us.3.7, 1
  %idxprom15.us.3.7 = sext i32 %add14.us.3.7 to i64
  %arrayidx16.us.3.7 = getelementptr inbounds float, float* %data_real, i64 %idxprom15.us.3.7
  %1623 = load float, float* %arrayidx16.us.3.7, align 4, !tbaa !2
  %mul17.us.3.7 = fmul float %1441, %1623
  %arrayidx23.us.3.7 = getelementptr inbounds float, float* %data_imag, i64 %idxprom15.us.3.7
  %1624 = load float, float* %arrayidx23.us.3.7, align 4, !tbaa !2
  %mul24.us.3.7 = fmul float %1442, %1624
  %sub25.us.3.7 = fsub float %mul17.us.3.7, %mul24.us.3.7
  %mul32.us.3.7 = fmul float %1442, %1623
  %mul39.us.3.7 = fmul float %1441, %1624
  %add40.us.3.7 = fadd float %mul32.us.3.7, %mul39.us.3.7
  %1625 = add nuw nsw i64 %indvars.iv.next.2.7, %1443
  %arrayidx45.us.3.7 = getelementptr inbounds float, float* %data_real, i64 %1625
  %1626 = load float, float* %arrayidx45.us.3.7, align 4, !tbaa !2
  %sub46.us.3.7 = fsub float %1626, %sub25.us.3.7
  store float %sub46.us.3.7, float* %arrayidx16.us.3.7, align 4, !tbaa !2
  %1627 = load float, float* %arrayidx45.us.3.7, align 4, !tbaa !2
  %add58.us.3.7 = fadd float %sub25.us.3.7, %1627
  store float %add58.us.3.7, float* %arrayidx45.us.3.7, align 4, !tbaa !2
  %arrayidx63.us.3.7 = getelementptr inbounds float, float* %data_imag, i64 %1625
  %1628 = load float, float* %arrayidx63.us.3.7, align 4, !tbaa !2
  %sub64.us.3.7 = fsub float %1628, %add40.us.3.7
  store float %sub64.us.3.7, float* %arrayidx23.us.3.7, align 4, !tbaa !2
  %1629 = load float, float* %arrayidx63.us.3.7, align 4, !tbaa !2
  %add76.us.3.7 = fadd float %add40.us.3.7, %1629
  store float %add76.us.3.7, float* %arrayidx63.us.3.7, align 4, !tbaa !2
  %indvars.iv.next.3.7 = add nuw nsw i64 %indvars.iv.next.2.7, 1
  br i1 false, label %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.7, label %for.body11.us.7, !llvm.loop !39

for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.7: ; preds = %for.body11.us.7
  br label %for.cond9.for.inc77_crit_edge.us.loopexit.7

for.cond9.for.inc77_crit_edge.us.loopexit.7:      ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.unr-lcssa.7, %for.body11.us.prol.loopexit.7
  br label %for.cond9.for.inc77_crit_edge.us.7

for.cond9.for.inc77_crit_edge.us.7:               ; preds = %for.cond9.for.inc77_crit_edge.us.loopexit.7, %middle.block.7
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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.isvectorized", i32 1}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!17}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !19, !8}
!19 = distinct !{!19, !20, !21}
!20 = !{!"llvm.loop.isvectorized"}
!21 = !{!"llvm.loop.unroll.count", i32 4}
!22 = distinct !{!22, !8}
!23 = distinct !{!23, !8}
!24 = distinct !{!24, !19, !8}
!25 = !{!26}
!26 = distinct !{!26, !27}
!27 = distinct !{!27, !"LVerDomain"}
!28 = !{!29, !30, !31}
!29 = distinct !{!29, !27}
!30 = distinct !{!30, !27}
!31 = distinct !{!31, !27}
!32 = !{!30}
!33 = !{!31}
!34 = !{!29}
!35 = !{!30, !31}
!36 = distinct !{!36, !19, !8}
!37 = distinct !{!37, !8}
!38 = distinct !{!38, !8}
!39 = distinct !{!39, !19, !8}
