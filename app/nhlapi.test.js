import { jest } from '@jest/globals';
import nhlapi from "./nhlapi.js";

describe("Check NHL Api", () => {
    const delay = ms => new Promise(resolve => setTimeout(resolve, ms));

    test("getSchedule should return the correct data.", async () => {
        const mockCallback = jest.fn(() => {
        });
        nhlapi.getSchedule(mockCallback);
    
        // wait 3s.
        await delay(3000);
    
        // should be called once.
        expect(mockCallback.mock.calls.length).toBe(1);
    
        const result = mockCallback.mock.calls[0][0];
    
        // result should be contained.
        expect(result).not.toBeUndefined();
    
        // dates Item should be contained.
        expect(result["dates"]).not.toBeUndefined();
    
        const dates = result["dates"];
        for (const dateItem of dates) {
            // check totalGames
            expect(dateItem["totalGames"]).not.toBeUndefined();
            // check games
            expect(dateItem["games"]).not.toBeUndefined();
        }
    });
    
    test("getFeedLive should return the correct data.", async () => {
        const testID = 2022020320;
        const mockCallback = jest.fn(() => {
        });
        nhlapi.getFeedLive(testID, mockCallback);
    
        // wait 3s.
        await delay(3000);
    
        // should be called once.
        expect(mockCallback.mock.calls.length).toBe(1);
    
        const result = mockCallback.mock.calls[0][0];
    
        // result should be contained.
        expect(result).not.toBeUndefined();
    
        // check gamePk
        expect(result["gamePk"]).toBe(testID);
    
        // check gameData
        expect(result["gameData"]).not.toBeUndefined();
    
        // check liveData
        expect(result["liveData"]).not.toBeUndefined();
    });
});