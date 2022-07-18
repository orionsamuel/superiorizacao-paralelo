#include <iostream>
#include <sys/types.h>
#include <dirent.h>
#include <random>
#include <iomanip>
#include <vector>
#include <fstream>
#include <cmath>
#include "cuda_runtime.h"
#include "utils.hpp"

using namespace std;

class functions{
    public:

    void Simulation(int idIteration, int size, string file);
    double Rand_double(double min, double max);
    double Max(double num1, double num2);
    double Min(double num1, double num2);
    const vector<string> split(const string& s, const char& c);
    void CreateOutputDir();
    string ReadFileInput(string file);
    vector<result> ConvertStringInputToDoubleResult(string water, string oil, string gas);
    const char* Command(string inputCommand);
    void CreateResultDir(int idIteration);
    void WriteSimulationFile(int idIteration, int interator, string inputFile, string file, individual sCandidate);
    void WriteErrorFile(int idIteration, individual sCandidate);
    double activationFunction(string waterResult, string oilResult, string gasResult, vector<result> results, int idIteration);

};