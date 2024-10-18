; ModuleID = 'dtw.bc'
source_filename = "dtw.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@S = dso_local local_unnamed_addr global [513 x i32] zeroinitializer, align 16
@T = dso_local local_unnamed_addr global [513 x i32] zeroinitializer, align 16
@DTW = dso_local local_unnamed_addr global [514 x [514 x i32]] zeroinitializer, align 16
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@__const._Z8get_dataiPPiS0_.filename_std = private unnamed_addr constant <{ [19 x i8], [237 x i8] }> <{ [19 x i8] c"input_dtw/input_std", [237 x i8] zeroinitializer }>, align 16
@__const._Z8get_dataiPPiS0_.filename_smp = private unnamed_addr constant <{ [19 x i8], [237 x i8] }> <{ [19 x i8] c"input_dtw/input_smp", [237 x i8] zeroinitializer }>, align 16
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"\0Acannot open file \22%s\22.\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"%f,%f\00", align 1
@.str.4 = private unnamed_addr constant [52 x i8] c"================= next, DTW variation==============\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_dtw.cpp, i8* null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @_Z7minimumiii(i32 %a, i32 %b, i32 %c) local_unnamed_addr #3 {
entry:
  %cmp = icmp slt i32 %a, %b
  %a.b = select i1 %cmp, i32 %a, i32 %b
  %cmp1 = icmp sgt i32 %a.b, %c
  %min.1 = select i1 %cmp1, i32 %c, i32 %a.b
  ret i32 %min.1
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @_Z7minimumii(i32 %a, i32 %b) local_unnamed_addr #3 {
entry:
  %cmp = icmp slt i32 %a, %b
  %a.b = select i1 %cmp, i32 %a, i32 %b
  ret i32 %a.b
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @_Z7maximumiii(i32 %a, i32 %b, i32 %c) local_unnamed_addr #3 {
entry:
  %cmp = icmp slt i32 %a, %b
  %b.a = select i1 %cmp, i32 %b, i32 %a
  %cmp1 = icmp slt i32 %b.a, %c
  %max.1 = select i1 %cmp1, i32 %c, i32 %b.a
  ret i32 %max.1
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @_Z7maximumii(i32 %a, i32 %b) local_unnamed_addr #3 {
entry:
  %cmp = icmp slt i32 %a, %b
  %b.a = select i1 %cmp, i32 %b, i32 %a
  ret i32 %b.a
}

; Function Attrs: uwtable
define dso_local void @_Z6outputv() local_unnamed_addr #5 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %_ZNKSt5ctypeIcE5widenEc.exit, %entry
  %indvars.iv31 = phi i64 [ 0, %entry ], [ %indvars.iv.next32, %_ZNKSt5ctypeIcE5widenEc.exit ]
  br label %for.body4

for.cond.cleanup:                                 ; preds = %_ZNKSt5ctypeIcE5widenEc.exit
  ret void

for.cond.cleanup3:                                ; preds = %for.body4
  %arrayidx7 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv31, i64 513
  %0 = load i32, i32* %arrayidx7, align 4, !tbaa !2
  %call = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i32 %0)
  %call1.i21 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i64 1)
  %vtable.i = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %1 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %1, align 8
  %_M_ctype.i = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_streambuf"** getelementptr inbounds (%"class.std::basic_ostream", %"class.std::basic_ostream"* @_ZSt4cout, i64 0, i32 1, i32 4) to i8*), i64 %vbase.offset.i
  %2 = bitcast i8* %_M_ctype.i to %"class.std::ctype"**
  %3 = load %"class.std::ctype"*, %"class.std::ctype"** %2, align 8, !tbaa !8
  %tobool.i25 = icmp eq %"class.std::ctype"* %3, null
  br i1 %tobool.i25, label %if.then.i26, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

if.then.i26:                                      ; preds = %for.cond.cleanup3
  tail call void @_ZSt16__throw_bad_castv() #12
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %for.cond.cleanup3
  %_M_widen_ok.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %3, i64 0, i32 8
  %4 = load i8, i8* %_M_widen_ok.i, align 8, !tbaa !12
  %tobool.i = icmp eq i8 %4, 0
  br i1 %tobool.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %arrayidx.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %3, i64 0, i32 9, i64 10
  %5 = load i8, i8* %arrayidx.i, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit

if.end.i:                                         ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %3)
  %6 = bitcast %"class.std::ctype"* %3 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i23 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %6, align 8, !tbaa !6
  %vfn.i = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vtable.i23, i64 6
  %7 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vfn.i, align 8
  %call.i24 = tail call signext i8 %7(%"class.std::ctype"* nonnull %3, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %if.then.i, %if.end.i
  %retval.0.i = phi i8 [ %5, %if.then.i ], [ %call.i24, %if.end.i ]
  %call1.i = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %retval.0.i)
  %call.i = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %call1.i)
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 514
  br i1 %exitcond33, label %for.cond.cleanup, label %for.cond1.preheader

