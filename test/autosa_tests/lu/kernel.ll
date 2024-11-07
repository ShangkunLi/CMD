; ModuleID = 'kernel.bc'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [24 x i8] c"Failed with %d errors!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%f \00", align 1
@str = private unnamed_addr constant [8 x i8] c"Passed!\00", align 1
@str.9 = private unnamed_addr constant [3 x i8] c"A:\00", align 1
@str.10 = private unnamed_addr constant [10 x i8] c"L_golden:\00", align 1
@str.11 = private unnamed_addr constant [10 x i8] c"U_golden:\00", align 1
@str.12 = private unnamed_addr constant [3 x i8] c"L:\00", align 1
@str.13 = private unnamed_addr constant [3 x i8] c"U:\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @init_array([32 x float]* nocapture %A) local_unnamed_addr #0 {
entry:
  %B = alloca [32 x [32 x float]], align 16
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end17, %entry
  %indvar181 = phi i64 [ 0, %entry ], [ %indvar.next182, %for.end17 ]
  %indvars.iv176 = phi i64 [ 1, %entry ], [ %indvars.iv.next177, %for.end17 ]
  %0 = mul nuw nsw i64 %indvar181, 33
  %1 = add nuw nsw i64 %0, 1
  %scevgep183 = getelementptr [32 x float], [32 x float]* %A, i64 0, i64 %1
  %scevgep183184 = bitcast float* %scevgep183 to i8*
  %2 = shl i64 %indvar181, 2
  %3 = sub i64 120, %2
  %4 = and i64 %3, 17179869180
  %5 = add nuw nsw i64 %4, 4
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %for.body3 ], [ 0, %for.cond1.preheader ]
  %6 = trunc i64 %indvars.iv170 to i32
  %7 = sub i32 0, %6
  %conv = sitofp i32 %7 to float
  %div = fmul float %conv, 3.125000e-02
  %add = fadd float %div, 1.000000e+00
  %arrayidx5 = getelementptr inbounds [32 x float], [32 x float]* %A, i64 %indvar181, i64 %indvars.iv170
  store float %add, float* %arrayidx5, align 4, !tbaa !2
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %exitcond175 = icmp eq i64 %indvars.iv.next171, %indvars.iv176
  br i1 %exitcond175, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvar.next182 = add nuw nsw i64 %indvar181, 1
  %cmp8149 = icmp ult i64 %indvar181, 31
  br i1 %cmp8149, label %for.body10.preheader, label %for.end17

for.body10.preheader:                             ; preds = %for.end
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(1) %scevgep183184, i8 0, i64 %5, i1 false)
  br label %for.end17

for.end17:                                        ; preds = %for.body10.preheader, %for.end
  %arrayidx21 = getelementptr inbounds [32 x float], [32 x float]* %A, i64 %indvar181, i64 %indvar181
  store float 1.000000e+00, float* %arrayidx21, align 4, !tbaa !2
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %exitcond185 = icmp eq i64 %indvar.next182, 32
  br i1 %exitcond185, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.end17
  %8 = bitcast [32 x [32 x float]]* %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %8) #6
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4096) %8, i8 0, i64 4096, i1 false)
  br label %for.cond47.preheader

for.cond47.preheader:                             ; preds = %for.inc74, %for.end24
  %indvars.iv159 = phi i64 [ 0, %for.end24 ], [ %indvars.iv.next160, %for.inc74 ]
  br label %for.cond51.preheader

for.cond51.preheader:                             ; preds = %for.inc71, %for.cond47.preheader
  %indvars.iv156 = phi i64 [ 0, %for.cond47.preheader ], [ %indvars.iv.next157, %for.inc71 ]
  %arrayidx58 = getelementptr inbounds [32 x float], [32 x float]* %A, i64 %indvars.iv156, i64 %indvars.iv159
  %9 = load float, float* %arrayidx58, align 4, !tbaa !2
  br label %for.body54

for.body54:                                       ; preds = %for.body54, %for.cond51.preheader
  %indvars.iv = phi i64 [ 0, %for.cond51.preheader ], [ %indvars.iv.next, %for.body54 ]
  %arrayidx62 = getelementptr inbounds [32 x float], [32 x float]* %A, i64 %indvars.iv, i64 %indvars.iv159
  %10 = load float, float* %arrayidx62, align 4, !tbaa !2
  %mul = fmul float %9, %10
  %arrayidx66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %B, i64 0, i64 %indvars.iv156, i64 %indvars.iv
  %11 = load float, float* %arrayidx66, align 4, !tbaa !2
  %add67 = fadd float %11, %mul
  store float %add67, float* %arrayidx66, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond155 = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond155, label %for.inc71, label %for.body54

for.inc71:                                        ; preds = %for.body54
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %exitcond158 = icmp eq i64 %indvars.iv.next157, 32
  br i1 %exitcond158, label %for.inc74, label %for.cond51.preheader

for.inc74:                                        ; preds = %for.inc71
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next160, 32
  br i1 %exitcond161, label %for.cond81.preheader, label %for.cond47.preheader

for.cond81.preheader:                             ; preds = %for.inc74, %for.cond81.preheader
  %indvar = phi i64 [ %indvar.next, %for.cond81.preheader ], [ 0, %for.inc74 ]
  %scevgep = getelementptr [32 x float], [32 x float]* %A, i64 %indvar, i64 0
  %scevgep152 = bitcast float* %scevgep to i8*
  %scevgep153 = getelementptr [32 x [32 x float]], [32 x [32 x float]]* %B, i64 0, i64 %indvar, i64 0
  %scevgep153154 = bitcast float* %scevgep153 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(128) %scevgep152, i8* nonnull align 16 dereferenceable(128) %scevgep153154, i64 128, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 32
  br i1 %exitcond, label %for.end98, label %for.cond81.preheader

for.end98:                                        ; preds = %for.cond81.preheader
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %8) #6
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable writeonly
define dso_local void @lu_cpu([32 x float]* nocapture readnone %A, [32 x float]* nocapture %L, [32 x float]* nocapture %U) local_unnamed_addr #2 {
entry:
  %prev_V = alloca [32 x [32 x [32 x float]]], align 16
  %U_tmp = alloca [32 x [32 x [32 x float]]], align 16
  %L_tmp = alloca [32 x [32 x [32 x float]]], align 16
  %0 = bitcast [32 x [32 x [32 x float]]]* %prev_V to i8*
  call void @llvm.lifetime.start.p0i8(i64 131072, i8* nonnull %0) #6
  %1 = bitcast [32 x [32 x [32 x float]]]* %U_tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 131072, i8* nonnull %1) #6
  %2 = bitcast [32 x [32 x [32 x float]]]* %L_tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 131072, i8* nonnull %2) #6
  br label %for.cond5.preheader.lr.ph

