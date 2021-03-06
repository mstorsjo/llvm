; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt < %s -cost-model -analyze -mtriple=x86_64-apple-macosx10.8.0 -mattr=+ssse3 | FileCheck %s --check-prefixes=CHECK,SSE,SSSE3
; RUN: opt < %s -cost-model -analyze -mtriple=x86_64-apple-macosx10.8.0 -mattr=+sse4.2 | FileCheck %s --check-prefixes=CHECK,SSE,SSE42
; RUN: opt < %s -cost-model -analyze -mtriple=x86_64-apple-macosx10.8.0 -mattr=+avx | FileCheck %s --check-prefixes=CHECK,AVX,AVX1
; RUN: opt < %s -cost-model -analyze -mtriple=x86_64-apple-macosx10.8.0 -mattr=+avx2 | FileCheck %s --check-prefixes=CHECK,AVX,AVX2
; RUN: opt < %s -cost-model -analyze -mtriple=x86_64-apple-macosx10.8.0 -mattr=+avx512f | FileCheck %s --check-prefixes=CHECK,AVX512,AVX512F
; RUN: opt < %s -cost-model -analyze -mtriple=x86_64-apple-macosx10.8.0 -mattr=+avx512f,+avx512bw | FileCheck %s --check-prefixes=CHECK,AVX512,AVX512BW
; RUN: opt < %s -cost-model -analyze -mtriple=x86_64-apple-macosx10.8.0 -mattr=+avx512f,+avx512dq | FileCheck %s --check-prefixes=CHECK,AVX512,AVX512DQ
;
; RUN: opt < %s -cost-model -analyze -mtriple=x86_64-apple-macosx10.8.0 -mcpu=slm | FileCheck %s --check-prefixes=CHECK,SLM
; RUN: opt < %s -cost-model -analyze -mtriple=x86_64-apple-macosx10.8.0 -mcpu=goldmont | FileCheck %s --check-prefixes=CHECK,GLM
; RUN: opt < %s -cost-model -analyze -mtriple=x86_64-apple-macosx10.8.0 -mcpu=btver2 | FileCheck %s --check-prefixes=CHECK,BTVER2

declare i64        @llvm.smul.fix.i64(i64, i64, i32)
declare <2 x i64>  @llvm.smul.fix.v2i64(<2 x i64>, <2 x i64>, i32)
declare <4 x i64>  @llvm.smul.fix.v4i64(<4 x i64>, <4 x i64>, i32)
declare <8 x i64>  @llvm.smul.fix.v8i64(<8 x i64>, <8 x i64>, i32)

declare i32        @llvm.smul.fix.i32(i32, i32, i32)
declare <4 x i32>  @llvm.smul.fix.v4i32(<4 x i32>, <4 x i32>, i32)
declare <8 x i32>  @llvm.smul.fix.v8i32(<8 x i32>, <8 x i32>, i32)
declare <16 x i32> @llvm.smul.fix.v16i32(<16 x i32>, <16 x i32>, i32)

declare i16        @llvm.smul.fix.i16(i16, i16, i32)
declare <8 x i16>  @llvm.smul.fix.v8i16(<8 x i16>, <8 x i16>, i32)
declare <16 x i16> @llvm.smul.fix.v16i16(<16 x i16>, <16 x i16>, i32)
declare <32 x i16> @llvm.smul.fix.v32i16(<32 x i16>, <32 x i16>, i32)

declare i8         @llvm.smul.fix.i8(i8, i8, i32)
declare <16 x i8>  @llvm.smul.fix.v16i8(<16 x i8>, <16 x i8>, i32)
declare <32 x i8>  @llvm.smul.fix.v32i8(<32 x i8>, <32 x i8>, i32)
declare <64 x i8>  @llvm.smul.fix.v64i8(<64 x i8>, <64 x i8>, i32)

