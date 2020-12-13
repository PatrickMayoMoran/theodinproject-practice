// randomly select from an array of options
function chooseRandom(anArray) {
  let randomChoice = anArray[Math.floor(Math.random() * anArray.length)];
  return randomChoice;
}
// play rock, paper scissors
function play() {
  let options = ['rock', 'paper', 'scissors'];
  let choice = chooseRandom(options);
  return choice;
}
// computer randomly chooses rock, paper, or scissors
function computerPlay() {
  let selection = play();
  return selection;
}
// player chooses rock, paper, or scissors
function userPlay() {
  let selection = prompt("Type rock, paper, or scissors: ").toLowerCase();
  // make sure it's a valid entry
  let keepGoing = check(selection);
  if (keepGoing) {
      return selection;
  } else {
      console.log("Please enter rock, paper, or scissors: ");
      selection = userPlay();
      return selection;
  }
}

// check for valid input
function check(selection) {
  if (selection === "rock" || selection === "paper" || selection === "scissors") {
      return true;
  } else {
      return false;
  }
}
// play a round of computer vs. player
function playRound(playerChoice) {
  let computerChoice = computerPlay();
  let result = determineWinner(playerChoice, computerChoice);
  return result;
}
// win, tie, or loss determined
function determineWinner(userChoice, computerChoice) {
  if (userChoice === computerChoice) {
      return "It's a tie!";
  } else if (userChoice === 'rock' && computerChoice === 'scissors') {
      return "You win - rock beats scissors!";
  } else if (userChoice === 'rock' && computerChoice === 'paper') {
      return "You lose - paper beats rock.";
  } else if (userChoice === 'paper' && computerChoice === 'rock') {
      return "You win - paper beats rock!";
  } else if (userChoice === 'paper' && computerChoice === 'scissors') {
      return "You lose - scissors beats paper.";
  } else if (userChoice === 'scissors' && computerChoice === 'paper') {
      return "You win - scissors beats paper!";
  } else if (userChoice === 'scissors' && computerChoice === 'rock') {
      return "You lose - rock beats scissors.";
  }
}
// tally of wins, losses, ties updated
// result reported to player

// repeat
function playGame() {
  let humanScore = 0;
  let computerScore = 0;
  let keepGoing = checkEnd(humanScore, computerScore);
  while (keepGoing) {
      let result = playRound();
      let whoWon = humanComputerOrTie(result);
      if (whoWon === 'human') {
          humanScore += 1;
      } else if (whoWon === 'computer') {
          computerScore += 1;
      } 
      keepGoing = checkEnd(humanScore, computerScore);
  }
  let winner = '';
  if (humanScore === 5) {
      alert("You won!");
  } else {
      alert("You lost!");
  }
}

// check whether human or computer has won series
function checkEnd(humanScore, computerScore) {
  if (humanScore === 5 || computerScore === 5) {
      return false;
  } else {
      return true;
  }
}

function checkWinner() {
  userScore = Number(document.getElementById('human-score').textContent);
  compScore = Number(document.getElementById('computer-score').textContent);
  let keepGoing = checkEnd(userScore, compScore);
  if (keepGoing) return;
  if (userScore === 5) {
    let winner = 'Human';
    declareWinner(winner);
  } else {
    let winner = 'Computer';
    declareWinner(winner);
  }
}

function declareWinner(winner) {
  result = document.getElementById('result');
  let declaration = winner + ' wins! Game over!';
  result.textContent = declaration;
}

// report winner identity or tie
function humanComputerOrTie(result) {
  if (result === "It's a tie!") {
      return;
  } else if (result.slice(0,7) === "You win") {
      return 'human';
  } else {
      return 'computer';
  }
}

let buttons = document.querySelectorAll('button');
buttons.forEach((button) => {
  button.addEventListener('click', function(e) {
    let playerChoice = button.id;
    let result = playRound(playerChoice);
    reportRoundResult(result);
    let winner = humanComputerOrTie(result);
    updateScoreboard(winner);
    checkWinner();
  })
})

// play a game
// playGame();

function updateScoreboard(winner) {
  if (winner == "human") {
    let humanScore = document.querySelector('#human-score');
    newScore = addOne(humanScore);
    humanScore.textContent = String(newScore);
  } else if (winner == "computer") {
    let computerScore = document.querySelector('#computer-score');
    newScore = addOne(computerScore);
    computerScore.textContent = String(newScore);
  } else return;
}

function addOne(score) {
    currentScore = score.textContent;
    currentScoreNumber = Number(currentScore);
    currentScoreNumber += 1;
    return currentScoreNumber;
}

function reportRoundResult(result) {
  user = document.querySelector('.user');
  if (!document.getElementById('result')) {
    text = document.createElement("p");
    text.id = 'result';
  }
  text.textContent = result;
  results = document.querySelector('.results');
  results.insertBefore(text, user);
  return;
}