for.body4:                                        ; preds = %for.body4, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body4 ]
  %cmp5 = icmp eq i64 %indvars.iv, 513
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %cmp5, label %for.cond.cleanup3, label %for.body4
}

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) local_unnamed_addr #0

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @_Z8absolutei(i32 %v) local_unnamed_addr #3 {
entry:
  %cmp = icmp slt i32 %v, 0
  %sub = sub nsw i32 0, %v
  %spec.select = select i1 %cmp, i32 %sub, i32 %v
  ret i32 %spec.select
}

; Function Attrs: uwtable
define dso_local void @_Z8get_dataiPPiS0_(i32 %len, i32** nocapture %sa, i32** nocapture %ta) local_unnamed_addr #5 {
entry:
  %filename_std = alloca [256 x i8], align 16
  %filename_smp = alloca [256 x i8], align 16
  %t = alloca float, align 4
  %ign = alloca float, align 4
  %0 = getelementptr inbounds [256 x i8], [256 x i8]* %filename_std, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %0) #13
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(256) %0, i8* nonnull align 16 dereferenceable(256) getelementptr inbounds (<{ [19 x i8], [237 x i8] }>, <{ [19 x i8], [237 x i8] }>* @__const._Z8get_dataiPPiS0_.filename_std, i64 0, i32 0, i64 0), i64 256, i1 false)
  %1 = getelementptr inbounds [256 x i8], [256 x i8]* %filename_smp, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %1) #13
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(256) %1, i8* nonnull align 16 dereferenceable(256) getelementptr inbounds (<{ [19 x i8], [237 x i8] }>, <{ [19 x i8], [237 x i8] }>* @__const._Z8get_dataiPPiS0_.filename_smp, i64 0, i32 0, i64 0), i64 256, i1 false)
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %filename_std, i64 0, i64 19
  store i8 0, i8* %arrayidx, align 1, !tbaa !14
  %call = call noalias %struct._IO_FILE* @fopen(i8* nonnull %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  %cmp = icmp eq %struct._IO_FILE* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i64 0, i64 0), i8* nonnull %0)
  call void @exit(i32 1) #14
  unreachable

if.end:                                           ; preds = %entry
  %conv = sext i32 %len to i64
  %mul = shl nsw i64 %conv, 2
  %call3 = tail call noalias i8* @malloc(i64 %mul) #13
  %2 = bitcast float* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #13
  store float 0.000000e+00, float* %t, align 4, !tbaa !15
  %3 = bitcast float* %ign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #13
  store float 0.000000e+00, float* %ign, align 4, !tbaa !15
  %tobool47 = icmp eq i32 %len, 0
  br i1 %tobool47, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %if.end
  %4 = bitcast i8* %call3 to i32*
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %p.049 = phi i32* [ %incdec.ptr, %while.body ], [ %4, %while.body.preheader ]
  %len.addr.048 = phi i32 [ %dec, %while.body ], [ %len, %while.body.preheader ]
  %dec = add nsw i32 %len.addr.048, -1
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* nonnull %call, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), float* nonnull %t, float* nonnull %ign)
  %5 = load float, float* %t, align 4, !tbaa !15
  %conv5 = fptosi float %5 to i32
  store i32 %conv5, i32* %p.049, align 4, !tbaa !2
  %incdec.ptr = getelementptr inbounds i32, i32* %p.049, i64 1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %if.end
  %call6 = call i32 @fclose(%struct._IO_FILE* nonnull %call)
  %6 = bitcast i32** %sa to i8**
  store i8* %call3, i8** %6, align 8, !tbaa !17
  %call8 = call noalias %struct._IO_FILE* @fopen(i8* nonnull %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  %cmp9 = icmp eq %struct._IO_FILE* %call8, null
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %while.end
  %call12 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i64 0, i64 0), i8* nonnull %1)
  call void @exit(i32 1) #14
  unreachable

if.end13:                                         ; preds = %while.end
  %call16 = call noalias i8* @malloc(i64 %mul) #13
  store float 0.000000e+00, float* %t, align 4, !tbaa !15
  store float 0.000000e+00, float* %ign, align 4, !tbaa !15
  br i1 %tobool47, label %while.end24, label %while.body20.preheader

while.body20.preheader:                           ; preds = %if.end13
  %7 = bitcast i8* %call16 to i32*
  br label %while.body20

