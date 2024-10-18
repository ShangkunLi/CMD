; ModuleID = 'spmv.bc'
source_filename = "spmv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@nnz = dso_local local_unnamed_addr global i32 100, align 4
@val = common dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@col = common dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@row = common dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@feature = common dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@output = common dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* @nnz, align 4, !tbaa !2
  %cmp15.i = icmp sgt i32 %0, 0
  br i1 %cmp15.i, label %for.body.preheader.i, label %kernel.exit

for.body.preheader.i:                             ; preds = %entry
  %1 = add nsw i32 %0, -1
  %xtraiter.i = and i32 %0, 3
  %2 = icmp ult i32 %1, 3
  br i1 %2, label %for.end.loopexit.unr-lcssa.i, label %for.body.preheader.new.i

for.body.preheader.new.i:                         ; preds = %for.body.preheader.i
  %unroll_iter.i = sub nuw nsw i32 %0, %xtraiter.i
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.body.preheader.new.i
  %indvars.iv.i = phi i64 [ 0, %for.body.preheader.new.i ], [ %indvars.iv.next.3.i, %for.body.i ]
  %niter.i = phi i32 [ %unroll_iter.i, %for.body.preheader.new.i ], [ %niter.nsub.3.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %indvars.iv.i
  %3 = load i32, i32* %arrayidx.i, align 16, !tbaa !2
  %arrayidx2.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %indvars.iv.i
  %4 = load i32, i32* %arrayidx2.i, align 16, !tbaa !2
  %idxprom3.i = sext i32 %4 to i64
  %arrayidx4.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %idxprom3.i
  %5 = load i32, i32* %arrayidx4.i, align 4, !tbaa !2
  %mul.i = mul nsw i32 %5, %3
  %arrayidx6.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %indvars.iv.i
  %6 = load i32, i32* %arrayidx6.i, align 16, !tbaa !2
  %idxprom7.i = sext i32 %6 to i64
  %arrayidx8.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %idxprom7.i
  %7 = load i32, i32* %arrayidx8.i, align 4, !tbaa !2
  %add.i = add nsw i32 %7, %mul.i
  store i32 %add.i, i32* %arrayidx8.i, align 4, !tbaa !2
  %indvars.iv.next.i = or i64 %indvars.iv.i, 1
  %arrayidx.1.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %indvars.iv.next.i
  %8 = load i32, i32* %arrayidx.1.i, align 4, !tbaa !2
  %arrayidx2.1.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %indvars.iv.next.i
  %9 = load i32, i32* %arrayidx2.1.i, align 4, !tbaa !2
  %idxprom3.1.i = sext i32 %9 to i64
  %arrayidx4.1.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %idxprom3.1.i
  %10 = load i32, i32* %arrayidx4.1.i, align 4, !tbaa !2
  %mul.1.i = mul nsw i32 %10, %8
  %arrayidx6.1.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %indvars.iv.next.i
  %11 = load i32, i32* %arrayidx6.1.i, align 4, !tbaa !2
  %idxprom7.1.i = sext i32 %11 to i64
  %arrayidx8.1.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %idxprom7.1.i
  %12 = load i32, i32* %arrayidx8.1.i, align 4, !tbaa !2
  %add.1.i = add nsw i32 %12, %mul.1.i
  store i32 %add.1.i, i32* %arrayidx8.1.i, align 4, !tbaa !2
  %indvars.iv.next.1.i = or i64 %indvars.iv.i, 2
  %arrayidx.2.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %indvars.iv.next.1.i
  %13 = load i32, i32* %arrayidx.2.i, align 8, !tbaa !2
  %arrayidx2.2.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %indvars.iv.next.1.i
  %14 = load i32, i32* %arrayidx2.2.i, align 8, !tbaa !2
  %idxprom3.2.i = sext i32 %14 to i64
  %arrayidx4.2.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %idxprom3.2.i
  %15 = load i32, i32* %arrayidx4.2.i, align 4, !tbaa !2
  %mul.2.i = mul nsw i32 %15, %13
  %arrayidx6.2.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %indvars.iv.next.1.i
  %16 = load i32, i32* %arrayidx6.2.i, align 8, !tbaa !2
  %idxprom7.2.i = sext i32 %16 to i64
  %arrayidx8.2.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %idxprom7.2.i
  %17 = load i32, i32* %arrayidx8.2.i, align 4, !tbaa !2
  %add.2.i = add nsw i32 %17, %mul.2.i
  store i32 %add.2.i, i32* %arrayidx8.2.i, align 4, !tbaa !2
  %indvars.iv.next.2.i = or i64 %indvars.iv.i, 3
  %arrayidx.3.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %indvars.iv.next.2.i
  %18 = load i32, i32* %arrayidx.3.i, align 4, !tbaa !2
  %arrayidx2.3.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %indvars.iv.next.2.i
  %19 = load i32, i32* %arrayidx2.3.i, align 4, !tbaa !2
  %idxprom3.3.i = sext i32 %19 to i64
  %arrayidx4.3.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %idxprom3.3.i
  %20 = load i32, i32* %arrayidx4.3.i, align 4, !tbaa !2
  %mul.3.i = mul nsw i32 %20, %18
  %arrayidx6.3.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %indvars.iv.next.2.i
  %21 = load i32, i32* %arrayidx6.3.i, align 4, !tbaa !2
  %idxprom7.3.i = sext i32 %21 to i64
  %arrayidx8.3.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %idxprom7.3.i
  %22 = load i32, i32* %arrayidx8.3.i, align 4, !tbaa !2
  %add.3.i = add nsw i32 %22, %mul.3.i
  store i32 %add.3.i, i32* %arrayidx8.3.i, align 4, !tbaa !2
  %indvars.iv.next.3.i = add nuw nsw i64 %indvars.iv.i, 4
  %niter.nsub.3.i = add i32 %niter.i, -4
  %niter.ncmp.3.i = icmp eq i32 %niter.nsub.3.i, 0
  br i1 %niter.ncmp.3.i, label %for.end.loopexit.unr-lcssa.i, label %for.body.i, !llvm.loop !6

for.end.loopexit.unr-lcssa.i:                     ; preds = %for.body.i, %for.body.preheader.i
  %indvars.iv.unr.i = phi i64 [ 0, %for.body.preheader.i ], [ %indvars.iv.next.3.i, %for.body.i ]
  %lcmp.mod.i = icmp eq i32 %xtraiter.i, 0
  br i1 %lcmp.mod.i, label %kernel.exit, label %for.body.epil.i

for.body.epil.i:                                  ; preds = %for.end.loopexit.unr-lcssa.i, %for.body.epil.i
  %indvars.iv.epil.i = phi i64 [ %indvars.iv.next.epil.i, %for.body.epil.i ], [ %indvars.iv.unr.i, %for.end.loopexit.unr-lcssa.i ]
  %epil.iter.i = phi i32 [ %epil.iter.sub.i, %for.body.epil.i ], [ %xtraiter.i, %for.end.loopexit.unr-lcssa.i ]
  %arrayidx.epil.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %indvars.iv.epil.i
  %23 = load i32, i32* %arrayidx.epil.i, align 4, !tbaa !2
  %arrayidx2.epil.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %indvars.iv.epil.i
  %24 = load i32, i32* %arrayidx2.epil.i, align 4, !tbaa !2
  %idxprom3.epil.i = sext i32 %24 to i64
  %arrayidx4.epil.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %idxprom3.epil.i
  %25 = load i32, i32* %arrayidx4.epil.i, align 4, !tbaa !2
  %mul.epil.i = mul nsw i32 %25, %23
  %arrayidx6.epil.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %indvars.iv.epil.i
  %26 = load i32, i32* %arrayidx6.epil.i, align 4, !tbaa !2
  %idxprom7.epil.i = sext i32 %26 to i64
  %arrayidx8.epil.i = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %idxprom7.epil.i
  %27 = load i32, i32* %arrayidx8.epil.i, align 4, !tbaa !2
  %add.epil.i = add nsw i32 %27, %mul.epil.i
  store i32 %add.epil.i, i32* %arrayidx8.epil.i, align 4, !tbaa !2
  %indvars.iv.next.epil.i = add nuw nsw i64 %indvars.iv.epil.i, 1
  %epil.iter.sub.i = add nsw i32 %epil.iter.i, -1
  %epil.iter.cmp.i = icmp eq i32 %epil.iter.sub.i, 0
  br i1 %epil.iter.cmp.i, label %kernel.exit, label %for.body.epil.i, !llvm.loop !8

kernel.exit:                                      ; preds = %for.body.epil.i, %entry, %for.end.loopexit.unr-lcssa.i
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %nnz, i32* nocapture readonly %val, i32* nocapture readonly %col, i32* nocapture readonly %row, i32* nocapture readonly %feature, i32* nocapture %output) local_unnamed_addr #0 {
entry:
  %cmp15 = icmp sgt i32 %nnz, 0
  br i1 %cmp15, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %0 = add nsw i32 %nnz, -1
  %xtraiter = and i32 %nnz, 3
  %1 = icmp ult i32 %0, 3
  br i1 %1, label %for.end.loopexit.unr-lcssa, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = sub nuw nsw i32 %nnz, %xtraiter
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %indvars.iv = phi i64 [ 0, %for.body.preheader.new ], [ %indvars.iv.next.3, %for.body ]
  %niter = phi i32 [ %unroll_iter, %for.body.preheader.new ], [ %niter.nsub.3, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %val, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %arrayidx2 = getelementptr inbounds i32, i32* %col, i64 %indvars.iv
  %3 = load i32, i32* %arrayidx2, align 4, !tbaa !2
  %idxprom3 = sext i32 %3 to i64
  %arrayidx4 = getelementptr inbounds i32, i32* %feature, i64 %idxprom3
  %4 = load i32, i32* %arrayidx4, align 4, !tbaa !2
  %mul = mul nsw i32 %4, %2
  %arrayidx6 = getelementptr inbounds i32, i32* %row, i64 %indvars.iv
  %5 = load i32, i32* %arrayidx6, align 4, !tbaa !2
  %idxprom7 = sext i32 %5 to i64
  %arrayidx8 = getelementptr inbounds i32, i32* %output, i64 %idxprom7
  %6 = load i32, i32* %arrayidx8, align 4, !tbaa !2
  %add = add nsw i32 %6, %mul
  store i32 %add, i32* %arrayidx8, align 4, !tbaa !2
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx.1 = getelementptr inbounds i32, i32* %val, i64 %indvars.iv.next
  %7 = load i32, i32* %arrayidx.1, align 4, !tbaa !2
  %arrayidx2.1 = getelementptr inbounds i32, i32* %col, i64 %indvars.iv.next
  %8 = load i32, i32* %arrayidx2.1, align 4, !tbaa !2
  %idxprom3.1 = sext i32 %8 to i64
  %arrayidx4.1 = getelementptr inbounds i32, i32* %feature, i64 %idxprom3.1
  %9 = load i32, i32* %arrayidx4.1, align 4, !tbaa !2
  %mul.1 = mul nsw i32 %9, %7
  %arrayidx6.1 = getelementptr inbounds i32, i32* %row, i64 %indvars.iv.next
  %10 = load i32, i32* %arrayidx6.1, align 4, !tbaa !2
  %idxprom7.1 = sext i32 %10 to i64
  %arrayidx8.1 = getelementptr inbounds i32, i32* %output, i64 %idxprom7.1
  %11 = load i32, i32* %arrayidx8.1, align 4, !tbaa !2
  %add.1 = add nsw i32 %11, %mul.1
  store i32 %add.1, i32* %arrayidx8.1, align 4, !tbaa !2
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx.2 = getelementptr inbounds i32, i32* %val, i64 %indvars.iv.next.1
  %12 = load i32, i32* %arrayidx.2, align 4, !tbaa !2
  %arrayidx2.2 = getelementptr inbounds i32, i32* %col, i64 %indvars.iv.next.1
  %13 = load i32, i32* %arrayidx2.2, align 4, !tbaa !2
  %idxprom3.2 = sext i32 %13 to i64
  %arrayidx4.2 = getelementptr inbounds i32, i32* %feature, i64 %idxprom3.2
  %14 = load i32, i32* %arrayidx4.2, align 4, !tbaa !2
  %mul.2 = mul nsw i32 %14, %12
  %arrayidx6.2 = getelementptr inbounds i32, i32* %row, i64 %indvars.iv.next.1
  %15 = load i32, i32* %arrayidx6.2, align 4, !tbaa !2
  %idxprom7.2 = sext i32 %15 to i64
  %arrayidx8.2 = getelementptr inbounds i32, i32* %output, i64 %idxprom7.2
  %16 = load i32, i32* %arrayidx8.2, align 4, !tbaa !2
  %add.2 = add nsw i32 %16, %mul.2
  store i32 %add.2, i32* %arrayidx8.2, align 4, !tbaa !2
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx.3 = getelementptr inbounds i32, i32* %val, i64 %indvars.iv.next.2
  %17 = load i32, i32* %arrayidx.3, align 4, !tbaa !2
  %arrayidx2.3 = getelementptr inbounds i32, i32* %col, i64 %indvars.iv.next.2
  %18 = load i32, i32* %arrayidx2.3, align 4, !tbaa !2
  %idxprom3.3 = sext i32 %18 to i64
  %arrayidx4.3 = getelementptr inbounds i32, i32* %feature, i64 %idxprom3.3
  %19 = load i32, i32* %arrayidx4.3, align 4, !tbaa !2
  %mul.3 = mul nsw i32 %19, %17
  %arrayidx6.3 = getelementptr inbounds i32, i32* %row, i64 %indvars.iv.next.2
  %20 = load i32, i32* %arrayidx6.3, align 4, !tbaa !2
  %idxprom7.3 = sext i32 %20 to i64
  %arrayidx8.3 = getelementptr inbounds i32, i32* %output, i64 %idxprom7.3
  %21 = load i32, i32* %arrayidx8.3, align 4, !tbaa !2
  %add.3 = add nsw i32 %21, %mul.3
  store i32 %add.3, i32* %arrayidx8.3, align 4, !tbaa !2
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.nsub.3 = add i32 %niter, -4
  %niter.ncmp.3 = icmp eq i32 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !6

for.end.loopexit.unr-lcssa:                       ; preds = %for.body, %for.body.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next.3, %for.body ]
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.end, label %for.body.epil

