resulting_profits = list() # Will contain all profits from each combination of vehicles bought
cost = profit = 0 # Initialise cost and profit to be 0 from each combinations of vehicles bought
for ID1 in range(4): # We know that we can buy between 0 to 3 vehicles with ID1
    cost += 23000*ID1 # Add individual cost of ID1 vehicle times by the number of ID1s bought
    profit += 13683.79*ID1 # Add profit of one ID1 vehicle times by the number of ID1s bought
    for ID2 in range(3): # We can buy between 0 to 2 vehicles with ID2
        cost += 40000*ID2 # Add individual cost of ID2 vehicle times by the number of ID2s bought
        profit += 12486.73*ID2 # Add profit of one ID2 vehicle times by the number of ID2s bought
# Below, code acts as above with individual costs and profits specific to ID3 and ID4 vehicles
        for ID3 in range(5): # We can buy between 0 to 4 vehicles with ID3
            cost += 27000*ID3 
            profit += 14156.87*ID3 
            for ID4 in range(5): # We can buy between 0 to 4 vehicles with ID4
                cost += 30000*ID4 
                profit += 16165.95*ID4
                if cost <= 200000: # Only include combinations of vehicles in our budget
# In our resulting_profits list, we shall include the combination of vehicles (within  our budget) (ID1, ID2, ID3, ID4) with it’s corresponding profit calculated. 
                    resulting_profits.append([ID1, ID2, ID3, ID4, profit])
# Now that the current combination of vehicles is either accepted or rejected, it’s important to take the last vehicle ID4 bought off our cost and profit measures.
                cost -= 30000*ID4 
                profit -= 16165.95*ID4
# Similarly, if we want to test a different combination of vehicles bought (with a different number of ID3s), we’ll have to strip the cost and profit of its previous number of ID3s bought
            cost -= 27000*ID3
            profit -= 14156.87*ID3
# Same as above, just with ID2 and ID1s
        cost -= 40000*ID2
        profit -= 12486.73*ID2
    cost -= 23000*ID1
    profit -= 13683.79*ID1 
# Now that we have considered all valid combinations of vehicles which can be bought within 
# our budget, we need to maximise profit, which can be done sorting in descending order
# on the profit index (5-1 = 4) and getting the first combination in the list.
print(sorted(resulting_profits, key = lambda x: x[4], reverse=True)[0])