while.body20:                                     ; preds = %while.body20.preheader, %while.body20
  %p.146 = phi i32* [ %incdec.ptr23, %while.body20 ], [ %7, %while.body20.preheader ]
  %len.addr.145 = phi i32 [ %dec18, %while.body20 ], [ %len, %while.body20.preheader ]
  %dec18 = add nsw i32 %len.addr.145, -1
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* nonnull %call8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), float* nonnull %t, float* nonnull %ign)
  %8 = load float, float* %t, align 4, !tbaa !15
  %conv22 = fptosi float %8 to i32
  store i32 %conv22, i32* %p.146, align 4, !tbaa !2
  %incdec.ptr23 = getelementptr inbounds i32, i32* %p.146, i64 1
  %tobool19 = icmp eq i32 %dec18, 0
  br i1 %tobool19, label %while.end24, label %while.body20

while.end24:                                      ; preds = %while.body20, %if.end13
  %call25 = call i32 @fclose(%struct._IO_FILE* nonnull %call8)
  %9 = bitcast i32** %ta to i8**
  store i8* %call16, i8** %9, align 8, !tbaa !17
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #13
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #13
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %1) #13
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %0) #13
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nofree nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #6

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #6

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define dso_local void @_Z10initializeb(i1 zeroext %hasW) local_unnamed_addr #8 {
entry:
  %temp_s = alloca [513 x i32], align 16
  %0 = bitcast [513 x i32]* %temp_s to i8*
  %temp_t = alloca [513 x i32], align 16
  %1 = bitcast [513 x i32]* %temp_t to i8*
  call void @llvm.lifetime.start.p0i8(i64 2052, i8* nonnull %0) #13
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %entry ], [ %vec.ind.next, %vector.body ]
  %2 = getelementptr inbounds [513 x i32], [513 x i32]* %temp_s, i64 0, i64 %index
  %3 = trunc <4 x i64> %vec.ind to <4 x i32>
  %4 = add <4 x i32> %3, <i32 1, i32 1, i32 1, i32 1>
  %5 = bitcast i32* %2 to <4 x i32>*
  store <4 x i32> %4, <4 x i32>* %5, align 16, !tbaa !2
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %6 = icmp eq i64 %index.next, 512
  br i1 %6, label %for.body, label %vector.body, !llvm.loop !18

for.body:                                         ; preds = %vector.body, %for.body
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %for.body ], [ 512, %vector.body ]
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %arrayidx = getelementptr inbounds [513 x i32], [513 x i32]* %temp_s, i64 0, i64 %indvars.iv177
  %7 = trunc i64 %indvars.iv.next178 to i32
  store i32 %7, i32* %arrayidx, align 4, !tbaa !2
  %exitcond179 = icmp eq i64 %indvars.iv.next178, 513
  br i1 %exitcond179, label %for.body5.preheader, label %for.body, !llvm.loop !20

for.body5.preheader:                              ; preds = %for.body
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(2052) bitcast ([513 x i32]* @S to i8*), i8* nonnull align 16 dereferenceable(2052) %0, i64 2052, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 2052, i8* nonnull %1) #13
  br label %vector.body182

vector.body182:                                   ; preds = %vector.body182, %for.body5.preheader
  %index184 = phi i64 [ 0, %for.body5.preheader ], [ %index.next185, %vector.body182 ]
  %vec.ind190 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.body5.preheader ], [ %vec.ind.next191, %vector.body182 ]
  %8 = getelementptr inbounds [513 x i32], [513 x i32]* %temp_t, i64 0, i64 %index184
  %9 = add <4 x i32> %vec.ind190, <i32 3, i32 3, i32 3, i32 3>
  %10 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> %9, <4 x i32>* %10, align 16, !tbaa !2
  %index.next185 = add i64 %index184, 4
  %vec.ind.next191 = add <4 x i32> %vec.ind190, <i32 4, i32 4, i32 4, i32 4>
  %11 = icmp eq i64 %index.next185, 512
  br i1 %11, label %for.body17, label %vector.body182, !llvm.loop !22

for.body17:                                       ; preds = %vector.body182, %for.body17
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %for.body17 ], [ 512, %vector.body182 ]
  %arrayidx20 = getelementptr inbounds [513 x i32], [513 x i32]* %temp_t, i64 0, i64 %indvars.iv170
  %12 = trunc i64 %indvars.iv170 to i32
  %13 = add i32 %12, 3
  store i32 %13, i32* %arrayidx20, align 4, !tbaa !2
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %exitcond173 = icmp eq i64 %indvars.iv.next171, 513
  br i1 %exitcond173, label %for.body27.preheader, label %for.body17, !llvm.loop !23

for.body27.preheader:                             ; preds = %for.body17
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(2052) bitcast ([513 x i32]* @T to i8*), i8* nonnull align 16 dereferenceable(2052) %1, i64 2052, i1 false)
  br label %for.cond41.preheader

