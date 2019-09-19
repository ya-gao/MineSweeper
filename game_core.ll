; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@UNKNOWN = constant i32 253, align 4
@MARKED = constant i32 254, align 4
@MINE = constant i32 255, align 4
@PROB = constant i32 5, align 4
@board_width = global i32 -2147483648, align 4
@board_height = global i32 -2147483648, align 4
@board = common global i32* null, align 8
@map = common global i32* null, align 8

; Function Attrs: nounwind
define i32* @create_map(i32 %width, i32 %height, i1 zeroext %blank) #0 {
  %width.addr = alloca i32, align 4
  %height.addr = alloca i32, align 4
  %blank.addr = alloca i8, align 1
  %data = alloca i32*, align 8
  %i = alloca i32, align 4
  %rnd = alloca i32, align 4
  store i32 %width, i32* %width.addr, align 4
  store i32 %height, i32* %height.addr, align 4
  %frombool = zext i1 %blank to i8
  store i8 %frombool, i8* %blank.addr, align 1
  %1 = load i32, i32* %width.addr, align 4
  store i32 %1, i32* @board_width, align 4
  %2 = load i32, i32* %height.addr, align 4
  store i32 %2, i32* @board_height, align 4
  %3 = load i32, i32* %width.addr, align 4
  %4 = load i32, i32* %height.addr, align 4
  %mul = mul nsw i32 %3, %4
  %conv = sext i32 %mul to i64
  %mul1 = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul1) #2
  %5 = bitcast i8* %call to i32*
  store i32* %5, i32** %data, align 8
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6:                                      ; preds = %18, %0
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %width.addr, align 4
  %9 = load i32, i32* %height.addr, align 4
  %mul2 = mul nsw i32 %8, %9
  %cmp = icmp slt i32 %7, %mul2
  br i1 %cmp, label %10, label %20

; <label>:10:                                     ; preds = %6
  %call4 = call i32 @rand() #2
  %rem = srem i32 %call4, 5
  %div = sdiv i32 %rem, 4
  store i32 %div, i32* %rnd, align 4
  %11 = load i8, i8* %blank.addr, align 1
  %tobool = trunc i8 %11 to i1
  br i1 %tobool, label %12, label %13

; <label>:12:                                     ; preds = %10
  br label %15

; <label>:13:                                     ; preds = %10
  %14 = load i32, i32* %rnd, align 4
  %mul6 = mul nsw i32 %14, 255
  br label %15

; <label>:15:                                     ; preds = %13, %12
  %cond = phi i32 [ 253, %12 ], [ %mul6, %13 ]
  %16 = load i32, i32* %i, align 4
  %idxprom = sext i32 %16 to i64
  %17 = load i32*, i32** %data, align 8
  %arrayidx = getelementptr inbounds i32, i32* %17, i64 %idxprom
  store i32 %cond, i32* %arrayidx, align 4
  br label %18

; <label>:18:                                     ; preds = %15
  %19 = load i32, i32* %i, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %i, align 4
  br label %6

; <label>:20:                                     ; preds = %6
  %21 = load i32*, i32** %data, align 8
  ret i32* %21
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind
define zeroext i1 @all_marked() #0 {
  %retval = alloca i1, align 1
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1:                                      ; preds = %23, %0
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* @board_width, align 4
  %4 = load i32, i32* @board_height, align 4
  %mul = mul nsw i32 %3, %4
  %cmp = icmp slt i32 %2, %mul
  br i1 %cmp, label %5, label %25

; <label>:5:                                      ; preds = %1
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load i32*, i32** @board, align 8
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom
  %8 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp eq i32 %8, 255
  br i1 %cmp1, label %9, label %13

; <label>:9:                                      ; preds = %5
  %10 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %10 to i64
  %11 = load i32*, i32** @map, align 8
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 %idxprom2
  %12 = load i32, i32* %arrayidx3, align 4
  %cmp4 = icmp ne i32 %12, 254
  br i1 %cmp4, label %21, label %13

; <label>:13:                                     ; preds = %9, %5
  %14 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %14 to i64
  %15 = load i32*, i32** @board, align 8
  %arrayidx6 = getelementptr inbounds i32, i32* %15, i64 %idxprom5
  %16 = load i32, i32* %arrayidx6, align 4
  %cmp7 = icmp ne i32 %16, 255
  br i1 %cmp7, label %17, label %22

; <label>:17:                                     ; preds = %13
  %18 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %18 to i64
  %19 = load i32*, i32** @map, align 8
  %arrayidx9 = getelementptr inbounds i32, i32* %19, i64 %idxprom8
  %20 = load i32, i32* %arrayidx9, align 4
  %cmp10 = icmp eq i32 %20, 254
  br i1 %cmp10, label %21, label %22

; <label>:21:                                     ; preds = %17, %9
  store i1 false, i1* %retval, align 1
  br label %26

; <label>:22:                                     ; preds = %17, %13
  br label %23

