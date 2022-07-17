#include "tabu.hpp"

// __global__ void FillBest(int altura, int largura, individual* d_sBest, double porosity, double permeability_1, double permeability_2, double permeability_3){
//     int i = threadIdx.x + blockIdx.x * blockDim.x; 
//     int j = threadIdx.y + blockIdx.y * blockDim.y;

//     if((i < altura) && (j < largura)){
//         *d_sBest.porosity[i*largura+j] = porosity;
//         *d_sBest.permeability[i*largura+j].permeability_1 = permeability_1;
//         *d_sBest.permeability[i*largura+j].permeability_2 = permeability_2;
//         *d_sBest.permeability[i*largura+j].permeability_3 = permeability_3;
//     }
// }

void tabu_search::FirstSimulation(){
    srand((unsigned)time(0));

    CreateResultDir(0);

    double porosity = Rand_double(MIN_POROSITY, MAX_POROSITY);
    double permeability_1 = Rand_double(MIN_PERMEABILITY, MAX_PERMEABILITY);
    double permeability_2 = Rand_double(MIN_PERMEABILITY, MAX_PERMEABILITY);
    double permeability_3 = Rand_double(MIN_PERMEABILITY, MAX_PERMEABILITY);

    for(int i = 0; i < HEIGHT; i++){
        for(int j = 0; j < WIDTH; j++){
            this->sBest.porosity[i*WIDTH+j] = porosity;
            this->sBest.permeability[i*WIDTH+j].permeability_1 = permeability_1;
            this->sBest.permeability[i*WIDTH+j].permeability_2 = permeability_2;
            this->sBest.permeability[i*WIDTH+j].permeability_3 = permeability_3;
        }
    }

    WriteSimulationFile(0, 0, simulationFile, fileName, this->sBest);
    
    // Simulation(0, 1, fileName);
    // sBest.error_rank = Fitness(0, 0, this->sBest);

    // WriteErrorFile(0, this->sBest);

    // this->tabuList.push_back(sBest);

    // this->bestCandidate = sBest;

    // this->bestCandidate.proximity = ProximityFunction(this->bestCandidate);

    // Superiorization(this->bestCandidate);
}

void tabu_search::Init(){
    CreateOutputDir();

    string oilInputResult = ReadFileInput(inputOil);
    string waterInputResult = ReadFileInput(inputWater);
    string gasInputResult = ReadFileInput(inputGas);

    this->realResults = ConvertStringInputToDoubleResult(waterInputResult, oilInputResult, gasInputResult); 

    for(int i = 0; i < HEIGHT; i++){
        for(int j = 0; j < WIDTH; j++){
            this->suavityImage[i*WIDTH+j] = 5;
        }
    }

    FirstSimulation();
    // int count = 1;
    // while(count <= N_ITERATIONS && this->sBest.error_rank > STOP){
    //     OthersSimulations(count);
    //     count++;
    // }

    // SaveTabuList();

    // SaveBest();

}