for.cond41.preheader:                             ; preds = %for.cond41.preheader, %for.body27.preheader
  %indvar = phi i64 [ 0, %for.body27.preheader ], [ %14, %for.cond41.preheader ]
  %14 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %14, i64 1
  %scevgep165 = bitcast i32* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(2052) %scevgep165, i8 -1, i64 2052, i1 false)
  %exitcond166 = icmp eq i64 %14, 513
  br i1 %exitcond166, label %for.body59, label %for.cond41.preheader

for.cond69.preheader:                             ; preds = %for.body59
  %15 = load i32, i32* getelementptr inbounds ([513 x i32], [513 x i32]* @S, i64 0, i64 0), align 16, !tbaa !2
  br label %for.body72

for.body59:                                       ; preds = %for.cond41.preheader, %for.body59
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %for.body59 ], [ 1, %for.cond41.preheader ]
  %arrayidx62 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv159, i64 0
  store i32 65535, i32* %arrayidx62, align 8, !tbaa !2
  %arrayidx64 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 0, i64 %indvars.iv159
  store i32 65535, i32* %arrayidx64, align 4, !tbaa !2
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next160, 514
  br i1 %exitcond161, label %for.cond69.preheader, label %for.body59

for.cond.cleanup71:                               ; preds = %for.body72
  br i1 %hasW, label %vector.ph195, label %if.end

for.body72:                                       ; preds = %for.body72, %for.cond69.preheader
  %indvars.iv155 = phi i64 [ 1, %for.cond69.preheader ], [ %indvars.iv.next156, %for.body72 ]
  %arrayidx75 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv155, i64 1
  store i32 65535, i32* %arrayidx75, align 4, !tbaa !2
  %16 = add nsw i64 %indvars.iv155, -1
  %arrayidx77 = getelementptr inbounds [513 x i32], [513 x i32]* @T, i64 0, i64 %16
  %17 = load i32, i32* %arrayidx77, align 4, !tbaa !2
  %sub78 = sub nsw i32 %15, %17
  %cmp.i = icmp slt i32 %sub78, 0
  %sub.i = sub nsw i32 0, %sub78
  %spec.select.i = select i1 %cmp.i, i32 %sub.i, i32 %sub78
  %arrayidx80 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 1, i64 %indvars.iv155
  store i32 %spec.select.i, i32* %arrayidx80, align 4, !tbaa !2
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond158 = icmp eq i64 %indvars.iv.next156, 514
  br i1 %exitcond158, label %for.cond.cleanup71, label %for.body72

vector.ph195:                                     ; preds = %for.cond.cleanup71, %for.cond.cleanup93
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %for.cond.cleanup93 ], [ 0, %for.cond.cleanup71 ]
  br label %vector.body194

vector.body194:                                   ; preds = %vector.body194, %vector.ph195
  %index196 = phi i64 [ 0, %vector.ph195 ], [ %index.next197, %vector.body194 ]
  %18 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv152, i64 %index196
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 65535, i32 65535, i32 65535, i32 65535>, <4 x i32>* %19, align 8, !tbaa !2
  %index.next197 = add i64 %index196, 4
  %20 = icmp eq i64 %index.next197, 512
  br i1 %20, label %for.body94, label %vector.body194, !llvm.loop !24

for.cond.cleanup93:                               ; preds = %for.body94
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next153, 514
  br i1 %exitcond154, label %if.end, label %vector.ph195

for.body94:                                       ; preds = %vector.body194, %for.body94
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body94 ], [ 512, %vector.body194 ]
  %arrayidx98 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv152, i64 %indvars.iv
  store i32 65535, i32* %arrayidx98, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 514
  br i1 %exitcond, label %for.cond.cleanup93, label %for.body94, !llvm.loop !25

