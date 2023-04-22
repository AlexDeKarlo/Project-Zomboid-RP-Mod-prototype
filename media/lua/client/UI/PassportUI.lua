local UI

function CreatePassportUI(player)
	UI = NewUI();
	
    UI:addText("", getText("IGUI_Passport"), "Title", "Center");
    UI:nextLine();

	UI:addText("", getText("IGUI_Name_SurName"), _, "Center");
	UI:addText("", player:getFullName(), _, "Center");
    UI:nextLine();
	
	UI:addText("", getText("IGUI_TimeInState"), _, "Center");
	UI:addText("", player:getTimeSurvived(), _, "Center");
    UI:nextLine();

	UI:addText("", getText("IGUI_Photo"), _, "Center");
    UI:addImage("image1", "media/ui/zomboidIcon128.png")

    UI:setBorderToAllElements(true);                        -- Add border
    UI:saveLayout();                                    -- Save and create the UI
end