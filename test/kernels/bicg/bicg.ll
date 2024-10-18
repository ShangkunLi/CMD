; ModuleID = 'bicg.bc'
source_filename = "bicg.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %m, i32 %n, [1900 x double]* nocapture readonly %A, double* nocapture %s, double* nocapture %q, double* nocapture readonly %p, double* nocapture readonly %r) local_unnamed_addr #0 {
entry:
  %q77 = bitcast double* %q to i8*
  %cmp65 = icmp sgt i32 %m, 0
  br i1 %cmp65, label %for.body.preheader, label %for.cond1.preheader

for.body.preheader:                               ; preds = %entry
  %s82 = bitcast double* %s to i8*
  %wide.trip.count80 = zext i32 %m to i64
  %0 = shl nuw nsw i64 %wide.trip.count80, 3
  call void @llvm.memset.p0i8.i64(i8* align 8 %s82, i8 0, i64 %0, i1 false)
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.body.preheader, %entry
  %cmp263 = icmp sgt i32 %n, 0
  br i1 %cmp263, label %for.body3.lr.ph, label %for.end36

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %wide.trip.count70 = zext i32 %n to i64
  br i1 %cmp65, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  %1 = shl nuw nsw i64 %wide.trip.count70, 3
  call void @llvm.memset.p0i8.i64(i8* align 8 %q77, i8 0, i64 %1, i1 false)
  br label %for.end36

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  %wide.trip.count = zext i32 %m to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond6.for.inc34_crit_edge.us, %for.body3.us.preheader
  %indvars.iv68 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next69, %for.cond6.for.inc34_crit_edge.us ]
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %indvars.iv68
  store double 0.000000e+00, double* %arrayidx5.us, align 8, !tbaa !2
  %arrayidx12.us = getelementptr inbounds double, double* %r, i64 %indvars.iv68
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.body8.us ]
  %arrayidx10.us = getelementptr inbounds double, double* %s, i64 %indvars.iv
  %2 = load double, double* %arrayidx10.us, align 8, !tbaa !2
  %3 = load double, double* %arrayidx12.us, align 8, !tbaa !2
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv
  %4 = load double, double* %arrayidx16.us, align 8, !tbaa !2
  %mul.us = fmul double %3, %4
  %add.us = fadd double %2, %mul.us
  store double %add.us, double* %arrayidx10.us, align 8, !tbaa !2
  %5 = load double, double* %arrayidx5.us, align 8, !tbaa !2
  %6 = load double, double* %arrayidx16.us, align 8, !tbaa !2
  %arrayidx26.us = getelementptr inbounds double, double* %p, i64 %indvars.iv
  %7 = load double, double* %arrayidx26.us, align 8, !tbaa !2
  %mul27.us = fmul double %6, %7
  %add28.us = fadd double %5, %mul27.us
  store double %add28.us, double* %arrayidx5.us, align 8, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond6.for.inc34_crit_edge.us, label %for.body8.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.body8.us
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %for.end36, label %for.body3.us

for.end36:                                        ; preds = %for.cond6.for.inc34_crit_edge.us, %for.body3.preheader, %for.cond1.preheader
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #7
  %call1 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #7
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #7
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #7
  %call4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #7
  %arraydecay = bitcast i8* %call to [1900 x double]*
  %arraydecay6 = bitcast i8* %call3 to double*
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv10.i = phi i64 [ 0, %entry ], [ %indvars.iv.next11.i, %for.body.i ]
  %i.05.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %rem.lhs.trunc.i = trunc i32 %i.05.i to i16
  %rem1.i = urem i16 %rem.lhs.trunc.i, 1900
  %conv.i = uitofp i16 %rem1.i to double
  %div.i = fdiv double %conv.i, 1.900000e+03
  %arrayidx.i = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv10.i
  store double %div.i, double* %arrayidx.i, align 8, !tbaa !2
  %indvars.iv.next11.i = add nuw nsw i64 %indvars.iv10.i, 1
  %inc.i = add nuw nsw i32 %i.05.i, 1
  %exitcond12.i = icmp eq i64 %indvars.iv.next11.i, 1900
  br i1 %exitcond12.i, label %for.body5.i.preheader, label %for.body.i