for.cond5.preheader.lr.ph:                        ; preds = %entry, %for.cond.cleanup3
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.cond.cleanup3 ]
  br label %for.cond5.preheader.us

for.cond5.preheader.us:                           ; preds = %for.cond5.for.cond.cleanup7_crit_edge.us, %for.cond5.preheader.lr.ph
  %indvars.iv253 = phi i64 [ %indvars.iv.next254, %for.cond5.for.cond.cleanup7_crit_edge.us ], [ %indvars.iv, %for.cond5.preheader.lr.ph ]
  %cmp29.us = icmp eq i64 %indvars.iv253, %indvars.iv
  %3 = add nsw i64 %indvars.iv253, -1
  br i1 %cmp29.us, label %for.body8.us.us, label %for.body8.us221.preheader

for.body8.us221.preheader:                        ; preds = %for.cond5.preheader.us
  %arrayidx84.us237 = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %L_tmp, i64 0, i64 %indvars.iv, i64 %indvars.iv253, i64 %indvars.iv
  %arrayidx94.us238 = getelementptr inbounds [32 x float], [32 x float]* %L, i64 %indvars.iv, i64 %indvars.iv253
  br label %for.body8.us221

for.body8.us221:                                  ; preds = %for.inc.us240, %for.body8.us221.preheader
  %indvars.iv247 = phi i64 [ %indvars.iv, %for.body8.us221.preheader ], [ %indvars.iv.next248, %for.inc.us240 ]
  %arrayidx12.us224 = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %prev_V, i64 0, i64 %indvars.iv247, i64 %indvars.iv253, i64 %indvars.iv
  %4 = bitcast float* %arrayidx12.us224 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !2
  %arrayidx18.us225 = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %U_tmp, i64 0, i64 %indvars.iv247, i64 %indvars.iv253, i64 %indvars.iv
  %6 = bitcast float* %arrayidx18.us225 to i32*
  %arrayidx28.us226 = getelementptr inbounds [32 x float], [32 x float]* %U, i64 %indvars.iv253, i64 %indvars.iv247
  %7 = bitcast float* %arrayidx28.us226 to i32*
  store i32 %5, i32* %7, align 4, !tbaa !2
  %arrayidx57.us228 = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %U_tmp, i64 0, i64 %indvars.iv247, i64 %3, i64 %indvars.iv
  %8 = bitcast float* %arrayidx57.us228 to i32*
  %9 = load i32, i32* %8, align 4, !tbaa !2
  store i32 %9, i32* %6, align 4, !tbaa !2
  %cmp64.us229 = icmp eq i64 %indvars.iv247, %indvars.iv
  br i1 %cmp64.us229, label %if.then65.us235, label %if.else95.us230

if.else95.us230:                                  ; preds = %for.body8.us221
  %10 = add nsw i64 %indvars.iv247, -1
  %arrayidx102.us233 = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %L_tmp, i64 0, i64 %10, i64 %indvars.iv253, i64 %indvars.iv
  %11 = bitcast float* %arrayidx102.us233 to i32*
  %12 = load i32, i32* %11, align 4, !tbaa !2
  %arrayidx108.us234 = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %L_tmp, i64 0, i64 %indvars.iv247, i64 %indvars.iv253, i64 %indvars.iv
  %13 = bitcast float* %arrayidx108.us234 to i32*
  store i32 %12, i32* %13, align 4, !tbaa !2
  br label %for.inc.us240

if.then65.us235:                                  ; preds = %for.body8.us221
  %14 = bitcast i32 %9 to float
  %15 = bitcast i32 %5 to float
  %div.us236 = fdiv float %15, %14
  store float %div.us236, float* %arrayidx84.us237, align 4, !tbaa !2
  store float %div.us236, float* %arrayidx94.us238, align 4, !tbaa !2
  br label %for.inc.us240

for.inc.us240:                                    ; preds = %if.then65.us235, %if.else95.us230
  %indvars.iv.next248 = add nuw nsw i64 %indvars.iv247, 1
  %exitcond = icmp eq i64 %indvars.iv.next248, 32
  br i1 %exitcond, label %for.cond5.for.cond.cleanup7_crit_edge.us, label %for.body8.us221

for.cond5.for.cond.cleanup7_crit_edge.us:         ; preds = %for.inc.us240, %for.body8.us.us
  %indvars.iv.next254 = add nuw nsw i64 %indvars.iv253, 1
  %exitcond256 = icmp eq i64 %indvars.iv.next254, 32
  br i1 %exitcond256, label %for.cond.cleanup3, label %for.cond5.preheader.us

for.body8.us.us:                                  ; preds = %for.cond5.preheader.us, %for.body8.us.us
  %indvars.iv250 = phi i64 [ %indvars.iv.next251, %for.body8.us.us ], [ %indvars.iv, %for.cond5.preheader.us ]
  %arrayidx12.us.us = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %prev_V, i64 0, i64 %indvars.iv250, i64 %indvars.iv, i64 %indvars.iv
  %16 = bitcast float* %arrayidx12.us.us to i32*
  %17 = load i32, i32* %16, align 4, !tbaa !2
  %arrayidx18.us.us = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %U_tmp, i64 0, i64 %indvars.iv250, i64 %indvars.iv, i64 %indvars.iv
  %18 = bitcast float* %arrayidx18.us.us to i32*
  %arrayidx28.us.us = getelementptr inbounds [32 x float], [32 x float]* %U, i64 %indvars.iv, i64 %indvars.iv250
  %19 = bitcast float* %arrayidx28.us.us to i32*
  store i32 %17, i32* %18, align 4, !tbaa !2
  store i32 %17, i32* %19, align 4, !tbaa !2
  %indvars.iv.next251 = add nuw nsw i64 %indvars.iv250, 1
  %exitcond252 = icmp eq i64 %indvars.iv.next251, 32
  br i1 %exitcond252, label %for.cond5.for.cond.cleanup7_crit_edge.us, label %for.body8.us.us

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  call void @llvm.lifetime.end.p0i8(i64 131072, i8* nonnull %2) #6
  call void @llvm.lifetime.end.p0i8(i64 131072, i8* nonnull %1) #6
  call void @llvm.lifetime.end.p0i8(i64 131072, i8* nonnull %0) #6
  ret void

for.cond.cleanup3:                                ; preds = %for.cond5.for.cond.cleanup7_crit_edge.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond257 = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond257, label %for.cond.cleanup, label %for.cond5.preheader.lr.ph
}

