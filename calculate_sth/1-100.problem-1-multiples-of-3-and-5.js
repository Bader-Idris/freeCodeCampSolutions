function multiplesOf3and5(n) {
  let sum = 0;
  for (let i = n - 1; i > 1; i--) {
    if (i % 5 == 0 || i % 3 == 0) {
      sum += i;
    }
  }
  return sum;
}
console.log(multiplesOf3and5(1000))
console.log(multiplesOf3and5(49))//    543
console.log(multiplesOf3and5(1000))//  233168
console.log(multiplesOf3and5(8456))//  16687353
console.log(multiplesOf3and5(19564))// 89301183