for.body5.i.preheader:                            ; preds = %for.body.i
  %arraydecay5 = bitcast i8* %call4 to double*
  br label %for.body5.i

for.body5.i:                                      ; preds = %for.body5.i.preheader, %for.inc27.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc27.i ], [ 0, %for.body5.i.preheader ]
  %i.14.i = phi i32 [ %inc28.i, %for.inc27.i ], [ 0, %for.body5.i.preheader ]
  %rem6.lhs.trunc.i = trunc i32 %i.14.i to i16
  %rem62.i = urem i16 %rem6.lhs.trunc.i, 2100
  %conv7.i = uitofp i16 %rem62.i to double
  %div9.i = fdiv double %conv7.i, 2.100000e+03
  %arrayidx11.i = getelementptr inbounds double, double* %arraydecay5, i64 %indvars.iv7.i
  store double %div9.i, double* %arrayidx11.i, align 8, !tbaa !2
  br label %for.body15.i

for.body15.i:                                     ; preds = %for.body15.i, %for.body5.i
  %indvars.iv.i = phi i64 [ 0, %for.body5.i ], [ %indvars.iv.next.i, %for.body15.i ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %0 = mul nuw nsw i64 %indvars.iv.next.i, %indvars.iv7.i
  %1 = trunc i64 %0 to i32
  %rem16.i = urem i32 %1, 2100
  %conv17.i = sitofp i32 %rem16.i to double
  %div19.i = fdiv double %conv17.i, 2.100000e+03
  %arrayidx23.i = getelementptr inbounds [1900 x double], [1900 x double]* %arraydecay, i64 %indvars.iv7.i, i64 %indvars.iv.i
  store double %div19.i, double* %arrayidx23.i, align 8, !tbaa !2
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1900
  br i1 %exitcond.i, label %for.inc27.i, label %for.body15.i

for.inc27.i:                                      ; preds = %for.body15.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1
  %inc28.i = add nuw nsw i32 %i.14.i, 1
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i, 2100
  br i1 %exitcond9.i, label %init_array.exit, label %for.body5.i

init_array.exit:                                  ; preds = %for.inc27.i
  %arraydecay8 = bitcast i8* %call1 to double*
  %arraydecay9 = bitcast i8* %call2 to double*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(15200) %call1, i8 0, i64 15200, i1 false) #7
  br label %for.body3.us.i

for.body3.us.i:                                   ; preds = %for.cond6.for.inc34_crit_edge.us.i, %init_array.exit
  %indvars.iv68.i = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next69.i, %for.cond6.for.inc34_crit_edge.us.i ]
  %arrayidx5.us.i = getelementptr inbounds double, double* %arraydecay9, i64 %indvars.iv68.i
  store double 0.000000e+00, double* %arrayidx5.us.i, align 8, !tbaa !2
  %arrayidx12.us.i = getelementptr inbounds double, double* %arraydecay5, i64 %indvars.iv68.i
  br label %for.body8.us.i

for.body8.us.i:                                   ; preds = %for.body8.us.i, %for.body3.us.i
  %indvars.iv.i43 = phi i64 [ 0, %for.body3.us.i ], [ %indvars.iv.next.i44, %for.body8.us.i ]
  %arrayidx10.us.i = getelementptr inbounds double, double* %arraydecay8, i64 %indvars.iv.i43
  %2 = load double, double* %arrayidx10.us.i, align 8, !tbaa !2
  %3 = load double, double* %arrayidx12.us.i, align 8, !tbaa !2
  %arrayidx16.us.i = getelementptr inbounds [1900 x double], [1900 x double]* %arraydecay, i64 %indvars.iv68.i, i64 %indvars.iv.i43
  %4 = load double, double* %arrayidx16.us.i, align 8, !tbaa !2
  %mul.us.i = fmul double %3, %4
  %add.us.i = fadd double %2, %mul.us.i
  store double %add.us.i, double* %arrayidx10.us.i, align 8, !tbaa !2
  %5 = load double, double* %arrayidx5.us.i, align 8, !tbaa !2
  %6 = load double, double* %arrayidx16.us.i, align 8, !tbaa !2
  %arrayidx26.us.i = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv.i43
  %7 = load double, double* %arrayidx26.us.i, align 8, !tbaa !2
  %mul27.us.i = fmul double %6, %7
  %add28.us.i = fadd double %5, %mul27.us.i
  store double %add28.us.i, double* %arrayidx5.us.i, align 8, !tbaa !2
  %indvars.iv.next.i44 = add nuw nsw i64 %indvars.iv.i43, 1
  %exitcond.i45 = icmp eq i64 %indvars.iv.next.i44, 1900
  br i1 %exitcond.i45, label %for.cond6.for.inc34_crit_edge.us.i, label %for.body8.us.i