for.body.epil:                                    ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %for.body.epil ], [ %indvars.iv.unr, %for.end.loopexit.unr-lcssa ]
  %epil.iter = phi i32 [ %epil.iter.sub, %for.body.epil ], [ %xtraiter, %for.end.loopexit.unr-lcssa ]
  %arrayidx.epil = getelementptr inbounds i32, i32* %val, i64 %indvars.iv.epil
  %22 = load i32, i32* %arrayidx.epil, align 4, !tbaa !2
  %arrayidx2.epil = getelementptr inbounds i32, i32* %col, i64 %indvars.iv.epil
  %23 = load i32, i32* %arrayidx2.epil, align 4, !tbaa !2
  %idxprom3.epil = sext i32 %23 to i64
  %arrayidx4.epil = getelementptr inbounds i32, i32* %feature, i64 %idxprom3.epil
  %24 = load i32, i32* %arrayidx4.epil, align 4, !tbaa !2
  %mul.epil = mul nsw i32 %24, %22
  %arrayidx6.epil = getelementptr inbounds i32, i32* %row, i64 %indvars.iv.epil
  %25 = load i32, i32* %arrayidx6.epil, align 4, !tbaa !2
  %idxprom7.epil = sext i32 %25 to i64
  %arrayidx8.epil = getelementptr inbounds i32, i32* %output, i64 %idxprom7.epil
  %26 = load i32, i32* %arrayidx8.epil, align 4, !tbaa !2
  %add.epil = add nsw i32 %26, %mul.epil
  store i32 %add.epil, i32* %arrayidx8.epil, align 4, !tbaa !2
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.sub = add i32 %epil.iter, -1
  %epil.iter.cmp = icmp eq i32 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %for.end, label %for.body.epil, !llvm.loop !8

for.end:                                          ; preds = %for.body.epil, %for.end.loopexit.unr-lcssa, %entry
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !7}