; Function Attrs: nounwind uwtable
define dso_local void @lu_device([32 x float]* nocapture readonly %A, [32 x float]* nocapture %L, [32 x float]* nocapture %U) local_unnamed_addr #0 {
entry:
  %prev_V = alloca [32 x [32 x float]], align 16
  %V = alloca [32 x [32 x float]], align 16
  %U_tmp = alloca [32 x [32 x float]], align 16
  %L_tmp = alloca [32 x [32 x float]], align 16
  %0 = bitcast [32 x [32 x float]]* %prev_V to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %0) #6
  %1 = bitcast [32 x [32 x float]]* %V to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %1) #6
  %2 = bitcast [32 x [32 x float]]* %U_tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %2) #6
  %3 = bitcast [32 x [32 x float]]* %L_tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %3) #6
  br label %for.cond5.preheader.lr.ph

for.cond5.preheader.lr.ph:                        ; preds = %entry, %for.cond.cleanup3
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.cond.cleanup3 ]
  %cmp9 = icmp eq i64 %indvars.iv, 0
  br label %for.body8.lr.ph

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %3) #6
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %2) #6
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %1) #6
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %0) #6
  ret void

for.body8.lr.ph:                                  ; preds = %for.cond5.preheader.lr.ph, %for.cond.cleanup7
  %indvars.iv178 = phi i64 [ %indvars.iv, %for.cond5.preheader.lr.ph ], [ %indvars.iv.next179, %for.cond.cleanup7 ]
  %cmp24 = icmp eq i64 %indvars.iv178, %indvars.iv
  %4 = add nsw i64 %indvars.iv178, -1
  br i1 %cmp9, label %for.body8.us.preheader, label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.body8.lr.ph
  %arrayidx56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %prev_V, i64 0, i64 %indvars.iv, i64 %indvars.iv178
  %arrayidx64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L_tmp, i64 0, i64 %indvars.iv, i64 %indvars.iv178
  %arrayidx72 = getelementptr inbounds [32 x float], [32 x float]* %L, i64 %indvars.iv, i64 %indvars.iv178
  br label %for.body8

for.body8.us.preheader:                           ; preds = %for.body8.lr.ph
  %arrayidx56.us = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %prev_V, i64 0, i64 0, i64 %indvars.iv178
  %arrayidx64.us = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L_tmp, i64 0, i64 0, i64 %indvars.iv178
  %arrayidx72.us = getelementptr inbounds [32 x float], [32 x float]* %L, i64 0, i64 %indvars.iv178
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.inc.us, %for.body8.us.preheader
  %indvars.iv174 = phi i64 [ 0, %for.body8.us.preheader ], [ %indvars.iv.next175, %for.inc.us ]
  %arrayidx11.us = getelementptr inbounds [32 x float], [32 x float]* %A, i64 %indvars.iv174, i64 %indvars.iv178
  %5 = bitcast float* %arrayidx11.us to i32*
  %6 = load i32, i32* %5, align 4, !tbaa !2
  %arrayidx15.us = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %prev_V, i64 0, i64 %indvars.iv174, i64 %indvars.iv178
  %7 = bitcast float* %arrayidx15.us to i32*
  store i32 %6, i32* %7, align 4, !tbaa !2
  %8 = bitcast i32 %6 to float
  br i1 %cmp24, label %if.then25.us, label %if.else42.us

if.else42.us:                                     ; preds = %for.body8.us
  %arrayidx46.us = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U_tmp, i64 0, i64 %indvars.iv174, i64 %4
  %9 = load float, float* %arrayidx46.us, align 4, !tbaa !2
  %arrayidx50.us = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U_tmp, i64 0, i64 %indvars.iv174, i64 %indvars.iv178
  store float %9, float* %arrayidx50.us, align 4, !tbaa !2
  %cmp51.us = icmp eq i64 %indvars.iv174, 0
  br i1 %cmp51.us, label %if.then52.us, label %if.else73.us

if.else73.us:                                     ; preds = %if.else42.us
  %10 = add nsw i64 %indvars.iv174, -1
  %arrayidx78.us = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L_tmp, i64 0, i64 %10, i64 %indvars.iv178
  %11 = bitcast float* %arrayidx78.us to i32*
  %12 = load i32, i32* %11, align 4, !tbaa !2
  %arrayidx82.us = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L_tmp, i64 0, i64 %indvars.iv174, i64 %indvars.iv178
  %13 = bitcast float* %arrayidx82.us to i32*
  store i32 %12, i32* %13, align 4, !tbaa !2
  %14 = bitcast i32 %12 to float
  br label %if.end83.us

if.then52.us:                                     ; preds = %if.else42.us
  %15 = load float, float* %arrayidx56.us, align 4, !tbaa !2
  %div.us = fdiv float %15, %9
  store float %div.us, float* %arrayidx64.us, align 4, !tbaa !2
  store float %div.us, float* %arrayidx72.us, align 4, !tbaa !2
  br label %if.end83.us

if.end83.us:                                      ; preds = %if.then52.us, %if.else73.us
  %16 = phi float [ %div.us, %if.then52.us ], [ %14, %if.else73.us ]
  %mul.us = fmul float %9, %16
  %sub96.us = fsub float %8, %mul.us
  %arrayidx100.us = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %V, i64 0, i64 %indvars.iv174, i64 %indvars.iv178
  store float %sub96.us, float* %arrayidx100.us, align 4, !tbaa !2
  br label %for.inc.us

if.then25.us:                                     ; preds = %for.body8.us
  %arrayidx29.us = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %prev_V, i64 0, i64 %indvars.iv174, i64 0
  %17 = bitcast float* %arrayidx29.us to i32*
  %18 = load i32, i32* %17, align 16, !tbaa !2
  %arrayidx33.us = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U_tmp, i64 0, i64 %indvars.iv174, i64 0
  %19 = bitcast float* %arrayidx33.us to i32*
  store i32 %18, i32* %19, align 16, !tbaa !2
  %arrayidx41.us = getelementptr inbounds [32 x float], [32 x float]* %U, i64 0, i64 %indvars.iv174
  %20 = bitcast float* %arrayidx41.us to i32*
  store i32 %18, i32* %20, align 4, !tbaa !2
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then25.us, %if.end83.us
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %exitcond177 = icmp eq i64 %indvars.iv.next175, 32
  br i1 %exitcond177, label %for.cond.cleanup7, label %for.body8.us

for.cond.cleanup3:                                ; preds = %for.cond.cleanup7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond182 = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond182, label %for.cond.cleanup, label %for.cond5.preheader.lr.ph

for.cond.cleanup7:                                ; preds = %for.inc, %for.inc.us
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %exitcond181 = icmp eq i64 %indvars.iv.next179, 32
  br i1 %exitcond181, label %for.cond.cleanup3, label %for.body8.lr.ph