; <label>:23:                                     ; preds = %22
  %24 = load i32, i32* %i, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %i, align 4
  br label %1

; <label>:25:                                     ; preds = %1
  store i1 true, i1* %retval, align 1
  br label %26

; <label>:26:                                     ; preds = %25, %21
  %27 = load i1, i1* %retval, align 1
  ret i1 %27
}

; Function Attrs: nounwind
define zeroext i1 @mine_at(i32 %c, i32 %r) #0 {
  %retval = alloca i1, align 1
  %c.addr = alloca i32, align 4
  %r.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %r, i32* %r.addr, align 4
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %10, label %2

; <label>:2:                                      ; preds = %0
  %3 = load i32, i32* %r.addr, align 4
  %cmp1 = icmp slt i32 %3, 0
  br i1 %cmp1, label %10, label %4

; <label>:4:                                      ; preds = %2
  %5 = load i32, i32* %c.addr, align 4
  %6 = load i32, i32* @board_width, align 4
  %cmp2 = icmp sge i32 %5, %6
  br i1 %cmp2, label %10, label %7

; <label>:7:                                      ; preds = %4
  %8 = load i32, i32* %r.addr, align 4
  %9 = load i32, i32* @board_height, align 4
  %cmp3 = icmp sge i32 %8, %9
  br i1 %cmp3, label %10, label %11

; <label>:10:                                     ; preds = %7, %4, %2, %0
  store i1 false, i1* %retval, align 1
  br label %17

; <label>:11:                                     ; preds = %7
  %12 = load i32, i32* %c.addr, align 4
  %13 = load i32, i32* @board_width, align 4
  %14 = load i32, i32* %r.addr, align 4
  %mul = mul nsw i32 %13, %14
  %add = add nsw i32 %12, %mul
  %idxprom = sext i32 %add to i64
  %15 = load i32*, i32** @board, align 8
  %arrayidx = getelementptr inbounds i32, i32* %15, i64 %idxprom
  %16 = load i32, i32* %arrayidx, align 4
  %cmp4 = icmp eq i32 %16, 255
  store i1 %cmp4, i1* %retval, align 1
  br label %17

; <label>:17:                                     ; preds = %11, %10
  %18 = load i1, i1* %retval, align 1
  ret i1 %18
}

; Function Attrs: nounwind
define void @init(i32 %width, i32 %height) #0 {
  %width.addr = alloca i32, align 4
  %height.addr = alloca i32, align 4
  store i32 %width, i32* %width.addr, align 4
  store i32 %height, i32* %height.addr, align 4
  %1 = load i32, i32* %width.addr, align 4
  %2 = load i32, i32* %height.addr, align 4
  %call = call i32* @create_map(i32 %1, i32 %2, i1 zeroext false)
  store i32* %call, i32** @board, align 8
  %3 = load i32, i32* %width.addr, align 4
  %4 = load i32, i32* %height.addr, align 4
  %call1 = call i32* @create_map(i32 %3, i32 %4, i1 zeroext true)
  store i32* %call1, i32** @map, align 8
  ret void
}

; Function Attrs: nounwind
define void @init_d(i32 %width, i32 %height, i32 %seed) #0 {
  %width.addr = alloca i32, align 4
  %height.addr = alloca i32, align 4
  %seed.addr = alloca i32, align 4
  store i32 %width, i32* %width.addr, align 4
  store i32 %height, i32* %height.addr, align 4
  store i32 %seed, i32* %seed.addr, align 4
  %1 = load i32, i32* %seed.addr, align 4
  call void @srand(i32 %1) #2
  %2 = load i32, i32* %width.addr, align 4
  %3 = load i32, i32* %height.addr, align 4
  %call = call i32* @create_map(i32 %2, i32 %3, i1 zeroext false)
  store i32* %call, i32** @board, align 8
  %4 = load i32, i32* %width.addr, align 4
  %5 = load i32, i32* %height.addr, align 4
  %call1 = call i32* @create_map(i32 %4, i32 %5, i1 zeroext true)
  store i32* %call1, i32** @map, align 8
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: nounwind
define void @shutdown() #0 {
  %1 = load i32*, i32** @map, align 8
  %cmp = icmp ne i32* %1, null
  br i1 %cmp, label %2, label %5

; <label>:2:                                      ; preds = %0
  %3 = load i32*, i32** @map, align 8
  %4 = bitcast i32* %3 to i8*
  call void @free(i8* %4) #2
  br label %5

; <label>:5:                                      ; preds = %2, %0
  %6 = load i32*, i32** @board, align 8
  %cmp1 = icmp ne i32* %6, null
  br i1 %cmp1, label %7, label %10

; <label>:7:                                      ; preds = %5
  %8 = load i32*, i32** @board, align 8
  %9 = bitcast i32* %8 to i8*
  call void @free(i8* %9) #2
  br label %10

; <label>:10:                                     ; preds = %7, %5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 "}