if.end:                                           ; preds = %for.cond.cleanup93, %for.cond.cleanup71
  store i32 0, i32* getelementptr inbounds ([514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 0, i64 0), align 16, !tbaa !2
  call void @llvm.lifetime.end.p0i8(i64 2052, i8* nonnull %1) #13
  call void @llvm.lifetime.end.p0i8(i64 2052, i8* nonnull %0) #13
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @_Z6kerneli(i32 %id) local_unnamed_addr #9 {
entry:
  %mul = shl nsw i32 %id, 9
  %add = or i32 %mul, 1
  %0 = sext i32 %mul to i64
  %1 = sext i32 %add to i64
  %2 = or i32 %mul, 2
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %entry
  %indvars.iv67 = phi i64 [ 1, %entry ], [ %indvars.iv.next68, %for.cond.cleanup3 ]
  %arrayidx = getelementptr inbounds [513 x i32], [513 x i32]* @S, i64 0, i64 %indvars.iv67
  %3 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %4 = add nsw i64 %indvars.iv67, -1
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %5 = icmp sgt i32 %2, 2147483136
  br i1 %5, label %for.body4, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader
  %broadcast.splatinsert72 = insertelement <4 x i32> undef, i32 %3, i32 0
  %broadcast.splat73 = shufflevector <4 x i32> %broadcast.splatinsert72, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %6 = add nsw i64 %index, %1
  %7 = getelementptr inbounds [513 x i32], [513 x i32]* @T, i64 0, i64 %6
  %8 = bitcast i32* %7 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %8, align 4, !tbaa !2
  %9 = sub nsw <4 x i32> %broadcast.splat73, %wide.load
  %10 = icmp slt <4 x i32> %9, zeroinitializer
  %11 = sub nsw <4 x i32> zeroinitializer, %9
  %12 = select <4 x i1> %10, <4 x i32> %11, <4 x i32> %9
  %13 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %4, i64 %6
  %14 = bitcast i32* %13 to <4 x i32>*
  %wide.load74 = load <4 x i32>, <4 x i32>* %14, align 4, !tbaa !2
  %15 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv67, i64 %6
  %16 = bitcast i32* %15 to <4 x i32>*
  %wide.load75 = load <4 x i32>, <4 x i32>* %16, align 4, !tbaa !2
  %17 = add nuw nsw i64 %index, %0
  %18 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv67, i64 %17
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load76 = load <4 x i32>, <4 x i32>* %19, align 8, !tbaa !2
  %20 = icmp slt <4 x i32> %wide.load74, %wide.load75
  %21 = select <4 x i1> %20, <4 x i32> %wide.load74, <4 x i32> %wide.load75
  %22 = icmp sgt <4 x i32> %21, %wide.load76
  %23 = select <4 x i1> %22, <4 x i32> %wide.load76, <4 x i32> %21
  %24 = add nsw <4 x i32> %23, %12
  %25 = trunc i64 %index to i32
  %26 = add i32 %add, %25
  %27 = add nuw nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv.next68, i64 %28
  %30 = bitcast i32* %29 to <4 x i32>*
  store <4 x i32> %24, <4 x i32>* %30, align 4, !tbaa !2
  %index.next = add i64 %index, 4
  %31 = icmp eq i64 %index.next, 512
  br i1 %31, label %for.cond.cleanup3, label %vector.body, !llvm.loop !26

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  ret void

for.cond.cleanup3:                                ; preds = %vector.body, %for.body4
  %exitcond70 = icmp eq i64 %indvars.iv.next68, 513
  br i1 %exitcond70, label %for.cond.cleanup, label %for.cond1.preheader

for.body4:                                        ; preds = %for.cond1.preheader, %for.body4
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body4 ], [ 0, %for.cond1.preheader ]
  %32 = add nsw i64 %indvars.iv, %1
  %arrayidx7 = getelementptr inbounds [513 x i32], [513 x i32]* @T, i64 0, i64 %32
  %33 = load i32, i32* %arrayidx7, align 4, !tbaa !2
  %sub = sub nsw i32 %3, %33
  %cmp.i = icmp slt i32 %sub, 0
  %sub.i = sub nsw i32 0, %sub
  %spec.select.i = select i1 %cmp.i, i32 %sub.i, i32 %sub
  %arrayidx17 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %4, i64 %32
  %34 = load i32, i32* %arrayidx17, align 4, !tbaa !2
  %arrayidx22 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv67, i64 %32
  %35 = load i32, i32* %arrayidx22, align 4, !tbaa !2
  %36 = add nuw nsw i64 %indvars.iv, %0
  %arrayidx28 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv67, i64 %36
  %37 = load i32, i32* %arrayidx28, align 4, !tbaa !2
  %cmp.i62 = icmp slt i32 %34, %35
  %a.b.i = select i1 %cmp.i62, i32 %34, i32 %35
  %cmp1.i = icmp sgt i32 %a.b.i, %37
  %min.1.i = select i1 %cmp1.i, i32 %37, i32 %a.b.i
  %add30 = add nsw i32 %min.1.i, %spec.select.i
  %38 = trunc i64 %indvars.iv to i32
  %add34 = add i32 %add, %38
  %add35 = add i32 %add34, 1
  %idxprom36 = sext i32 %add35 to i64
  %arrayidx37 = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv.next68, i64 %idxprom36
  store i32 %add30, i32* %arrayidx37, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond, label %for.cond.cleanup3, label %for.body4, !llvm.loop !30
}

; Function Attrs: norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #10 {
entry:
  %temp_s.i = alloca [513 x i32], align 16
  %temp_t.i = alloca [513 x i32], align 16
  %call1.i = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([52 x i8], [52 x i8]* @.str.4, i64 0, i64 0), i64 51)
  %vtable.i = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %0 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %0, align 8
  %add.ptr.i = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %vbase.offset.i
  %_M_ctype.i.i = getelementptr inbounds i8, i8* %add.ptr.i, i64 240
  %1 = bitcast i8* %_M_ctype.i.i to %"class.std::ctype"**
  %2 = load %"class.std::ctype"*, %"class.std::ctype"** %1, align 8, !tbaa !8
  %tobool.i.i.i = icmp eq %"class.std::ctype"* %2, null
  br i1 %tobool.i.i.i, label %if.then.i.i.i, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i

