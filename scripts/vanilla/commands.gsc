// Include base game scripts
#include maps/mp/_utility;
#include common_scripts/utility;

// Include custom clipstone zombies scripts
#include scripts/zm/clipstonezombies/account;
#include scripts/zm/clipstonezombies/leaderboards;
#include scripts/zm/clipstonezombies/statistics;
#include scripts/zm/clipstonezombies/information;
#include scripts/zm/clipstonezombies/staff;

onPlayerSay() {
    // Endon Endgame Or Disconnect
    level endon("end_game");
	self endon("disconnect");

    // Assign Prefix To A Variable
    prefix = ".";

    // Loop For Every Message
    for (;;) {
        // Waittill Player Sends A Message
        level waittill("say", message, player);

        // Set The Message To Lowercase
        message = toLower(message);

        // Check If Player Is Not In Intermission & Check If Correct Prefix
		if (!level.intermission && message[0] == prefix) {

            // Split Message
            args = strtok(message, " ");

            // Get Rid Of The . From The Command
            command = getSubStr(args[0], 1);

            // Switch Case For Running Commands On Different Cases
            switch(command) {
                // Account commands
                case "acc":
                case "account":
                    getAccount(player);
                    break;

                case "quit":
                    quit(player);
                    break;

                // Statistic commands
                case "lb":
                case "leaderboard":
                    getLeaderboards(player);
                    break;

                case "stats":
                    getStatistics(player);
                    break;

		        case "topstats":
		            getTopStatistics(player, args);
		            break;

                // Information commands
                case "rules":
                    rules(player);
                    break;

                case "help":
                    help(player, args);
                    break;

                // Staff Commands
                case "ban":
                    banPlayer(player, args);
                    break;

		        case "godmode":
		            godmode(player);
		            break;
            }
        }
    }
}