for.body8:                                        ; preds = %for.inc, %for.body8.preheader
  %indvars.iv171 = phi i64 [ %indvars.iv, %for.body8.preheader ], [ %indvars.iv.next172, %for.inc ]
  %arrayidx19 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %V, i64 0, i64 %indvars.iv171, i64 %indvars.iv178
  %21 = bitcast float* %arrayidx19 to i32*
  %22 = load i32, i32* %21, align 4, !tbaa !2
  %arrayidx23 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %prev_V, i64 0, i64 %indvars.iv171, i64 %indvars.iv178
  %23 = bitcast float* %arrayidx23 to i32*
  store i32 %22, i32* %23, align 4, !tbaa !2
  %24 = bitcast i32 %22 to float
  br i1 %cmp24, label %if.then25, label %if.else42

if.then25:                                        ; preds = %for.body8
  %arrayidx29 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %prev_V, i64 0, i64 %indvars.iv171, i64 %indvars.iv
  %25 = bitcast float* %arrayidx29 to i32*
  %26 = load i32, i32* %25, align 4, !tbaa !2
  %arrayidx33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U_tmp, i64 0, i64 %indvars.iv171, i64 %indvars.iv
  %27 = bitcast float* %arrayidx33 to i32*
  store i32 %26, i32* %27, align 4, !tbaa !2
  %arrayidx41 = getelementptr inbounds [32 x float], [32 x float]* %U, i64 %indvars.iv, i64 %indvars.iv171
  %28 = bitcast float* %arrayidx41 to i32*
  store i32 %26, i32* %28, align 4, !tbaa !2
  br label %for.inc

if.else42:                                        ; preds = %for.body8
  %arrayidx46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U_tmp, i64 0, i64 %indvars.iv171, i64 %4
  %29 = load float, float* %arrayidx46, align 4, !tbaa !2
  %arrayidx50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U_tmp, i64 0, i64 %indvars.iv171, i64 %indvars.iv178
  store float %29, float* %arrayidx50, align 4, !tbaa !2
  %cmp51 = icmp eq i64 %indvars.iv171, %indvars.iv
  br i1 %cmp51, label %if.then52, label %if.else73

if.then52:                                        ; preds = %if.else42
  %30 = load float, float* %arrayidx56, align 4, !tbaa !2
  %div = fdiv float %30, %29
  store float %div, float* %arrayidx64, align 4, !tbaa !2
  store float %div, float* %arrayidx72, align 4, !tbaa !2
  br label %if.end83

if.else73:                                        ; preds = %if.else42
  %31 = add nsw i64 %indvars.iv171, -1
  %arrayidx78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L_tmp, i64 0, i64 %31, i64 %indvars.iv178
  %32 = bitcast float* %arrayidx78 to i32*
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %arrayidx82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L_tmp, i64 0, i64 %indvars.iv171, i64 %indvars.iv178
  %34 = bitcast float* %arrayidx82 to i32*
  store i32 %33, i32* %34, align 4, !tbaa !2
  %35 = bitcast i32 %33 to float
  br label %if.end83

if.end83:                                         ; preds = %if.else73, %if.then52
  %36 = phi float [ %35, %if.else73 ], [ %div, %if.then52 ]
  %mul = fmul float %29, %36
  %sub96 = fsub float %24, %mul
  store float %sub96, float* %arrayidx19, align 4, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %if.then25, %if.end83
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond = icmp eq i64 %indvars.iv.next172, 32
  br i1 %exitcond, label %for.cond.cleanup7, label %for.body8
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #0 {
entry:
  %prev_V.i = alloca [32 x [32 x [32 x float]]], align 16
  %U_tmp.i = alloca [32 x [32 x [32 x float]]], align 16
  %L_tmp.i = alloca [32 x [32 x [32 x float]]], align 16
  %B.i = alloca [32 x [32 x float]], align 16
  %A = alloca [32 x [32 x float]], align 16
  %L = alloca [32 x [32 x float]], align 16
  %0 = bitcast [32 x [32 x float]]* %L to i8*
  %U = alloca [32 x [32 x float]], align 16
  %1 = bitcast [32 x [32 x float]]* %U to i8*
  %L_golden = alloca [32 x [32 x float]], align 16
  %2 = bitcast [32 x [32 x float]]* %L_golden to i8*
  %U_golden = alloca [32 x [32 x float]], align 16
  %3 = bitcast [32 x [32 x float]]* %U_golden to i8*
  %4 = bitcast [32 x [32 x float]]* %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %4) #6
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %0) #6
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %1) #6
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %2) #6
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %3) #6
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.end17.i, %entry
  %indvar181.i = phi i64 [ 0, %entry ], [ %indvar.next182.i, %for.end17.i ]
  %indvars.iv176.i = phi i64 [ 1, %entry ], [ %indvars.iv.next177.i, %for.end17.i ]
  %5 = mul nuw nsw i64 %indvar181.i, 33
  %6 = add nuw nsw i64 %5, 1
  %scevgep183.i = getelementptr [32 x [32 x float]], [32 x [32 x float]]* %A, i64 0, i64 0, i64 %6
  %7 = shl i64 %indvar181.i, 2
  %8 = sub nsw i64 120, %7
  %9 = and i64 %8, 17179869180
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv170.i = phi i64 [ %indvars.iv.next171.i, %for.body3.i ], [ 0, %for.cond1.preheader.i ]
  %10 = trunc i64 %indvars.iv170.i to i32
  %11 = sub i32 0, %10
  %conv.i = sitofp i32 %11 to float
  %div.i = fmul float %conv.i, 3.125000e-02
  %add.i = fadd float %div.i, 1.000000e+00
  %arrayidx5.i = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %A, i64 0, i64 %indvar181.i, i64 %indvars.iv170.i
  store float %add.i, float* %arrayidx5.i, align 4, !tbaa !2
  %indvars.iv.next171.i = add nuw nsw i64 %indvars.iv170.i, 1
  %exitcond175.i = icmp eq i64 %indvars.iv.next171.i, %indvars.iv176.i
  br i1 %exitcond175.i, label %for.end.i, label %for.body3.i

for.end.i:                                        ; preds = %for.body3.i
  %indvar.next182.i = add nuw nsw i64 %indvar181.i, 1
  %cmp8149.i = icmp ult i64 %indvar181.i, 31
  br i1 %cmp8149.i, label %for.body10.preheader.i, label %for.end17.i

for.body10.preheader.i:                           ; preds = %for.end.i
  %12 = add nuw nsw i64 %9, 4
  %scevgep183184.i = bitcast float* %scevgep183.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(1) %scevgep183184.i, i8 0, i64 %12, i1 false) #6
  br label %for.end17.i