if.then.i.i.i:                                    ; preds = %entry
  tail call void @_ZSt16__throw_bad_castv() #12
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i: ; preds = %entry
  %_M_widen_ok.i.i.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %2, i64 0, i32 8
  %3 = load i8, i8* %_M_widen_ok.i.i.i, align 8, !tbaa !12
  %tobool.i3.i.i = icmp eq i8 %3, 0
  br i1 %tobool.i3.i.i, label %if.end.i.i.i, label %if.then.i4.i.i

if.then.i4.i.i:                                   ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  %arrayidx.i.i.i = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %2, i64 0, i32 9, i64 10
  %4 = load i8, i8* %arrayidx.i.i.i, align 1, !tbaa !14
  br label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

if.end.i.i.i:                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %2)
  %5 = bitcast %"class.std::ctype"* %2 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i.i.i = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %5, align 8, !tbaa !6
  %vfn.i.i.i = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vtable.i.i.i, i64 6
  %6 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %vfn.i.i.i, align 8
  %call.i.i.i = tail call signext i8 %6(%"class.std::ctype"* nonnull %2, i8 signext 10)
  br label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit: ; preds = %if.then.i4.i.i, %if.end.i.i.i
  %retval.0.i.i.i = phi i8 [ %4, %if.then.i4.i.i ], [ %call.i.i.i, %if.end.i.i.i ]
  %call1.i2 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %retval.0.i.i.i)
  %call.i.i3 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %call1.i2)
  %7 = bitcast [513 x i32]* %temp_s.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 2052, i8* nonnull %7) #13
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit
  %index = phi i64 [ 0, %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit ], [ %vec.ind.next, %vector.body ]
  %8 = getelementptr inbounds [513 x i32], [513 x i32]* %temp_s.i, i64 0, i64 %index
  %9 = trunc <4 x i64> %vec.ind to <4 x i32>
  %10 = add <4 x i32> %9, <i32 1, i32 1, i32 1, i32 1>
  %11 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> %10, <4 x i32>* %11, align 16, !tbaa !2
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %12 = icmp eq i64 %index.next, 512
  br i1 %12, label %for.body.i, label %vector.body, !llvm.loop !31

for.body.i:                                       ; preds = %vector.body, %for.body.i
  %indvars.iv177.i = phi i64 [ %indvars.iv.next178.i, %for.body.i ], [ 512, %vector.body ]
  %indvars.iv.next178.i = add nuw nsw i64 %indvars.iv177.i, 1
  %arrayidx.i = getelementptr inbounds [513 x i32], [513 x i32]* %temp_s.i, i64 0, i64 %indvars.iv177.i
  %13 = trunc i64 %indvars.iv.next178.i to i32
  store i32 %13, i32* %arrayidx.i, align 4, !tbaa !2
  %exitcond179.i = icmp eq i64 %indvars.iv.next178.i, 513
  br i1 %exitcond179.i, label %for.body5.preheader.i, label %for.body.i, !llvm.loop !32

for.body5.preheader.i:                            ; preds = %for.body.i
  %14 = bitcast [513 x i32]* %temp_t.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(2052) bitcast ([513 x i32]* @S to i8*), i8* nonnull align 16 dereferenceable(2052) %7, i64 2052, i1 false) #13
  call void @llvm.lifetime.start.p0i8(i64 2052, i8* nonnull %14) #13
  br label %vector.body10

vector.body10:                                    ; preds = %vector.body10, %for.body5.preheader.i
  %index12 = phi i64 [ 0, %for.body5.preheader.i ], [ %index.next13, %vector.body10 ]
  %vec.ind18 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.body5.preheader.i ], [ %vec.ind.next19, %vector.body10 ]
  %15 = getelementptr inbounds [513 x i32], [513 x i32]* %temp_t.i, i64 0, i64 %index12
  %16 = add <4 x i32> %vec.ind18, <i32 3, i32 3, i32 3, i32 3>
  %17 = bitcast i32* %15 to <4 x i32>*
  store <4 x i32> %16, <4 x i32>* %17, align 16, !tbaa !2
  %index.next13 = add i64 %index12, 4
  %vec.ind.next19 = add <4 x i32> %vec.ind18, <i32 4, i32 4, i32 4, i32 4>
  %18 = icmp eq i64 %index.next13, 512
  br i1 %18, label %for.body17.i, label %vector.body10, !llvm.loop !33

