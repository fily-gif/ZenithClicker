return {
    {
        { prompt = 'activate',             target = 40,  text = "Activate 40 cards" },
        { prompt = 'activate',             target = 100, text = "Activate 100 cards" },
        { prompt = 'cancel',               target = 40,  text = "Cancel 40 cards" },
        { prompt = 'cancel',               target = 80,  text = "Cancel 80 cards" },
        { prompt = 'cancel',               target = 200, text = "Cancel 200 cards" },
        { prompt = 'flip',                 target = 20,  text = "Flip 20 times" },
        { prompt = 'flip',                 target = 80,  text = "Flip 80 times" },
        { prompt = 'flip',                 target = 300, text = "Flip 300 times" },
        { prompt = 'flip_single',          target = 10,  text = "Flip single card 10 times in a row" },
        { prompt = 'flip_single',          target = 20,  text = "Flip single card 20 times in a row" },
        { prompt = 'commit',               target = 6,   text = "Commit 6 times" },
        { prompt = 'commit',               target = 20,  text = "Commit 20 times" },
        { prompt = 'commit',               target = 40,  text = "Commit 40 times" },
        { prompt = 'commit_ex_row',        target = 3,   text = "Commit 3 times with EXPERT in a row" },
        { prompt = 'commit_dp',            target = 4,   text = "Commit 4 times with DUO" },
        { prompt = 'commit_in_row',        target = 5,   text = "Commit 5 times without INVISIBLE in a row" },
        { prompt = 'commit_0',             target = 4,   text = "Commit NOTHING 4 times" },
        { prompt = 'commit_0',             target = 6,   text = "Commit NOTHING 6 times" },
        { prompt = 'commit_0_row',         target = 3,   text = "Commit NOTHING 3 times in a row" },
        { prompt = 'commit_0_row',         target = 5,   text = "Commit NOTHING 5 times in a row" },
        { prompt = 'commit_no_conn',       target = 1,   text = "Commit without consecutive cards" },
        { prompt = 'commit_conn_2',        target = 1,   text = "Commit with 2 consecutive cards" },
        { prompt = 'commit_conn_3',        target = 1,   text = "Commit with 3 consecutive cards" },
        { prompt = 'commit_conn_4',        target = 1,   text = "Commit with 4 consecutive cards" },
        { prompt = 'commit_swamp_l',       target = 1,   text = "Commit SWAMP WATER LITE" },
        { prompt = 'commit_swamp',         target = 1,   text = "Commit SWAMP WATER" },
        { prompt = 'commit_reversed',      target = 1,   text = "Commit all cards which are not requested" },
        { prompt = 'pass_imperfect_row',   target = 3,   text = "Pass 3 times imperfectly in a row" },
        { prompt = 'pass_1',               target = 3,   text = "Pass 3 times with 1 cards" },
        { prompt = 'pass_2',               target = 4,   text = "Pass 4 times with 2 cards" },
        { prompt = 'pass_3',               target = 4,   text = "Pass 4 times with 3 cards" },
        { prompt = 'pass_imperfect_row',   target = 8,   text = "Pass 8 times imperfectly in a row" },
        { prompt = 'pass',                 target = 10,  text = "Pass 10 times" },
        { prompt = 'pass',                 target = 20,  text = "Pass 20 times" },
        { prompt = 'pass_AS',              target = 2,   text = "Pass 2 times with ALLSPIN" },
        { prompt = 'pass_MS',              target = 3,   text = "Pass 3 times with MESSY" },
        { prompt = 'pass_VL',              target = 4,   text = "Pass 4 times with VOLATILE" },
        { prompt = 'b2b',                  target = 4,   text = "Reach B2B x4" },
        { prompt = 'b2b',                  target = 8,   text = "Reach B2B x8" },
        { prompt = 'b2b_break_6',          target = 1,   text = "Break B2B x6" },
        { prompt = 'b2b_break_windup',     target = 1,   text = "Break B2B at a windup" },
        { prompt = 'b2b_break_windup3',    target = 1,   text = "Break B2B at a lv.3+ windup" },
        { prompt = 'send',                 target = 6,   text = "Send 6 attacks" },
        { prompt = 'send',                 target = 14,  text = "Send 14 attacks" },
        { prompt = 'pass_windup',          target = 1,   text = "Pass a windup" },
        { prompt = 'pass_windup3',         target = 1,   text = "Pass a lv.3+ windup" },
        { prompt = 'pass_windup_inb2b',    target = 2,   text = "Pass 2 windups during one B2B charge" },
        { prompt = 'pass_windup',          target = 4,   text = "Pass 4 windups" },
        { prompt = 'pass_windup_perfect',  target = 1,   text = "Pass a windup perfectly" },
        { prompt = 'pass_windup_inb2b',    target = 4,   text = "Pass 4 windups during one B2B charge" },
        { prompt = 'pass_windup_perfect',  target = 4,   text = "Pass 4 windups perfectly" },
        { prompt = 'pass_windup3_perfect', target = 1,   text = "Pass a lv.3+ windup perfectly" },
        { prompt = 'pass_windup3_perfect', target = 4,   text = "Pass 4 lv.3+ windups perfectly" },
        { prompt = 'take_dmg_time',        target = 2,   text = "Take time damage 2 times" },
        { prompt = 'take_dmg_time',        target = 4,   text = "Take time damage 4 times" },
        { prompt = 'take_dmg_time',        target = 6,   text = "Take time damage 6 times" },
        { prompt = 'keep_health_full',     target = 4,   text = "Keep health bar full for 4 seconds" },
        { prompt = 'keep_health_white',    target = 8,   text = "Keep health bar white for 8 seconds" },
        { prompt = 'keep_health_red',      target = 3,   text = "Keep health bar red for 3 seconds" },
        { prompt = 'keep_no_mouse',        target = 4,   text = "Don't touch mouse for 4 seconds" },
        { prompt = 'keep_no_commit',       target = 6,   text = "Don't commit for 6 seconds" },
        { prompt = 'keep_no_cancel',       target = 8,   text = "Don't cancel for 8 seconds" },
        { prompt = 'keep_no_keyboard',     target = 10,  text = "Don't touch keyboard for 10 seconds" },
        { prompt = 'keep_no_imperfect',    target = 14,  text = "Don't pass imperfectly for 14 seconds" },
        { prompt = 'keep_no_perfect',      target = 12,  text = "Don't pass perfectly for 12 seconds" },
        { prompt = 'keep_no_reset',        target = 16,  text = "Don't reset for 16 seconds" },
    },
}
