fn main() {
  // let answer = what_a_name(322,156);
  // println!("what_a_name1: top: 322 and left: 156 equal to {}", answer);
  let answer = what_a_name2(322,156);
  println!("what_a_name2: top: 322 and left: 156 equal to {}", answer);
  // let answer = what_a_name2(3,2);
  // println!("top: 3 and left: 2 equal to {}", answer);
  // assert_eq!(what_a_name(322,156), 306.48749781747574);
  // assert_eq!(what_a_name2(322,156), 306.48749781747574);
  // assert_eq!(what_a_name2(2,2), 0.75);
  // assert_eq!(what_a_name(0,0), 0.0)
}

fn what_a_name (top: usize, left: usize) -> f64 {
  if top == 0 { return 0.};
  let mut counter = top;
  let mut pyramid: Vec<Vec<f64>> = vec![vec![0., 1., 0.]];
  while counter > 0 {
    if let Some(row) = pyramid.get(&pyramid.len() - 1) {
      let current_row = row;

      let mut next_row = vec![0.];
      let length = current_row.len();

      for ix in 0..length {
        if let Some(_) = current_row.get(ix+1) {
          next_row.push(1. + (current_row[ix] + current_row[ix+1])/2.)
        }
        }
      next_row.push(0.);
      pyramid.push(next_row);
  }

  counter -= 1
  }

  pyramid.as_slice()[top][left+1] - 1.

}

fn what_a_name2 (top: usize, left: usize) -> f64 {
  if top == 0 { return 0.};
  if top == 1 { return 0.5};
  let mut row: Vec<f64> = vec![1.5,1.5,0.];
  let mut buf: Vec<f64> = vec![0.;1];

  for tx in 2..top+1 {
    for ix in 0..tx+1 {
      let element = row[ix];
      let prev_element = buf[0];
      let new_element = 1. + (element + prev_element) / 2.;
      buf[0] = element;
      row[ix] = new_element;
    }
    row.push(0.);
  }
  row.as_slice()[left] - 1.

}
