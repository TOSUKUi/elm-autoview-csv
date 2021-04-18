module Tests exposing (..)

import Expect
import File exposing (File)
import Main exposing (..)
import Test exposing (..)



-- Check out https://package.elm-lang.org/packages/elm-explorations/test/latest to learn more about testing in Elm!


all : Test
all =
    describe "A Test Suite"
        [ test "Addition" <|
            \_ ->
                Expect.equal 10 (3 + 7)
        , test "String.left" <|
            \_ ->
                Expect.equal "a" (String.left 1 "abcdefg")
        , test "This test should fail" <|
            \_ ->
                parseAutoview test_input
                    |> Expect.equal test_output
        ]


test_input : String
test_input =
    "_n\t_PER\t_BASE\tStart Year\tStart Month\tStart Day\tEnd Year\tEnd Month\tEnd Day\t_LONG\t_SHORT\t_L_OPEN_H\t_L_CLOSE_H\t_S_OPEN_H\t_S_CLOSE_H\n2017\t1\t1\t2017\t1\t1\t2100\t1\t1\tclose\t44\t26\t2.8\ttrue\t1\n\nInitial Capital\tBase Currency\tPyramiding\tAllow Up To Orders\tOrder Size\tOrder Type\tRecalculate After Order filled\tRecalculate On Every Tick\tVerify Price For Limit Orders\tSlippage\tCommission\tCommission Type\nNONE\t0\tfalse\tfalse\t100000\t\tfalse\t0\tfixed\tpercent\tfalse\t0\n\nNet Profit\tTotal Closed Trades\tPercent Profitable\tProfit Factor\tMax Drawdown\tAvg Trade\tAvg # Bars in Trades\n51528\t109\t0.5046\t3.449\t-5582.5\t472.7\t54\n\n\tAll\tLong\tShort\nNet Profit\t51528\t51743.5\t-215.5\nGross Profit\t72572.5\t72572.5\t0\nGross Loss\t-21044.5\t-20829\t-215.5\nMax Drawdown\t-5582.5\nBuy & Hold Return\t666703\t6.667\nSharpe Ratio\t0.699\nProfit Factor\t3.449\t3.484\t0\nMax Contracts Held\t1\t1\t1\nOpen PL\t0\t0\nCommission Paid\t0\nTotal Closed Trades\t109\t108\t1\nTotal Open Trades\t0\t0\t0\nNumber Winning Trades\t55\t55\t0\nNumber Losing Trades\t54\t53\t1\nPercent Profitable\t0.5046\t0.5093\t0\nAvg Trade\t472.7\t479.1\t-215.5\nAvg Win Trade\t1319.5\t1319.5\tN/A\nAvg Loss Trade\t-389.7\t-393\t-215.5\nRatio Avg Win / Avg Loss\t3.386\t3.358\t0\nLargest Winning Trade\t7862\t7862\tN/A\nLargest Losing Trade\t-3145.5\t-3145.5\t-215.5\nAvg # Bars in Trades\t54\t54\t13\nAvg # Bars in Winning Trades\t73\t73\t0\nAvg # Bars in Losing Trade\t35\t35\t13\n\nTrade #\tType\tSignal\tDate/Time\tPrice\tContracts\tProfit\tProfit %\tCum. Profit\tCum. Profit %\tRun-up\tRun-up %\tDrawdown\tDrawdown %\n1\tEntry Short\tShort\t2020-01-06 08:00:00\t7340\t\t\t\t\t\t\t\t\n\tExit Short\tLong\t2020-01-06 20:00:00\t7555.5\t1\t-215.5\t-0.0294\t-215.5\t-0.0022\t23\t0.0031\t-241.5\t-0.0329\n2\tEntry Long\tLong\t2020-01-06 20:00:00\t7555.5\t\t\t\t\t\t\t\t\n\tExit Long\tclose\t2020-01-09 03:00:00\t8075.5\t1\t520\t0.0688\t304.5\t0.0052\t906\t0.1199\t-62\t-0.0082\n3\tEntry Long\tLong\t2020-01-10 21:00:00\t7830\t\t\t\t\t\t\t\t\n\tExit Long\tclose\t2020-01-15 17:00:00\t8613.5\t1\t783.5\t0.1001\t1088\t0.0078\t1081\t0.1381\t-19.5\t-0.0025\n4\tEntry Long\tLong\t2020-01-17 16:00:00\t8872\t\t\t\t\t\t\t\t\n\tExit Long\tclose\t2020-01-19 22:00:00\t8627.5\t1\t-244.5\t-0.0276\t843.5\t-0.0024\t316\t0.0356\t-420\t-0.0473\n5\tEntry Long\tLong\t2020-01-22 07:00:00\t8725\t\t\t\t\t\t\t\t\n\tExit Long\tclose\t2020-01-23 06:00:00\t8650\t1\t-75\t-0.0086\t768.5\t-0.0007\t74\t0.0085\t-160\t-0.0183"


test_output : String
test_output =
    "Trade #,Type,Signal,Date/Time,Price,Contracts,Profit,Profit %,Cum. Profit,Cum. Profit %,Run-up,Run-up %,Drawdown,Drawdown %\n1,Entry Short,Short,2020-01-06 08:00:00,7340,,,,,,,,\n,Exit Short,Long,2020-01-06 20:00:00,7555.5,1,-215.5,-0.0294,-215.5,-0.0022,23,0.0031,-241.5,-0.0329\n2,Entry Long,Long,2020-01-06 20:00:00,7555.5,,,,,,,,\n,Exit Long,close,2020-01-09 03:00:00,8075.5,1,520,0.0688,304.5,0.0052,906,0.1199,-62,-0.0082\n3,Entry Long,Long,2020-01-10 21:00:00,7830,,,,,,,,\n,Exit Long,close,2020-01-15 17:00:00,8613.5,1,783.5,0.1001,1088,0.0078,1081,0.1381,-19.5,-0.0025\n4,Entry Long,Long,2020-01-17 16:00:00,8872,,,,,,,,\n,Exit Long,close,2020-01-19 22:00:00,8627.5,1,-244.5,-0.0276,843.5,-0.0024,316,0.0356,-420,-0.0473\n5,Entry Long,Long,2020-01-22 07:00:00,8725,,,,,,,,\n,Exit Long,close,2020-01-23 06:00:00,8650,1,-75,-0.0086,768.5,-0.0007,74,0.0085,-160,-0.0183"