for.cond6.for.inc34_crit_edge.us.i:               ; preds = %for.body8.us.i
  %indvars.iv.next69.i = add nuw nsw i64 %indvars.iv68.i, 1
  %exitcond71.i = icmp eq i64 %indvars.iv.next69.i, 2100
  br i1 %exitcond71.i, label %kernel.exit, label %for.body3.us.i

kernel.exit:                                      ; preds = %for.cond6.for.inc34_crit_edge.us.i
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %kernel.exit
  %8 = load i8*, i8** %argv, align 8, !tbaa !6
  %strcmpload = load i8, i8* %8, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #8
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %call1.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #8
  br label %for.body.i37

for.body.i37:                                     ; preds = %if.end.i, %if.then
  %indvars.iv8.i = phi i64 [ 0, %if.then ], [ %indvars.iv.next9.i, %if.end.i ]
  %i.07.i = phi i32 [ 0, %if.then ], [ %inc.i39, %if.end.i ]
  %rem.lhs.trunc.i36 = trunc i32 %i.07.i to i16
  %rem4.i = urem i16 %rem.lhs.trunc.i36, 20
  %cmp2.i = icmp eq i16 %rem4.i, 0
  br i1 %cmp2.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %for.body.i37
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #8
  br label %if.end.i

if.end.i:                                         ; preds = %if.then.i, %for.body.i37
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %arrayidx.i38 = getelementptr inbounds double, double* %arraydecay8, i64 %indvars.iv8.i
  %14 = load double, double* %arrayidx.i38, align 8, !tbaa !2
  %call4.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #8
  %indvars.iv.next9.i = add nuw nsw i64 %indvars.iv8.i, 1
  %inc.i39 = add nuw nsw i32 %i.07.i, 1
  %exitcond10.i = icmp eq i64 %indvars.iv.next9.i, 1900
  br i1 %exitcond10.i, label %for.end.i, label %for.body.i37

for.end.i:                                        ; preds = %if.end.i
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %call5.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %call6.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #8
  br label %for.body9.i

for.body9.i:                                      ; preds = %if.end14.i, %for.end.i
  %indvars.iv.i40 = phi i64 [ 0, %for.end.i ], [ %indvars.iv.next.i41, %if.end14.i ]
  %i.16.i = phi i32 [ 0, %for.end.i ], [ %inc19.i, %if.end14.i ]
  %rem10.lhs.trunc.i = trunc i32 %i.16.i to i16
  %rem105.i = urem i16 %rem10.lhs.trunc.i, 20
  %cmp11.i = icmp eq i16 %rem105.i, 0
  br i1 %cmp11.i, label %if.then12.i, label %if.end14.i

if.then12.i:                                      ; preds = %for.body9.i
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #8
  br label %if.end14.i

if.end14.i:                                       ; preds = %if.then12.i, %for.body9.i
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %arrayidx16.i = getelementptr inbounds double, double* %arraydecay9, i64 %indvars.iv.i40
  %19 = load double, double* %arrayidx16.i, align 8, !tbaa !2
  %call17.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #8
  %indvars.iv.next.i41 = add nuw nsw i64 %indvars.iv.i40, 1
  %inc19.i = add nuw nsw i32 %i.16.i, 1
  %exitcond.i42 = icmp eq i64 %indvars.iv.next.i41, 2100
  br i1 %exitcond.i42, label %print_array.exit, label %for.body9.i

print_array.exit:                                 ; preds = %if.end14.i
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %call21.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #8
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #8
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %print_array.exit, %kernel.exit
  tail call void @free(i8* %call) #7
  tail call void @free(i8* %call1) #7
  tail call void @free(i8* nonnull %call2) #7
  tail call void @free(i8* %call3) #7
  tail call void @free(i8* %call4) #7
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
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
