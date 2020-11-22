; ModuleID = 'squares.ll'
source_filename = "squares.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"%d: %d\0A\00", align 1
@.str_res = private unnamed_addr constant [9 x i8] c"res: %d\0A\00", align 1

declare i32 @printf(i8*, ...) #1

define void @print(i32 %i, i32 %v) {
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %i, i32 %v)
  ret void
}

define void @print_res(i32 %i) {
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str_res, i64 0, i64 0), i32 %i)
  ret void
}


define i8 @main() {
  %N = add i32 0, 101
  %square_of_sum = call i32 @square_of_sum(i32 %N)
  %sum_of_square = call i32 @sum_of_square(i32 %N)

  %res = sub i32 %square_of_sum, %sum_of_square
  call void @print(i32 %square_of_sum, i32 %sum_of_square)
  call void @print_res(i32 %res)

  ret i8 0
}

define i32 @square_of_sum(i32 %N) {
 header:
  %res_p = alloca i32
  store i32 0, i32* %res_p
  br label %loop

loop:
  %i = phi i32 [0, %header],[%nextI, %loop]
  ; call void @print(i32 %i,i32 -1)
  %current_sum = load i32, i32* %res_p

  %next_sum = add i32 %i, %current_sum
  store i32 %next_sum, i32* %res_p

  %nextI = add i32 %i, 1
  %more = icmp slt i32 %nextI, %N
  br i1 %more, label %loop, label %done

done:

  %res = load i32, i32* %res_p
  %squared = mul i32 %res, %res
  ret i32 %squared
}

define i32 @sum_of_square(i32 %N) {
 header:
  %res_p = alloca i32
  store i32 0, i32* %res_p
  br label %loop

loop:
  %i = phi i32 [0, %header],[%nextI, %loop]
  ; call void @print(i32 %i,i32 -1)
  %current_sum = load i32, i32* %res_p

  %v = mul i32 %i, %i
  %next_sum = add i32 %v, %current_sum
  store i32 %next_sum, i32* %res_p

  %nextI = add i32 %i, 1
  %more = icmp slt i32 %nextI, %N
  br i1 %more, label %loop, label %done

done:

  %res = load i32, i32* %res_p
  ret i32 %res
}


attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