for.body17.i:                                     ; preds = %vector.body10, %for.body17.i
  %indvars.iv170.i = phi i64 [ %indvars.iv.next171.i, %for.body17.i ], [ 512, %vector.body10 ]
  %arrayidx20.i = getelementptr inbounds [513 x i32], [513 x i32]* %temp_t.i, i64 0, i64 %indvars.iv170.i
  %19 = trunc i64 %indvars.iv170.i to i32
  %20 = add i32 %19, 3
  store i32 %20, i32* %arrayidx20.i, align 4, !tbaa !2
  %indvars.iv.next171.i = add nuw nsw i64 %indvars.iv170.i, 1
  %exitcond173.i = icmp eq i64 %indvars.iv.next171.i, 513
  br i1 %exitcond173.i, label %for.body27.preheader.i, label %for.body17.i, !llvm.loop !34

for.body27.preheader.i:                           ; preds = %for.body17.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(2052) bitcast ([513 x i32]* @T to i8*), i8* nonnull align 16 dereferenceable(2052) %14, i64 2052, i1 false) #13
  br label %for.cond41.preheader.i

for.cond41.preheader.i:                           ; preds = %for.cond41.preheader.i, %for.body27.preheader.i
  %indvar.i = phi i64 [ 0, %for.body27.preheader.i ], [ %21, %for.cond41.preheader.i ]
  %21 = add nuw nsw i64 %indvar.i, 1
  %scevgep.i = getelementptr [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %21, i64 1
  %scevgep165.i = bitcast i32* %scevgep.i to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(2052) %scevgep165.i, i8 -1, i64 2052, i1 false) #13
  %exitcond166.i = icmp eq i64 %21, 513
  br i1 %exitcond166.i, label %for.body59.i, label %for.cond41.preheader.i

for.cond69.preheader.i:                           ; preds = %for.body59.i
  %22 = load i32, i32* getelementptr inbounds ([513 x i32], [513 x i32]* @S, i64 0, i64 0), align 16, !tbaa !2
  br label %for.body72.i

for.body59.i:                                     ; preds = %for.cond41.preheader.i, %for.body59.i
  %indvars.iv159.i = phi i64 [ %indvars.iv.next160.i, %for.body59.i ], [ 1, %for.cond41.preheader.i ]
  %arrayidx62.i = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv159.i, i64 0
  store i32 65535, i32* %arrayidx62.i, align 8, !tbaa !2
  %arrayidx64.i = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 0, i64 %indvars.iv159.i
  store i32 65535, i32* %arrayidx64.i, align 4, !tbaa !2
  %indvars.iv.next160.i = add nuw nsw i64 %indvars.iv159.i, 1
  %exitcond161.i = icmp eq i64 %indvars.iv.next160.i, 514
  br i1 %exitcond161.i, label %for.cond69.preheader.i, label %for.body59.i

for.body72.i:                                     ; preds = %for.body72.i, %for.cond69.preheader.i
  %indvars.iv155.i = phi i64 [ 1, %for.cond69.preheader.i ], [ %indvars.iv.next156.i, %for.body72.i ]
  %arrayidx75.i = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv155.i, i64 1
  store i32 65535, i32* %arrayidx75.i, align 4, !tbaa !2
  %23 = add nsw i64 %indvars.iv155.i, -1
  %arrayidx77.i = getelementptr inbounds [513 x i32], [513 x i32]* @T, i64 0, i64 %23
  %24 = load i32, i32* %arrayidx77.i, align 4, !tbaa !2
  %sub78.i = sub nsw i32 %22, %24
  %cmp.i.i = icmp slt i32 %sub78.i, 0
  %sub.i.i = sub nsw i32 0, %sub78.i
  %spec.select.i.i = select i1 %cmp.i.i, i32 %sub.i.i, i32 %sub78.i
  %arrayidx80.i = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 1, i64 %indvars.iv155.i
  store i32 %spec.select.i.i, i32* %arrayidx80.i, align 4, !tbaa !2
  %indvars.iv.next156.i = add nuw nsw i64 %indvars.iv155.i, 1
  %exitcond158.i = icmp eq i64 %indvars.iv.next156.i, 514
  br i1 %exitcond158.i, label %_Z10initializeb.exit, label %for.body72.i

