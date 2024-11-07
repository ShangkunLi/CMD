; ModuleID = 'array_add.bc'
source_filename = "array_add.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = dso_local local_unnamed_addr global [20 x i32] zeroinitializer, align 16
@B = dso_local local_unnamed_addr global [20 x i32] zeroinitializer, align 16
@C = dso_local local_unnamed_addr global [20 x i32] zeroinitializer, align 16
@D = dso_local local_unnamed_addr global [20 x i32] zeroinitializer, align 16
@E = dso_local local_unnamed_addr global [20 x [20 x i32]] zeroinitializer, align 16
@F = dso_local local_unnamed_addr global [20 x [20 x i32]] zeroinitializer, align 16
@G = dso_local local_unnamed_addr global [20 x [20 x i32]] zeroinitializer, align 16
@H = dso_local local_unnamed_addr global [20 x [20 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @_Z6kernelv() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %entry
  %indvars.iv176 = phi i64 [ 0, %entry ], [ %indvars.iv.next177, %for.cond.cleanup3 ]
  %cmp19 = icmp eq i64 %indvars.iv176, 0
  br i1 %cmp19, label %for.cond5.preheader.us, label %for.cond5.preheader

for.cond5.preheader.us:                           ; preds = %for.cond1.preheader, %for.cond.cleanup7.us-lcssa.us.us
  %indvars.iv173 = phi i64 [ %indvars.iv.next174, %for.cond.cleanup7.us-lcssa.us.us ], [ 0, %for.cond1.preheader ]
  %cmp41.us = icmp eq i64 %indvars.iv173, 0
  %arrayidx76.us = getelementptr inbounds [20 x i32], [20 x i32]* @B, i64 0, i64 %indvars.iv173
  %.pre179 = load i32, i32* %arrayidx76.us, align 4, !tbaa !2
  %broadcast.splatinsert185 = insertelement <4 x i32> undef, i32 %.pre179, i32 0
  %broadcast.splat186 = shufflevector <4 x i32> %broadcast.splatinsert185, <4 x i32> undef, <4 x i32> zeroinitializer
  br i1 %cmp41.us, label %vector.body, label %vector.body189

vector.body189:                                   ; preds = %for.cond5.preheader.us, %vector.body189
  %index191 = phi i64 [ %index.next192, %vector.body189 ], [ 0, %for.cond5.preheader.us ]
  %0 = or i64 %index191, 1
  %1 = or i64 %index191, 2
  %2 = or i64 %index191, 3
  %3 = getelementptr inbounds [20 x i32], [20 x i32]* @A, i64 0, i64 %index191
  %4 = bitcast i32* %3 to <4 x i32>*
  %wide.load198 = load <4 x i32>, <4 x i32>* %4, align 16, !tbaa !2
  %5 = getelementptr inbounds [20 x i32], [20 x i32]* @B, i64 0, i64 %index191
  %6 = bitcast i32* %5 to <4 x i32>*
  %wide.load199 = load <4 x i32>, <4 x i32>* %6, align 16, !tbaa !2
  %7 = add nsw <4 x i32> %wide.load199, %wide.load198
  %8 = getelementptr inbounds [20 x i32], [20 x i32]* @C, i64 0, i64 %index191
  %9 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> %7, <4 x i32>* %9, align 16, !tbaa !2
  %10 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @E, i64 0, i64 %index191, i64 %indvars.iv173
  %11 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @E, i64 0, i64 %0, i64 %indvars.iv173
  %12 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @E, i64 0, i64 %1, i64 %indvars.iv173
  %13 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @E, i64 0, i64 %2, i64 %indvars.iv173
  %14 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @F, i64 0, i64 %indvars.iv173, i64 %index191
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> %7, <4 x i32>* %15, align 16, !tbaa !2
  %16 = getelementptr inbounds [20 x i32], [20 x i32]* @D, i64 0, i64 %index191
  %17 = bitcast i32* %16 to <4 x i32>*
  %wide.load200 = load <4 x i32>, <4 x i32>* %17, align 16, !tbaa !2
  %18 = add nsw <4 x i32> %7, %wide.load200
  %19 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> %18, <4 x i32>* %19, align 16, !tbaa !2
  %20 = add nsw <4 x i32> %7, %wide.load198
  %21 = add nsw <4 x i32> %20, %broadcast.splat186
  %22 = extractelement <4 x i32> %21, i32 0
  store i32 %22, i32* %10, align 4, !tbaa !2
  %23 = extractelement <4 x i32> %21, i32 1
  store i32 %23, i32* %11, align 4, !tbaa !2
  %24 = extractelement <4 x i32> %21, i32 2
  store i32 %24, i32* %12, align 4, !tbaa !2
  %25 = extractelement <4 x i32> %21, i32 3
  store i32 %25, i32* %13, align 4, !tbaa !2
  %index.next192 = add i64 %index191, 4
  %26 = icmp eq i64 %index.next192, 20
  br i1 %26, label %for.cond.cleanup7.us-lcssa.us.us, label %vector.body189, !llvm.loop !6

vector.body:                                      ; preds = %for.cond5.preheader.us, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond5.preheader.us ]
  %27 = or i64 %index, 1
  %28 = or i64 %index, 2
  %29 = or i64 %index, 3
  %30 = getelementptr inbounds [20 x i32], [20 x i32]* @A, i64 0, i64 %index
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %31, align 16, !tbaa !2
  %32 = getelementptr inbounds [20 x i32], [20 x i32]* @B, i64 0, i64 %index
  %33 = bitcast i32* %32 to <4 x i32>*
  %wide.load184 = load <4 x i32>, <4 x i32>* %33, align 16, !tbaa !2
  %34 = add nsw <4 x i32> %wide.load184, %wide.load
  %35 = getelementptr inbounds [20 x i32], [20 x i32]* @C, i64 0, i64 %index
  %36 = bitcast i32* %35 to <4 x i32>*
  store <4 x i32> %34, <4 x i32>* %36, align 16, !tbaa !2
  %37 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @E, i64 0, i64 %index, i64 0
  %38 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @E, i64 0, i64 %27, i64 0
  %39 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @E, i64 0, i64 %28, i64 0
  %40 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @E, i64 0, i64 %29, i64 0
  %41 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @F, i64 0, i64 0, i64 %index
  %42 = bitcast i32* %41 to <4 x i32>*
  store <4 x i32> %34, <4 x i32>* %42, align 16, !tbaa !2
  %43 = getelementptr inbounds [20 x i32], [20 x i32]* @D, i64 0, i64 %index
  %44 = bitcast i32* %43 to <4 x i32>*
  store <4 x i32> %34, <4 x i32>* %44, align 16, !tbaa !2
  %45 = add nsw <4 x i32> %broadcast.splat186, %wide.load
  %46 = extractelement <4 x i32> %45, i32 0
  store i32 %46, i32* %37, align 16, !tbaa !2
  %47 = extractelement <4 x i32> %45, i32 1
  store i32 %47, i32* %38, align 16, !tbaa !2
  %48 = extractelement <4 x i32> %45, i32 2
  store i32 %48, i32* %39, align 16, !tbaa !2
  %49 = extractelement <4 x i32> %45, i32 3
  store i32 %49, i32* %40, align 16, !tbaa !2
  %index.next = add i64 %index, 4
  %50 = icmp eq i64 %index.next, 20
  br i1 %50, label %for.cond.cleanup7.us-lcssa.us.us, label %vector.body, !llvm.loop !8

for.cond.cleanup7.us-lcssa.us.us:                 ; preds = %vector.body189, %vector.body
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1
  %exitcond175 = icmp eq i64 %indvars.iv.next174, 20
  br i1 %exitcond175, label %for.cond.cleanup3, label %for.cond5.preheader.us

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  ret void

for.cond5.preheader:                              ; preds = %for.cond1.preheader, %for.cond.cleanup7
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %for.cond.cleanup7 ], [ 0, %for.cond1.preheader ]
  %cmp41 = icmp eq i64 %indvars.iv164, %indvars.iv176
  %arrayidx76 = getelementptr inbounds [20 x i32], [20 x i32]* @B, i64 0, i64 %indvars.iv164
  br label %for.body8