for.end17.i:                                      ; preds = %for.body10.preheader.i, %for.end.i
  %arrayidx21.i = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %A, i64 0, i64 %indvar181.i, i64 %indvar181.i
  store float 1.000000e+00, float* %arrayidx21.i, align 4, !tbaa !2
  %indvars.iv.next177.i = add nuw nsw i64 %indvars.iv176.i, 1
  %exitcond185.i = icmp eq i64 %indvar.next182.i, 32
  br i1 %exitcond185.i, label %for.end24.i, label %for.cond1.preheader.i

for.end24.i:                                      ; preds = %for.end17.i
  %arraydecay = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %A, i64 0, i64 0
  %13 = bitcast [32 x [32 x float]]* %B.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %13) #6
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4096) %13, i8 0, i64 4096, i1 false) #6
  br label %for.cond47.preheader.i

for.cond47.preheader.i:                           ; preds = %for.inc74.i, %for.end24.i
  %indvars.iv159.i = phi i64 [ 0, %for.end24.i ], [ %indvars.iv.next160.i, %for.inc74.i ]
  br label %for.cond51.preheader.i

for.cond51.preheader.i:                           ; preds = %for.inc71.i, %for.cond47.preheader.i
  %indvars.iv156.i = phi i64 [ 0, %for.cond47.preheader.i ], [ %indvars.iv.next157.i, %for.inc71.i ]
  %arrayidx58.i = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %A, i64 0, i64 %indvars.iv156.i, i64 %indvars.iv159.i
  %14 = load float, float* %arrayidx58.i, align 4, !tbaa !2
  br label %for.body54.i

for.body54.i:                                     ; preds = %for.body54.i, %for.cond51.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond51.preheader.i ], [ %indvars.iv.next.i, %for.body54.i ]
  %arrayidx62.i = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %A, i64 0, i64 %indvars.iv.i, i64 %indvars.iv159.i
  %15 = load float, float* %arrayidx62.i, align 4, !tbaa !2
  %mul.i = fmul float %14, %15
  %arrayidx66.i = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %B.i, i64 0, i64 %indvars.iv156.i, i64 %indvars.iv.i
  %16 = load float, float* %arrayidx66.i, align 4, !tbaa !2
  %add67.i = fadd float %16, %mul.i
  store float %add67.i, float* %arrayidx66.i, align 4, !tbaa !2
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond155.i = icmp eq i64 %indvars.iv.next.i, 32
  br i1 %exitcond155.i, label %for.inc71.i, label %for.body54.i

for.inc71.i:                                      ; preds = %for.body54.i
  %indvars.iv.next157.i = add nuw nsw i64 %indvars.iv156.i, 1
  %exitcond158.i = icmp eq i64 %indvars.iv.next157.i, 32
  br i1 %exitcond158.i, label %for.inc74.i, label %for.cond51.preheader.i

for.inc74.i:                                      ; preds = %for.inc71.i
  %indvars.iv.next160.i = add nuw nsw i64 %indvars.iv159.i, 1
  %exitcond161.i = icmp eq i64 %indvars.iv.next160.i, 32
  br i1 %exitcond161.i, label %for.cond81.preheader.i, label %for.cond47.preheader.i

for.cond81.preheader.i:                           ; preds = %for.inc74.i, %for.cond81.preheader.i
  %indvar.i = phi i64 [ %indvar.next.i, %for.cond81.preheader.i ], [ 0, %for.inc74.i ]
  %scevgep.i = getelementptr [32 x [32 x float]], [32 x [32 x float]]* %A, i64 0, i64 %indvar.i, i64 0
  %scevgep152.i = bitcast float* %scevgep.i to i8*
  %scevgep153.i = getelementptr [32 x [32 x float]], [32 x [32 x float]]* %B.i, i64 0, i64 %indvar.i, i64 0
  %scevgep153154.i = bitcast float* %scevgep153.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep152.i, i8* nonnull align 16 dereferenceable(128) %scevgep153154.i, i64 128, i1 false) #6
  %indvar.next.i = add nuw nsw i64 %indvar.i, 1
  %exitcond.i = icmp eq i64 %indvar.next.i, 32
  br i1 %exitcond.i, label %init_array.exit, label %for.cond81.preheader.i

init_array.exit:                                  ; preds = %for.cond81.preheader.i
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %13) #6
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4096) %0, i8 0, i64 4096, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4096) %1, i8 0, i64 4096, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4096) %2, i8 0, i64 4096, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4096) %3, i8 0, i64 4096, i1 false)
  %arraydecay23 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L, i64 0, i64 0
  %arraydecay24 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U, i64 0, i64 0
  call void @lu_device([32 x float]* nonnull %arraydecay, [32 x float]* nonnull %arraydecay23, [32 x float]* nonnull %arraydecay24)
  %17 = bitcast [32 x [32 x [32 x float]]]* %prev_V.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 131072, i8* nonnull %17) #6
  %18 = bitcast [32 x [32 x [32 x float]]]* %U_tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 131072, i8* nonnull %18) #6
  %19 = bitcast [32 x [32 x [32 x float]]]* %L_tmp.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 131072, i8* nonnull %19) #6
  br label %for.cond5.preheader.lr.ph.i

for.cond5.preheader.lr.ph.i:                      ; preds = %for.cond.cleanup3.i, %init_array.exit
  %indvars.iv.i322 = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next.i324, %for.cond.cleanup3.i ]
  br label %for.cond5.preheader.us.i

for.cond5.preheader.us.i:                         ; preds = %for.cond5.for.cond.cleanup7_crit_edge.us.i, %for.cond5.preheader.lr.ph.i
  %indvars.iv253.i = phi i64 [ %indvars.iv.next254.i, %for.cond5.for.cond.cleanup7_crit_edge.us.i ], [ %indvars.iv.i322, %for.cond5.preheader.lr.ph.i ]
  %cmp29.us.i = icmp eq i64 %indvars.iv253.i, %indvars.iv.i322
  %20 = add nsw i64 %indvars.iv253.i, -1
  br i1 %cmp29.us.i, label %for.body8.us.us.i, label %for.body8.us221.preheader.i

for.body8.us221.preheader.i:                      ; preds = %for.cond5.preheader.us.i
  %arrayidx84.us237.i = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %L_tmp.i, i64 0, i64 %indvars.iv.i322, i64 %indvars.iv253.i, i64 %indvars.iv.i322
  %arrayidx94.us238.i = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L_golden, i64 0, i64 %indvars.iv.i322, i64 %indvars.iv253.i
  br label %for.body8.us221.i

