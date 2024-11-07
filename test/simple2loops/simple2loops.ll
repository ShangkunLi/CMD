; ModuleID = 'simple2loops.bc'
source_filename = "simple2loops.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.kernel.a = private unnamed_addr constant [4 x i32] [i32 1, i32 2, i32 3, i32 4], align 16
@__const.kernel.b = private unnamed_addr constant [4 x i32] [i32 5, i32 6, i32 7, i32 8], align 16

; Function Attrs: nounwind uwtable
define dso_local i32 @kernel() local_unnamed_addr #0 {
entry:
  %a = alloca [4 x i32], align 16
  %b = alloca [4 x i32], align 16
  %c = alloca [4 x i32], align 16
  %0 = bitcast [4 x i32]* %a to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %0, i8* align 16 bitcast ([4 x i32]* @__const.kernel.a to i8*), i64 16, i1 true)
  %1 = bitcast [4 x i32]* %b to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %1) #2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %1, i8* align 16 bitcast ([4 x i32]* @__const.kernel.b to i8*), i64 16, i1 true)
  %2 = bitcast [4 x i32]* %c to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %2) #2
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 %2, i8 0, i64 16, i1 true)
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next28, %for.body ]
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %a, i64 0, i64 %indvars.iv27
  %3 = load volatile i32, i32* %arrayidx, align 4, !tbaa !2
  %arrayidx2 = getelementptr inbounds [4 x i32], [4 x i32]* %b, i64 0, i64 %indvars.iv27
  %4 = load volatile i32, i32* %arrayidx2, align 4, !tbaa !2
  %add = add nsw i32 %4, %3
  %arrayidx4 = getelementptr inbounds [4 x i32], [4 x i32]* %c, i64 0, i64 %indvars.iv27
  store volatile i32 %add, i32* %arrayidx4, align 4, !tbaa !2
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 4
  br i1 %exitcond29, label %for.body7, label %for.body

for.body7:                                        ; preds = %for.body, %for.body7
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7 ], [ 0, %for.body ]
  %sum.025 = phi i32 [ %add10, %for.body7 ], [ 0, %for.body ]
  %arrayidx9 = getelementptr inbounds [4 x i32], [4 x i32]* %c, i64 0, i64 %indvars.iv
  %5 = load volatile i32, i32* %arrayidx9, align 4, !tbaa !2
  %add10 = add nsw i32 %5, %sum.025
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4
  br i1 %exitcond, label %for.end13, label %for.body7

for.end13:                                        ; preds = %for.body7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %2) #2
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1) #2
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #2
  ret i32 %add10
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