for.cond.cleanup3:                                ; preds = %for.cond.cleanup7, %for.cond.cleanup7.us-lcssa.us.us
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %exitcond178 = icmp eq i64 %indvars.iv.next177, 20
  br i1 %exitcond178, label %for.cond.cleanup, label %for.cond1.preheader

for.cond.cleanup7:                                ; preds = %for.inc
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next165, 20
  br i1 %exitcond166, label %for.cond.cleanup3, label %for.cond5.preheader

for.body8:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds [20 x i32], [20 x i32]* @A, i64 0, i64 %indvars.iv
  %51 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %arrayidx10 = getelementptr inbounds [20 x i32], [20 x i32]* @B, i64 0, i64 %indvars.iv
  %52 = load i32, i32* %arrayidx10, align 4, !tbaa !2
  %add = add nsw i32 %52, %51
  %arrayidx12 = getelementptr inbounds [20 x i32], [20 x i32]* @C, i64 0, i64 %indvars.iv
  store i32 %add, i32* %arrayidx12, align 4, !tbaa !2
  %arrayidx18 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @E, i64 0, i64 %indvars.iv, i64 %indvars.iv164
  store i32 %add, i32* %arrayidx18, align 4, !tbaa !2
  %arrayidx27 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @F, i64 0, i64 %indvars.iv164, i64 %indvars.iv
  %53 = load i32, i32* %arrayidx27, align 4, !tbaa !2
  %add36 = add nsw i32 %53, %add
  store i32 %add36, i32* %arrayidx27, align 4, !tbaa !2
  %arrayidx48 = getelementptr inbounds [20 x i32], [20 x i32]* @D, i64 0, i64 %indvars.iv
  br i1 %cmp41, label %if.then42, label %if.else58