for.body8.us221.i:                                ; preds = %for.inc.us240.i, %for.body8.us221.preheader.i
  %indvars.iv247.i = phi i64 [ %indvars.iv.i322, %for.body8.us221.preheader.i ], [ %indvars.iv.next248.i, %for.inc.us240.i ]
  %arrayidx12.us224.i = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %prev_V.i, i64 0, i64 %indvars.iv247.i, i64 %indvars.iv253.i, i64 %indvars.iv.i322
  %21 = bitcast float* %arrayidx12.us224.i to i32*
  %22 = load i32, i32* %21, align 4, !tbaa !2
  %arrayidx18.us225.i = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %U_tmp.i, i64 0, i64 %indvars.iv247.i, i64 %indvars.iv253.i, i64 %indvars.iv.i322
  %23 = bitcast float* %arrayidx18.us225.i to i32*
  %arrayidx28.us226.i = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U_golden, i64 0, i64 %indvars.iv253.i, i64 %indvars.iv247.i
  %24 = bitcast float* %arrayidx28.us226.i to i32*
  store i32 %22, i32* %24, align 4, !tbaa !2
  %arrayidx57.us228.i = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %U_tmp.i, i64 0, i64 %indvars.iv247.i, i64 %20, i64 %indvars.iv.i322
  %25 = bitcast float* %arrayidx57.us228.i to i32*
  %26 = load i32, i32* %25, align 4, !tbaa !2
  store i32 %26, i32* %23, align 4, !tbaa !2
  %cmp64.us229.i = icmp eq i64 %indvars.iv247.i, %indvars.iv.i322
  br i1 %cmp64.us229.i, label %if.then65.us235.i, label %if.else95.us230.i

if.else95.us230.i:                                ; preds = %for.body8.us221.i
  %27 = add nsw i64 %indvars.iv247.i, -1
  %arrayidx102.us233.i = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %L_tmp.i, i64 0, i64 %27, i64 %indvars.iv253.i, i64 %indvars.iv.i322
  %28 = bitcast float* %arrayidx102.us233.i to i32*
  %29 = load i32, i32* %28, align 4, !tbaa !2
  %arrayidx108.us234.i = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %L_tmp.i, i64 0, i64 %indvars.iv247.i, i64 %indvars.iv253.i, i64 %indvars.iv.i322
  %30 = bitcast float* %arrayidx108.us234.i to i32*
  store i32 %29, i32* %30, align 4, !tbaa !2
  br label %for.inc.us240.i

if.then65.us235.i:                                ; preds = %for.body8.us221.i
  %31 = bitcast i32 %26 to float
  %32 = bitcast i32 %22 to float
  %div.us236.i = fdiv float %32, %31
  store float %div.us236.i, float* %arrayidx84.us237.i, align 4, !tbaa !2
  store float %div.us236.i, float* %arrayidx94.us238.i, align 4, !tbaa !2
  br label %for.inc.us240.i

for.inc.us240.i:                                  ; preds = %if.then65.us235.i, %if.else95.us230.i
  %indvars.iv.next248.i = add nuw nsw i64 %indvars.iv247.i, 1
  %exitcond.i323 = icmp eq i64 %indvars.iv.next248.i, 32
  br i1 %exitcond.i323, label %for.cond5.for.cond.cleanup7_crit_edge.us.i, label %for.body8.us221.i

for.cond5.for.cond.cleanup7_crit_edge.us.i:       ; preds = %for.inc.us240.i, %for.body8.us.us.i
  %indvars.iv.next254.i = add nuw nsw i64 %indvars.iv253.i, 1
  %exitcond256.i = icmp eq i64 %indvars.iv.next254.i, 32
  br i1 %exitcond256.i, label %for.cond.cleanup3.i, label %for.cond5.preheader.us.i

for.body8.us.us.i:                                ; preds = %for.cond5.preheader.us.i, %for.body8.us.us.i
  %indvars.iv250.i = phi i64 [ %indvars.iv.next251.i, %for.body8.us.us.i ], [ %indvars.iv.i322, %for.cond5.preheader.us.i ]
  %arrayidx12.us.us.i = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %prev_V.i, i64 0, i64 %indvars.iv250.i, i64 %indvars.iv.i322, i64 %indvars.iv.i322
  %33 = bitcast float* %arrayidx12.us.us.i to i32*
  %34 = load i32, i32* %33, align 4, !tbaa !2
  %arrayidx18.us.us.i = getelementptr inbounds [32 x [32 x [32 x float]]], [32 x [32 x [32 x float]]]* %U_tmp.i, i64 0, i64 %indvars.iv250.i, i64 %indvars.iv.i322, i64 %indvars.iv.i322
  %35 = bitcast float* %arrayidx18.us.us.i to i32*
  %arrayidx28.us.us.i = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U_golden, i64 0, i64 %indvars.iv.i322, i64 %indvars.iv250.i
  %36 = bitcast float* %arrayidx28.us.us.i to i32*
  store i32 %34, i32* %35, align 4, !tbaa !2
  store i32 %34, i32* %36, align 4, !tbaa !2
  %indvars.iv.next251.i = add nuw nsw i64 %indvars.iv250.i, 1
  %exitcond252.i = icmp eq i64 %indvars.iv.next251.i, 32
  br i1 %exitcond252.i, label %for.cond5.for.cond.cleanup7_crit_edge.us.i, label %for.body8.us.us.i

for.cond.cleanup3.i:                              ; preds = %for.cond5.for.cond.cleanup7_crit_edge.us.i
  %indvars.iv.next.i324 = add nuw nsw i64 %indvars.iv.i322, 1
  %exitcond257.i = icmp eq i64 %indvars.iv.next.i324, 32
  br i1 %exitcond257.i, label %lu_cpu.exit, label %for.cond5.preheader.lr.ph.i

lu_cpu.exit:                                      ; preds = %for.cond.cleanup3.i
  call void @llvm.lifetime.end.p0i8(i64 131072, i8* nonnull %19) #6
  call void @llvm.lifetime.end.p0i8(i64 131072, i8* nonnull %18) #6
  call void @llvm.lifetime.end.p0i8(i64 131072, i8* nonnull %17) #6
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond.cleanup36, %lu_cpu.exit
  %indvars.iv392 = phi i64 [ 0, %lu_cpu.exit ], [ %indvars.iv.next393, %for.cond.cleanup36 ]
  %indvars.iv390 = phi i64 [ 1, %lu_cpu.exit ], [ %indvars.iv.next391, %for.cond.cleanup36 ]
  %err.0347 = phi i32 [ 0, %lu_cpu.exit ], [ %err.2, %for.cond.cleanup36 ]
  br label %for.body37

