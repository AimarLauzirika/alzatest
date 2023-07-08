async function init () {
  print_question()
}

init()









async function get_questions() {
  const response = await fetch('data/questions.json')
  // console.log(response);
  const questions_json = await response.json()
  // console.log(questions_json);
  return questions_json
}

async function get_actual_question(index = 0) {
  const questions_json = await get_questions()
  const actual_question = questions_json.questions[index]
  // console.log(actual_question);
  return actual_question
}

async function print_question() {
  const actual_question = await get_actual_question()
  // console.log(actual_question);

  // * Print Question * \\
  const e_question = document.querySelector('.question-box>.question')
  // console.log(e_question);
  e_question.textContent = actual_question.question


  // * Print Code * \\
  if (actual_question.code) {
    const e_code = document.createElement('code')
    const e_pre = document.createElement('pre')
    e_pre.appendChild(e_code)
    const e_question_box = document.querySelector('.question-box')
    e_question_box.appendChild(e_pre)
    // const e_code = document.querySelector('.test-box>code>pre')
    // console.log(e_code);
    e_code.textContent = actual_question.code
  }

  // * Print Options * \\
  const options = actual_question.options
  // console.log(options);
  
  const e_options = document.querySelector('.test-box>.options')
  // console.log(e_options);

  options.forEach((option, index) => {
    // console.log(option);
    const e_option = document.createElement('p')
    e_option.textContent = (option)
    e_option.classList.add('option')
    e_option.dataset.option = index
    e_option.addEventListener('click', () => {
      correct_answer(index, actual_question.correct_option)
    })
    e_options.appendChild(e_option)
  });
}

function correct_answer(selected_option, correct_option){
  // console.log(correct_option);
  const e_options = document.querySelector('.test-box>.options')
  if (selected_option === correct_option) {
    e_options.children[selected_option].classList.add('correct_answer');
    return
  }
  if (selected_option !== correct_option) {
    e_options.children[selected_option].classList.add('wrong_answer');
    e_options.children[correct_option].classList.add('correct_answer');
    return
  }
}