(function(){
    // Functions
    function buildQuiz(){
      // variable to store the HTML output
      const output = [];
  
      // for each question...
      myQuestions.forEach(
        (currentQuestion, questionNumber) => {
  
          // variable to store the list of possible answers
          const answers = [];
  
          for(letter in currentQuestion.answers){
  
            answers.push(
              `<label>
                <input type="radio" name="question${questionNumber}" value="${letter}">
                ${letter} :
                ${currentQuestion.answers[letter]}
              </label>`
            );
          }
  
          // add this question and its answers to the output
          output.push(
            `<div class="slide">
              <div class="question"> ${currentQuestion.question} </div>
              <div class="answers"> ${answers.join("")} </div>
            </div>`
          );
        }
      );
  
      // finally combine our output list into one string of HTML and put it on the page
      quizContainer.innerHTML = output.join('');
    }
  
    function showResults(){
  
      // gather answer containers from our quiz
      const answerContainers = quizContainer.querySelectorAll('.answers');
  
      // keep track of user's answers
      let numCorrect = 0;
  
      // for each question...
      myQuestions.forEach( (currentQuestion, questionNumber) => {
  
        // find selected answer
        const answerContainer = answerContainers[questionNumber];
        const selector = `input[name=question${questionNumber}]:checked`;
        const userAnswer = (answerContainer.querySelector(selector) || {}).value;
  
      
        if(userAnswer === currentQuestion.correctAnswer){
          
          numCorrect++;
  
          answerContainers[questionNumber].style.color = 'lightgreen';
        }
       
        else{
       
          answerContainers[questionNumber].style.color = 'red';
        }
      });
  
    
      resultsContainer.innerHTML = `${numCorrect} out of ${myQuestions.length}`;
    }
  
 
   
  
    // Variables
    const quizContainer = document.getElementById('quiz');
    const resultsContainer = document.getElementById('results');
    const submitButton = document.getElementById('submit');
    const myQuestions = [
      {
            question: "What is 2 + 2?",
            answers: {
                a: "8",
                b: "2",
                c: "4"
        },
            correctAnswer: "c"
        },
        {
            question: "What letters represent primary colors when working with paints?",
            answers: {
                a: "RYB",
                b: "RGB",
                c: "CMY"
        },
            correctAnswer: "c"
        },
        {
            question: "What mammal lays eggs?",
            answers: {
                a: "Otter",
                b: "Duck",
                c: "Bat",
                d: "Platypus"
        },
            correctAnswer: "d"
        },
        {
            question: "How many colors does black and blue make?",
            answers: {
                a: "None",
                b: "As many as you want",
                c: "5",
        }, 
        correctAnswer: "a"
        },
        {
            question: "How many flavors are in Neopalitan ice cream?",
            answers: {
                a: "2",
                b: "3",
                c: "4",
                d: "Ice cream isn't real",
            },
        correctAnswer: "d"
        },
    ];

  buildQuiz();


  const slides = document.querySelectorAll(".slide");
  let currentSlide = 0;

 

  submitButton.addEventListener('click', showResults);
})();