define i32 @smul(i32 %arg) {
; CHECK-LABEL: 'smul'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I64 = call i64 @llvm.smul.fix.i64(i64 undef, i64 undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2I64 = call <2 x i64> @llvm.smul.fix.v2i64(<2 x i64> undef, <2 x i64> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4I64 = call <4 x i64> @llvm.smul.fix.v4i64(<4 x i64> undef, <4 x i64> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I64 = call <8 x i64> @llvm.smul.fix.v8i64(<8 x i64> undef, <8 x i64> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I32 = call i32 @llvm.smul.fix.i32(i32 undef, i32 undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4I32 = call <4 x i32> @llvm.smul.fix.v4i32(<4 x i32> undef, <4 x i32> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I32 = call <8 x i32> @llvm.smul.fix.v8i32(<8 x i32> undef, <8 x i32> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V16I32 = call <16 x i32> @llvm.smul.fix.v16i32(<16 x i32> undef, <16 x i32> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I16 = call i16 @llvm.smul.fix.i16(i16 undef, i16 undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V8I16 = call <8 x i16> @llvm.smul.fix.v8i16(<8 x i16> undef, <8 x i16> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V16I16 = call <16 x i16> @llvm.smul.fix.v16i16(<16 x i16> undef, <16 x i16> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V32I16 = call <32 x i16> @llvm.smul.fix.v32i16(<32 x i16> undef, <32 x i16> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I8 = call i8 @llvm.smul.fix.i8(i8 undef, i8 undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V16I8 = call <16 x i8> @llvm.smul.fix.v16i8(<16 x i8> undef, <16 x i8> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V32I8 = call <32 x i8> @llvm.smul.fix.v32i8(<32 x i8> undef, <32 x i8> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 128 for instruction: %V64I8 = call <64 x i8> @llvm.smul.fix.v64i8(<64 x i8> undef, <64 x i8> undef, i32 3)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %I64 = call i64 @llvm.smul.fix.i64(i64 undef, i64 undef, i32 3)
  %V2I64 = call <2 x i64> @llvm.smul.fix.v2i64(<2 x i64> undef, <2 x i64> undef, i32 3)
  %V4I64 = call <4 x i64> @llvm.smul.fix.v4i64(<4 x i64> undef, <4 x i64> undef, i32 3)
  %V8I64 = call <8 x i64> @llvm.smul.fix.v8i64(<8 x i64> undef, <8 x i64> undef, i32 3)

  %I32 = call i32 @llvm.smul.fix.i32(i32 undef, i32 undef, i32 3)
  %V4I32  = call <4 x i32>  @llvm.smul.fix.v4i32(<4 x i32> undef, <4 x i32> undef, i32 3)
  %V8I32  = call <8 x i32>  @llvm.smul.fix.v8i32(<8 x i32> undef, <8 x i32> undef, i32 3)
  %V16I32 = call <16 x i32> @llvm.smul.fix.v16i32(<16 x i32> undef, <16 x i32> undef, i32 3)

  %I16 = call i16 @llvm.smul.fix.i16(i16 undef, i16 undef, i32 3)
  %V8I16  = call <8 x i16>  @llvm.smul.fix.v8i16(<8 x i16> undef, <8 x i16> undef, i32 3)
  %V16I16 = call <16 x i16> @llvm.smul.fix.v16i16(<16 x i16> undef, <16 x i16> undef, i32 3)
  %V32I16 = call <32 x i16> @llvm.smul.fix.v32i16(<32 x i16> undef, <32 x i16> undef, i32 3)

  %I8 = call i8 @llvm.smul.fix.i8(i8 undef, i8 undef, i32 3)
  %V16I8 = call <16 x i8> @llvm.smul.fix.v16i8(<16 x i8> undef, <16 x i8> undef, i32 3)
  %V32I8 = call <32 x i8> @llvm.smul.fix.v32i8(<32 x i8> undef, <32 x i8> undef, i32 3)
  %V64I8 = call <64 x i8> @llvm.smul.fix.v64i8(<64 x i8> undef, <64 x i8> undef, i32 3)

  ret i32 undef
}
