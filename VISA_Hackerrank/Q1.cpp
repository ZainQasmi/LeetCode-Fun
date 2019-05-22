// Visa Software Engineer 
// names e.g. ['Ali', 'Ahsan', 'Anas']
// scores e.g. ['30', '50', '10']
// Expected Output e.g. [2,1,3]

// That is return the rank/position of each student



int findInVector(vector<int> &myVec, int &toFind) {
  int result;
  auto it = std::find(myVec.begin(), myVec.end(), toFind);
  if (it != myVec.end()) {
    result = distance(myVec.begin(), it);
  } else {
    result = -1;
  }
  return result;
}

vector<int> rankStudents(vector<string> names, vector<int> scores) {
    vector<int> sortedVector(scores);
    sort(sortedVector.rbegin(), sortedVector.rend());
    vector<int> answer;
    
    for (int i=0; i<scores.size(); ++i) {
        answer.push_back(findInVector(sortedVector, scores[i])+1);
    } 
    
    return answer;
}


