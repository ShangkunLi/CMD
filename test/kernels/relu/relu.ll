; ModuleID = 'relu.bc'
source_filename = "relu.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %ni, i32 %nj, i32 %nk, [1100 x i32]* nocapture %C, [1100 x i32]* nocapture readonly %A, [1100 x i32]* nocapture readnone %B) local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %x.032 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %div = udiv i32 %x.032, 1100
  %rem = urem i32 %x.032, 1100
  %idxprom = zext i32 %div to i64
  %idxprom1 = zext i32 %rem to i64
  %arrayidx2 = getelementptr inbounds [1100 x i32], [1100 x i32]* %A, i64 %idxprom, i64 %idxprom1
  %0 = load i32, i32* %arrayidx2, align 4, !tbaa !2
  %arrayidx7 = getelementptr inbounds [1100 x i32], [1100 x i32]* %C, i64 %idxprom, i64 %idxprom1
  %1 = icmp sgt i32 %0, 0
  %. = select i1 %1, i32 %0, i32 0
  store i32 %., i32* %arrayidx7, align 4, !tbaa !2
  %inc = add nuw nsw i32 %x.032, 1
  %exitcond = icmp eq i32 %inc, 1100000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1100000, i32 4) #7
  %call1 = tail call i8* @polybench_alloc_data(i64 1100000, i32 4) #7
  %call2 = tail call i8* @polybench_alloc_data(i64 1100000, i32 4) #7
  %arraydecay = bitcast i8* %call to [1100 x i32]*
  %arraydecay3 = bitcast i8* %call1 to [1100 x i32]*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(4400000) %call, i8 0, i64 4400000, i1 false) #7
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(4400000) %call1, i8 0, i64 4400000, i1 false) #7
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(4400000) %call2, i8 0, i64 4400000, i1 false) #7
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %x.032.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %div.i = udiv i32 %x.032.i, 1100
  %rem.i28 = urem i32 %x.032.i, 1100
  %idxprom.i = zext i32 %div.i to i64
  %idxprom1.i = zext i32 %rem.i28 to i64
  %arrayidx2.i = getelementptr inbounds [1100 x i32], [1100 x i32]* %arraydecay3, i64 %idxprom.i, i64 %idxprom1.i
  %0 = load i32, i32* %arrayidx2.i, align 4, !tbaa !2
  %arrayidx7.i = getelementptr inbounds [1100 x i32], [1100 x i32]* %arraydecay, i64 %idxprom.i, i64 %idxprom1.i
  %1 = icmp sgt i32 %0, 0
  %..i = select i1 %1, i32 %0, i32 0
  store i32 %..i, i32* %arrayidx7.i, align 4, !tbaa !2
  %inc.i = add nuw nsw i32 %x.032.i, 1
  %exitcond.i29 = icmp eq i32 %inc.i, 1100000
  br i1 %exitcond.i29, label %kernel.exit, label %for.body.i

kernel.exit:                                      ; preds = %for.body.i
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %kernel.exit
  %2 = load i8*, i8** %argv, align 8, !tbaa !6
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %call1.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #8
  br label %for.cond2.preheader.i

for.cond2.preheader.i:                            ; preds = %for.inc10.i, %if.then
  %indvars.iv4.i = phi i64 [ 0, %if.then ], [ %indvars.iv.next5.i, %for.inc10.i ]
  %6 = mul nuw nsw i64 %indvars.iv4.i, 1000
  br label %for.body4.i

for.body4.i:                                      ; preds = %if.end.i, %for.cond2.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond2.preheader.i ], [ %indvars.iv.next.i, %if.end.i ]
  %7 = add nuw nsw i64 %indvars.iv.i, %6
  %8 = trunc i64 %7 to i32
  %rem.i = urem i32 %8, 20
  %cmp5.i = icmp eq i32 %rem.i, 0
  br i1 %cmp5.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %for.body4.i
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #8
  br label %if.end.i

if.end.i:                                         ; preds = %if.then.i, %for.body4.i
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %arrayidx8.i = getelementptr inbounds [1100 x i32], [1100 x i32]* %arraydecay, i64 %indvars.iv4.i, i64 %indvars.iv.i
  %11 = load i32, i32* %arrayidx8.i, align 4, !tbaa !2
  %call9.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %11) #8
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1100
  br i1 %exitcond.i, label %for.inc10.i, label %for.body4.i

for.inc10.i:                                      ; preds = %if.end.i
  %indvars.iv.next5.i = add nuw nsw i64 %indvars.iv4.i, 1
  %exitcond7.i = icmp eq i64 %indvars.iv.next5.i, 1000
  br i1 %exitcond7.i, label %print_array.exit, label %for.cond2.preheader.i

print_array.exit:                                 ; preds = %for.inc10.i
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %call13.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #8
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %print_array.exit, %kernel.exit
  tail call void @free(i8* nonnull %call) #7
  tail call void @free(i8* %call1) #7
  tail call void @free(i8* %call2) #7
  ret i32 0
}

declare dso_local i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

attributes #0 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree nounwind }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { cold nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