if.then42:                                        ; preds = %for.body8
  store i32 %add36, i32* %arrayidx48, align 4, !tbaa !2
  %54 = load i32, i32* %arrayidx76, align 4, !tbaa !2
  br label %for.inc

if.else58:                                        ; preds = %for.body8
  %55 = load i32, i32* %arrayidx48, align 4, !tbaa !2
  %add65 = add nsw i32 %add36, %55
  store i32 %add65, i32* %arrayidx48, align 4, !tbaa !2
  %add74 = add nsw i32 %add, %51
  %56 = load i32, i32* %arrayidx76, align 4, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %if.then42, %if.else58
  %.sink203 = phi i32 [ %51, %if.then42 ], [ %56, %if.else58 ]
  %.sink = phi i32 [ %54, %if.then42 ], [ %add74, %if.else58 ]
  %add53 = add nsw i32 %.sink, %.sink203
  store i32 %add53, i32* %arrayidx18, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 20
  br i1 %exitcond, label %for.cond.cleanup7, label %for.body8
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(80) bitcast ([20 x i32]* @C to i8*), i8 0, i64 80, i1 false)
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %vec.ind33 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %entry ], [ %vec.ind.next34, %vector.body ]
  %vec.ind35 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %entry ], [ %vec.ind.next36, %vector.body ]
  %0 = getelementptr inbounds [20 x i32], [20 x i32]* @A, i64 0, i64 %index
  %1 = shl <4 x i32> %vec.ind33, <i32 1, i32 1, i32 1, i32 1>
  %2 = add <4 x i32> %1, <i32 5, i32 5, i32 5, i32 5>
  %3 = bitcast i32* %0 to <4 x i32>*
  store <4 x i32> %2, <4 x i32>* %3, align 16, !tbaa !2
  %4 = getelementptr inbounds [20 x i32], [20 x i32]* @B, i64 0, i64 %index
  %5 = mul <4 x i32> %vec.ind35, <i32 3, i32 3, i32 3, i32 3>
  %6 = bitcast i32* %4 to <4 x i32>*
  store <4 x i32> %5, <4 x i32>* %6, align 16, !tbaa !2
  %index.next = add i64 %index, 4
  %vec.ind.next34 = add <4 x i32> %vec.ind33, <i32 4, i32 4, i32 4, i32 4>
  %vec.ind.next36 = add <4 x i32> %vec.ind35, <i32 4, i32 4, i32 4, i32 4>
  %7 = icmp eq i64 %index.next, 20
  br i1 %7, label %for.end, label %vector.body, !llvm.loop !9

for.end:                                          ; preds = %vector.body
  tail call void @_Z6kernelv()
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.end
  %indvars.iv = phi i64 [ 0, %for.end ], [ %indvars.iv.next, %for.body8 ]
  %arrayidx10 = getelementptr inbounds [20 x i32], [20 x i32]* @C, i64 0, i64 %indvars.iv
  %8 = load i32, i32* %arrayidx10, align 4, !tbaa !2
  %call = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %8)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 20
  br i1 %exitcond, label %for.end13, label %for.body8

for.end13:                                        ; preds = %for.body8
  ret i32 0
}

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.isvectorized", i32 1}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