for.cond.cleanup36:                               ; preds = %for.body37
  %indvars.iv.next393 = add nuw nsw i64 %indvars.iv392, 1
  %indvars.iv.next391 = add nuw nsw i64 %indvars.iv390, 1
  %exitcond394 = icmp eq i64 %indvars.iv.next393, 32
  br i1 %exitcond394, label %for.body66.lr.ph, label %for.cond34.preheader

for.body37:                                       ; preds = %for.body37, %for.cond34.preheader
  %indvars.iv385 = phi i64 [ %indvars.iv.next386, %for.body37 ], [ 0, %for.cond34.preheader ]
  %err.1345 = phi i32 [ %err.2, %for.body37 ], [ %err.0347, %for.cond34.preheader ]
  %arrayidx41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L_golden, i64 0, i64 %indvars.iv392, i64 %indvars.iv385
  %37 = load float, float* %arrayidx41, align 4, !tbaa !2
  %arrayidx45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L, i64 0, i64 %indvars.iv392, i64 %indvars.iv385
  %38 = load float, float* %arrayidx45, align 4, !tbaa !2
  %sub = fsub float %37, %38
  %39 = tail call float @llvm.fabs.f32(float %sub)
  %40 = fpext float %39 to double
  %cmp46 = fcmp ogt double %40, 1.000000e-03
  %inc48 = zext i1 %cmp46 to i32
  %err.2 = add nsw i32 %err.1345, %inc48
  %indvars.iv.next386 = add nuw nsw i64 %indvars.iv385, 1
  %exitcond389 = icmp eq i64 %indvars.iv.next386, %indvars.iv390
  br i1 %exitcond389, label %for.cond.cleanup36, label %for.body37

for.body66.lr.ph:                                 ; preds = %for.cond.cleanup36, %for.cond.cleanup65
  %indvars.iv379 = phi i64 [ %indvars.iv.next380, %for.cond.cleanup65 ], [ 0, %for.cond.cleanup36 ]
  %err.3342 = phi i32 [ %err.5, %for.cond.cleanup65 ], [ %err.2, %for.cond.cleanup36 ]
  br label %for.body66

for.cond.cleanup59:                               ; preds = %for.cond.cleanup65
  %tobool = icmp eq i32 %err.5, 0
  br i1 %tobool, label %if.else, label %if.then88

for.cond.cleanup65:                               ; preds = %for.body66
  %indvars.iv.next380 = add nuw nsw i64 %indvars.iv379, 1
  %exitcond384 = icmp eq i64 %indvars.iv.next380, 32
  br i1 %exitcond384, label %for.cond.cleanup59, label %for.body66.lr.ph

for.body66:                                       ; preds = %for.body66, %for.body66.lr.ph
  %indvars.iv381 = phi i64 [ %indvars.iv379, %for.body66.lr.ph ], [ %indvars.iv.next382, %for.body66 ]
  %err.4340 = phi i32 [ %err.3342, %for.body66.lr.ph ], [ %err.5, %for.body66 ]
  %arrayidx70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U_golden, i64 0, i64 %indvars.iv379, i64 %indvars.iv381
  %41 = load float, float* %arrayidx70, align 4, !tbaa !2
  %arrayidx74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U, i64 0, i64 %indvars.iv379, i64 %indvars.iv381
  %42 = load float, float* %arrayidx74, align 4, !tbaa !2
  %sub75 = fsub float %41, %42
  %43 = tail call float @llvm.fabs.f32(float %sub75)
  %44 = fpext float %43 to double
  %cmp77 = fcmp ogt double %44, 1.000000e-03
  %inc80 = zext i1 %cmp77 to i32
  %err.5 = add nsw i32 %err.4340, %inc80
  %indvars.iv.next382 = add nuw nsw i64 %indvars.iv381, 1
  %exitcond383 = icmp eq i64 %indvars.iv.next382, 32
  br i1 %exitcond383, label %for.cond.cleanup65, label %for.body66

if.then88:                                        ; preds = %for.cond.cleanup59
  %call = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), i32 %err.5)
  br label %if.end90

if.else:                                          ; preds = %for.cond.cleanup59
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @str, i64 0, i64 0))
  br label %if.end90

if.end90:                                         ; preds = %if.else, %if.then88
  %puts313 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @str.9, i64 0, i64 0))
  br label %for.cond99.preheader

for.cond99.preheader:                             ; preds = %for.cond.cleanup102, %if.end90
  %indvars.iv376 = phi i64 [ 0, %if.end90 ], [ %indvars.iv.next377, %for.cond.cleanup102 ]
  br label %for.body103

for.cond.cleanup96:                               ; preds = %for.cond.cleanup102
  %puts314 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @str.10, i64 0, i64 0))
  br label %for.cond125.preheader

for.cond.cleanup102:                              ; preds = %for.body103
  %putchar321 = tail call i32 @putchar(i32 10)
  %indvars.iv.next377 = add nuw nsw i64 %indvars.iv376, 1
  %exitcond378 = icmp eq i64 %indvars.iv.next377, 32
  br i1 %exitcond378, label %for.cond.cleanup96, label %for.cond99.preheader

for.body103:                                      ; preds = %for.body103, %for.cond99.preheader
  %indvars.iv373 = phi i64 [ 0, %for.cond99.preheader ], [ %indvars.iv.next374, %for.body103 ]
  %arrayidx107 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %A, i64 0, i64 %indvars.iv376, i64 %indvars.iv373
  %45 = load float, float* %arrayidx107, align 4, !tbaa !2
  %conv108 = fpext float %45 to double
  %call109 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), double %conv108)
  %indvars.iv.next374 = add nuw nsw i64 %indvars.iv373, 1
  %exitcond375 = icmp eq i64 %indvars.iv.next374, 32
  br i1 %exitcond375, label %for.cond.cleanup102, label %for.body103

for.cond125.preheader:                            ; preds = %for.cond.cleanup128, %for.cond.cleanup96
  %indvars.iv370 = phi i64 [ 0, %for.cond.cleanup96 ], [ %indvars.iv.next371, %for.cond.cleanup128 ]
  br label %for.body129

for.cond.cleanup122:                              ; preds = %for.cond.cleanup128
  %puts315 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @str.11, i64 0, i64 0))
  br label %for.cond153.preheader

for.cond.cleanup128:                              ; preds = %cond.end
  %putchar320 = tail call i32 @putchar(i32 10)
  %indvars.iv.next371 = add nuw nsw i64 %indvars.iv370, 1
  %exitcond372 = icmp eq i64 %indvars.iv.next371, 32
  br i1 %exitcond372, label %for.cond.cleanup122, label %for.cond125.preheader

