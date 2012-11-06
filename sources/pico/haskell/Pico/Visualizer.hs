module Pico.Visualizer where

import Pico.AbstractSyntax
import Pico.FlowChart
import Pico.PrettyPrinter
import Control.Monad.State

-- Maintain current label in state
type Visualizer = State Int FlowChart

-- Generate an id
nextId :: State Int String
nextId = do
            i <- get
            let i' = i+1
            put i'
            return ("id" ++ show i')

-- Addition on flowcharts
add :: FlowChart -> FlowChart -> FlowChart
add (bs1, as1) (bs2, as2) = (bs1 ++ bs2, as1 ++ as2)

toFlowChart :: Program -> String -> IO ()
toFlowChart (_,ss) file = writeFlowChart main file
 where
  main = fst $ runState main' (0::Int)
  main' = do
             startId <- nextId
             endId <- nextId
             let start = (startId, Start)
             let end = (endId, End)
             (bs, as) <- stms (startId, FromStart) endId ss
             return ([start, end]++bs, as)
  stms from to (s@(Assign n e):ss)
   = do
        actId <- nextId
        let act = (actId, Activity (show (ppStm s)))
        (bs, as) <- stms (actId, FromActivity) to ss
        return ([act]++bs, [(from, actId)]++as)
  stms from to (IfStm c ss1 ss2:ss)
   = do
        decId <- nextId
        let dec = (decId, Decision (show (ppExpr c)))
        (bs1, as1) <- stms (decId, FromYes) to ss1
        (bs2, as2) <- stms (decId, FromNo) to ss2
        return ([dec]++bs1++bs2, [(from, decId)]++as1++as2)
  stms from@(fromId, fromType) to (While c body:ss)
   = do
        decId <- nextId
        let dec = (decId, Decision (show (ppExpr c)))
        (bs, as) <- stms (decId, FromYes) fromId body
        return ( 
                 [dec]++bs,
                 [(from, decId)]++as++[((decId, FromNo), to)]
               )
  stms from to []
   = return ([], [(from, to)])
