--[[
This snippet "TextAreaChatBox" substitutes the TFM chat box as the area to show messages of the running script in Tribe house. This snippet is used because tfm.exec.chatMessage doesn't work in Tribe Houses.

- how to use it
insert this snippet into your script and call
	TextAreaChatBox.chatMessage(message, playerName)
instead of
	tfm.exec.chatMessage(message, playerName)

The table TextAreaChatBox must be loaded before the first call of TextAreaChatBox.chatMessage() in your script.

- example
TextAreaChatBox = {...}
TextAreaChatBox.chatMessage("Chat Box for Tribe House", nil)

]]

TextAreaChatBox = {
	ID = 123,	-- ID of the textArea used as a chat box
	X = 10,
	Y = 30,
	WIDTh = 500,
	HEIGHT = 150,
	MAX_MESSAGES = 10, -- The maximum number of messages stored in the chat box
	BACKGROUND_COLOR = 0x3E2C1D,	-- background color of the chat box
	BACKGROUND_ALPHA = 0.3,	-- opacity of the chat box
	DEFAULT_TEXT_COLOR = "#FFFFFF", -- the default text color in the chat box. in the normal chat area of TFM, it's "#6C77C1".

	chatMessage =
		function(message, name)
			if not name then
				for name, player in pairs(tfm.get.room.playerList) do
					TextAreaChatBox.chatMessage(message, name);
				end
			else
				local messages = TextAreaChatBox.messages[name];
				if not messages then
					messages = {};
					TextAreaChatBox.messages[name] = messages;
				end
				if #messages == TextAreaChatBox.MAX_MESSAGES then
					table.remove(messages, 1);
				end
				table.insert(messages, ([[<font color="%s">%s</font>]]):format(TextAreaChatBox.DEFAULT_TEXT_COLOR, message));
				ui.addTextArea(TextAreaChatBox.ID, table.concat(messages, "<br>"), name, 
					TextAreaChatBox.X,
					TextAreaChatBox.Y,
					TextAreaChatBox.WIDTh,
					TextAreaChatBox.HEIGHT,
					TextAreaChatBox.BACKGROUND_COLOR,
					TextAreaChatBox.BACKGROUND_COLOR,
					TextAreaChatBox.BACKGROUND_ALPHA,
					true);
			end
		end,

	messages = {}
}