_Z10initializeb.exit:                             ; preds = %for.body72.i
  store i32 0, i32* getelementptr inbounds ([514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 0, i64 0), align 16, !tbaa !2
  call void @llvm.lifetime.end.p0i8(i64 2052, i8* nonnull %14) #13
  call void @llvm.lifetime.end.p0i8(i64 2052, i8* nonnull %7) #13
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond.cleanup3.i, %_Z10initializeb.exit
  %indvars.iv67.i = phi i64 [ 1, %_Z10initializeb.exit ], [ %indvars.iv.next68.i, %for.cond.cleanup3.i ]
  %arrayidx.i4 = getelementptr inbounds [513 x i32], [513 x i32]* @S, i64 0, i64 %indvars.iv67.i
  %25 = load i32, i32* %arrayidx.i4, align 4, !tbaa !2
  %26 = add nsw i64 %indvars.iv67.i, -1
  %indvars.iv.next68.i = add nuw nsw i64 %indvars.iv67.i, 1
  br label %for.body4.i

for.cond.cleanup3.i:                              ; preds = %for.body4.i
  %exitcond70.i = icmp eq i64 %indvars.iv.next68.i, 513
  br i1 %exitcond70.i, label %_Z6kerneli.exit, label %for.cond1.preheader.i

for.body4.i:                                      ; preds = %for.body4.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %27, %for.body4.i ]
  %27 = add nuw nsw i64 %indvars.iv.i, 1
  %arrayidx7.i = getelementptr inbounds [513 x i32], [513 x i32]* @T, i64 0, i64 %27
  %28 = load i32, i32* %arrayidx7.i, align 4, !tbaa !2
  %sub.i = sub nsw i32 %25, %28
  %cmp.i.i5 = icmp slt i32 %sub.i, 0
  %sub.i.i6 = sub nsw i32 0, %sub.i
  %spec.select.i.i7 = select i1 %cmp.i.i5, i32 %sub.i.i6, i32 %sub.i
  %arrayidx17.i = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %26, i64 %27
  %29 = load i32, i32* %arrayidx17.i, align 4, !tbaa !2
  %arrayidx22.i = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv67.i, i64 %27
  %30 = load i32, i32* %arrayidx22.i, align 4, !tbaa !2
  %arrayidx28.i = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv67.i, i64 %indvars.iv.i
  %31 = load i32, i32* %arrayidx28.i, align 4, !tbaa !2
  %cmp.i62.i = icmp slt i32 %29, %30
  %a.b.i.i = select i1 %cmp.i62.i, i32 %29, i32 %30
  %cmp1.i.i = icmp sgt i32 %a.b.i.i, %31
  %min.1.i.i = select i1 %cmp1.i.i, i32 %31, i32 %a.b.i.i
  %add30.i = add nsw i32 %min.1.i.i, %spec.select.i.i7
  %add35.i = shl i64 %indvars.iv.i, 32
  %sext = add nuw nsw i64 %add35.i, 8589934592
  %idxprom36.i = ashr exact i64 %sext, 32
  %arrayidx37.i = getelementptr inbounds [514 x [514 x i32]], [514 x [514 x i32]]* @DTW, i64 0, i64 %indvars.iv.next68.i, i64 %idxprom36.i
  store i32 %add30.i, i32* %arrayidx37.i, align 4, !tbaa !2
  %exitcond.i = icmp eq i64 %27, 512
  br i1 %exitcond.i, label %for.cond.cleanup3.i, label %for.body4.i, !llvm.loop !35

_Z6kerneli.exit:                                  ; preds = %for.cond.cleanup3.i
  ret i32 0
}

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) local_unnamed_addr #0

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"*, i8 signext) local_unnamed_addr #0

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"*) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #11

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"*) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_dtw.cpp() #5 section ".text.startup" {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #13
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind }
attributes #3 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noreturn }
attributes #13 = { nounwind }
attributes #14 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"vtable pointer", !5, i64 0}
!8 = !{!9, !10, i64 240}
!9 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !10, i64 216, !4, i64 224, !11, i64 225, !10, i64 232, !10, i64 240, !10, i64 248, !10, i64 256}
!10 = !{!"any pointer", !4, i64 0}
!11 = !{!"bool", !4, i64 0}
!12 = !{!13, !4, i64 56}
!13 = !{!"_ZTSSt5ctypeIcE", !10, i64 16, !11, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !4, i64 56, !4, i64 57, !4, i64 313, !4, i64 569}
!14 = !{!4, !4, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !4, i64 0}
!17 = !{!10, !10, i64 0}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = distinct !{!20, !21, !19}
!21 = !{!"llvm.loop.unroll.runtime.disable"}
!22 = distinct !{!22, !19}
!23 = distinct !{!23, !21, !19}
!24 = distinct !{!24, !19}
!25 = distinct !{!25, !21, !19}
!26 = distinct !{!26, !27}
!27 = distinct !{!27, !28, !29}
!28 = !{!"llvm.loop.isvectorized"}
!29 = !{!"llvm.loop.unroll.count", i32 4}
!30 = distinct !{!30, !27}
!31 = distinct !{!31, !19}
!32 = distinct !{!32, !21, !19}
!33 = distinct !{!33, !19}
!34 = distinct !{!34, !21, !19}
!35 = distinct !{!35, !36, !37, !38}
!36 = !{!"llvm.loop.vectorize.width", i32 4}
!37 = !{!"llvm.loop.vectorize.enable", i1 true}
!38 = !{!"llvm.loop.vectorize.followup_all", !27}