for.body129:                                      ; preds = %cond.end, %for.cond125.preheader
  %indvars.iv367 = phi i64 [ 0, %for.cond125.preheader ], [ %indvars.iv.next368, %cond.end ]
  %cmp130 = icmp eq i64 %indvars.iv370, %indvars.iv367
  br i1 %cmp130, label %cond.end, label %cond.false

cond.false:                                       ; preds = %for.body129
  %arrayidx135 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L_golden, i64 0, i64 %indvars.iv367, i64 %indvars.iv370
  %46 = load float, float* %arrayidx135, align 4, !tbaa !2
  %conv136 = fpext float %46 to double
  br label %cond.end

cond.end:                                         ; preds = %for.body129, %cond.false
  %cond = phi double [ %conv136, %cond.false ], [ 1.000000e+00, %for.body129 ]
  %call137 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), double %cond)
  %indvars.iv.next368 = add nuw nsw i64 %indvars.iv367, 1
  %exitcond369 = icmp eq i64 %indvars.iv.next368, 32
  br i1 %exitcond369, label %for.cond.cleanup128, label %for.body129

for.cond153.preheader:                            ; preds = %for.cond.cleanup156, %for.cond.cleanup122
  %indvars.iv364 = phi i64 [ 0, %for.cond.cleanup122 ], [ %indvars.iv.next365, %for.cond.cleanup156 ]
  br label %for.body157

for.cond.cleanup150:                              ; preds = %for.cond.cleanup156
  %puts316 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @str.12, i64 0, i64 0))
  br label %for.cond179.preheader

for.cond.cleanup156:                              ; preds = %for.body157
  %putchar319 = tail call i32 @putchar(i32 10)
  %indvars.iv.next365 = add nuw nsw i64 %indvars.iv364, 1
  %exitcond366 = icmp eq i64 %indvars.iv.next365, 32
  br i1 %exitcond366, label %for.cond.cleanup150, label %for.cond153.preheader

for.body157:                                      ; preds = %for.body157, %for.cond153.preheader
  %indvars.iv361 = phi i64 [ 0, %for.cond153.preheader ], [ %indvars.iv.next362, %for.body157 ]
  %arrayidx161 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U_golden, i64 0, i64 %indvars.iv364, i64 %indvars.iv361
  %47 = load float, float* %arrayidx161, align 4, !tbaa !2
  %conv162 = fpext float %47 to double
  %call163 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), double %conv162)
  %indvars.iv.next362 = add nuw nsw i64 %indvars.iv361, 1
  %exitcond363 = icmp eq i64 %indvars.iv.next362, 32
  br i1 %exitcond363, label %for.cond.cleanup156, label %for.body157

for.cond179.preheader:                            ; preds = %for.cond.cleanup182, %for.cond.cleanup150
  %indvars.iv358 = phi i64 [ 0, %for.cond.cleanup150 ], [ %indvars.iv.next359, %for.cond.cleanup182 ]
  br label %for.body183

for.cond.cleanup176:                              ; preds = %for.cond.cleanup182
  %puts317 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @str.13, i64 0, i64 0))
  br label %for.cond217.preheader

for.cond.cleanup182:                              ; preds = %cond.end199
  %putchar318 = tail call i32 @putchar(i32 10)
  %indvars.iv.next359 = add nuw nsw i64 %indvars.iv358, 1
  %exitcond360 = icmp eq i64 %indvars.iv.next359, 32
  br i1 %exitcond360, label %for.cond.cleanup176, label %for.cond179.preheader

for.body183:                                      ; preds = %cond.end199, %for.cond179.preheader
  %indvars.iv355 = phi i64 [ 0, %for.cond179.preheader ], [ %indvars.iv.next356, %cond.end199 ]
  %cmp184 = icmp eq i64 %indvars.iv358, %indvars.iv355
  br i1 %cmp184, label %cond.end199, label %cond.false187

cond.false187:                                    ; preds = %for.body183
  %cmp188 = icmp ult i64 %indvars.iv355, %indvars.iv358
  br i1 %cmp188, label %cond.true190, label %cond.end199

cond.true190:                                     ; preds = %cond.false187
  %arrayidx194 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %L, i64 0, i64 %indvars.iv355, i64 %indvars.iv358
  %48 = load float, float* %arrayidx194, align 4, !tbaa !2
  %conv195 = fpext float %48 to double
  br label %cond.end199

cond.end199:                                      ; preds = %cond.true190, %cond.false187, %for.body183
  %cond200 = phi double [ 1.000000e+00, %for.body183 ], [ %conv195, %cond.true190 ], [ 0.000000e+00, %cond.false187 ]
  %call201 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), double %cond200)
  %indvars.iv.next356 = add nuw nsw i64 %indvars.iv355, 1
  %exitcond357 = icmp eq i64 %indvars.iv.next356, 32
  br i1 %exitcond357, label %for.cond.cleanup182, label %for.body183

for.cond217.preheader:                            ; preds = %for.cond.cleanup220, %for.cond.cleanup176
  %indvars.iv352 = phi i64 [ 0, %for.cond.cleanup176 ], [ %indvars.iv.next353, %for.cond.cleanup220 ]
  br label %for.body221

for.cond.cleanup214:                              ; preds = %for.cond.cleanup220
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %3) #6
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %2) #6
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %1) #6
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %0) #6
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %4) #6
  ret i32 0

for.cond.cleanup220:                              ; preds = %cond.end231
  %putchar = tail call i32 @putchar(i32 10)
  %indvars.iv.next353 = add nuw nsw i64 %indvars.iv352, 1
  %exitcond354 = icmp eq i64 %indvars.iv.next353, 32
  br i1 %exitcond354, label %for.cond.cleanup214, label %for.cond217.preheader

for.body221:                                      ; preds = %cond.end231, %for.cond217.preheader
  %indvars.iv = phi i64 [ 0, %for.cond217.preheader ], [ %indvars.iv.next, %cond.end231 ]
  %cmp222 = icmp ult i64 %indvars.iv, %indvars.iv352
  br i1 %cmp222, label %cond.end231, label %cond.false225

cond.false225:                                    ; preds = %for.body221
  %arrayidx229 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]]* %U, i64 0, i64 %indvars.iv352, i64 %indvars.iv
  %49 = load float, float* %arrayidx229, align 4, !tbaa !2
  %conv230 = fpext float %49 to double
  br label %cond.end231

cond.end231:                                      ; preds = %for.body221, %cond.false225
  %cond232 = phi double [ %conv230, %cond.false225 ], [ 0.000000e+00, %for.body221 ]
  %call233 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), double %cond232)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond, label %for.cond.cleanup220, label %for.body221
}

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare i32 @putchar(i32) local_unnamed_addr #4

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"float", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
