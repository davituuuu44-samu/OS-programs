
#include <stdio.h>

int main()
{
    int blockSize[20], processSize[20];
    int blockSize1[20], blockSize2[20];
    int allocation[20];
    int m, n, i, j;

    printf("Enter number of blocks: ");
    scanf("%d", &m);
    printf("Enter number of processes: ");
    scanf("%d", &n);
    
    printf("Enter size of each block:\n");
    for(i = 0; i < m; i++)
        scanf("%d", &blockSize[i]);
    
    printf("Enter size of each process:\n");
    for(i = 0; i < n; i++)
        scanf("%d", &processSize[i]);
    
    // Copy block sizes for each algorithm
    for(i = 0; i < m; i++)
    {
        blockSize1[i] = blockSize[i];
        blockSize2[i] = blockSize[i];
    }
    
    // First Fit
    for(i = 0; i < n; i++)
        allocation[i] = -1;
    
    for(i = 0; i < n; i++)
    {
        for(j = 0; j < m; j++)
        {
            if(blockSize[j] >= processSize[i])
            {
                allocation[i] = j;
                blockSize[j] -= processSize[i];
                break;
            }
        }
    }
    
    printf("\nFirst Fit Allocation\n");
    printf("Process No\tProcess Size\tBlock No\n");
    for(i = 0; i < n; i++)
    {
        printf("%d\t\t%d\t\t", i+1, processSize[i]);
        if(allocation[i] != -1)
            printf("%d\n", allocation[i]+1);
        else
            printf("Not Allocated\n");
    }
    
    // Best Fit
    for(i = 0; i < n; i++)
        allocation[i] = -1;
    
    for(i = 0; i < n; i++)
    {
        int bestIdx = -1;
        for(j = 0; j < m; j++)
        {
            if(blockSize1[j] >= processSize[i])
            {
                if(bestIdx == -1 || blockSize1[j] < blockSize1[bestIdx])
                    bestIdx = j;
            }
        }
        if(bestIdx != -1)
        {
            allocation[i] = bestIdx;
            blockSize1[bestIdx] -= processSize[i];
        }
    }
    
    printf("\nBest Fit Allocation\n");
    printf("Process No\tProcess Size\tBlock No\n");
    for(i = 0; i < n; i++)
    {
        printf("%d\t\t%d\t\t", i+1, processSize[i]);
        if(allocation[i] != -1)
            printf("%d\n", allocation[i]+1);
        else
            printf("Not Allocated\n");
    }
    
    // Worst Fit
    for(i = 0; i < n; i++)
        allocation[i] = -1;
    
    for(i = 0; i < n; i++)
    {
        int worstIdx = -1;
        for(j = 0; j < m; j++)
        {
            if(blockSize2[j] >= processSize[i])
            {
                if(worstIdx == -1 || blockSize2[j] > blockSize2[worstIdx])
                    worstIdx = j;
            }
        }
        if(worstIdx != -1)
        {
            allocation[i] = worstIdx;
            blockSize2[worstIdx] -= processSize[i];
        }
    }
    
    printf("\nWorst Fit Allocation\n");
    printf("Process No\tProcess Size\tBlock No\n");
    for(i = 0; i < n; i++)
    {
        printf("%d\t\t%d\t\t", i+1, processSize[i]);
        if(allocation[i] != -1)
            printf("%d\n", allocation[i]+1);
        else
            printf("Not Allocated\n");
    }
    
    return 0;
}
