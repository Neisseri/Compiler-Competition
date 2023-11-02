// Generated from /home/ggx/home/antlr_works/install/src/frontend/SysY.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link SysYParser}.
 */
public interface SysYListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link SysYParser#compUnit}.
	 * @param ctx the parse tree
	 */
	void enterCompUnit(SysYParser.CompUnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#compUnit}.
	 * @param ctx the parse tree
	 */
	void exitCompUnit(SysYParser.CompUnitContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#compUnitItem}.
	 * @param ctx the parse tree
	 */
	void enterCompUnitItem(SysYParser.CompUnitItemContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#compUnitItem}.
	 * @param ctx the parse tree
	 */
	void exitCompUnitItem(SysYParser.CompUnitItemContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#decl}.
	 * @param ctx the parse tree
	 */
	void enterDecl(SysYParser.DeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#decl}.
	 * @param ctx the parse tree
	 */
	void exitDecl(SysYParser.DeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#constDecl}.
	 * @param ctx the parse tree
	 */
	void enterConstDecl(SysYParser.ConstDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#constDecl}.
	 * @param ctx the parse tree
	 */
	void exitConstDecl(SysYParser.ConstDeclContext ctx);
	/**
	 * Enter a parse tree produced by the {@code int}
	 * labeled alternative in {@link SysYParser#bType}.
	 * @param ctx the parse tree
	 */
	void enterInt(SysYParser.IntContext ctx);
	/**
	 * Exit a parse tree produced by the {@code int}
	 * labeled alternative in {@link SysYParser#bType}.
	 * @param ctx the parse tree
	 */
	void exitInt(SysYParser.IntContext ctx);
	/**
	 * Enter a parse tree produced by the {@code float}
	 * labeled alternative in {@link SysYParser#bType}.
	 * @param ctx the parse tree
	 */
	void enterFloat(SysYParser.FloatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code float}
	 * labeled alternative in {@link SysYParser#bType}.
	 * @param ctx the parse tree
	 */
	void exitFloat(SysYParser.FloatContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#constDef}.
	 * @param ctx the parse tree
	 */
	void enterConstDef(SysYParser.ConstDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#constDef}.
	 * @param ctx the parse tree
	 */
	void exitConstDef(SysYParser.ConstDefContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#varDecl}.
	 * @param ctx the parse tree
	 */
	void enterVarDecl(SysYParser.VarDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#varDecl}.
	 * @param ctx the parse tree
	 */
	void exitVarDecl(SysYParser.VarDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#varDef}.
	 * @param ctx the parse tree
	 */
	void enterVarDef(SysYParser.VarDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#varDef}.
	 * @param ctx the parse tree
	 */
	void exitVarDef(SysYParser.VarDefContext ctx);
	/**
	 * Enter a parse tree produced by the {@code init}
	 * labeled alternative in {@link SysYParser#initVal}.
	 * @param ctx the parse tree
	 */
	void enterInit(SysYParser.InitContext ctx);
	/**
	 * Exit a parse tree produced by the {@code init}
	 * labeled alternative in {@link SysYParser#initVal}.
	 * @param ctx the parse tree
	 */
	void exitInit(SysYParser.InitContext ctx);
	/**
	 * Enter a parse tree produced by the {@code initList}
	 * labeled alternative in {@link SysYParser#initVal}.
	 * @param ctx the parse tree
	 */
	void enterInitList(SysYParser.InitListContext ctx);
	/**
	 * Exit a parse tree produced by the {@code initList}
	 * labeled alternative in {@link SysYParser#initVal}.
	 * @param ctx the parse tree
	 */
	void exitInitList(SysYParser.InitListContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#funcDef}.
	 * @param ctx the parse tree
	 */
	void enterFuncDef(SysYParser.FuncDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#funcDef}.
	 * @param ctx the parse tree
	 */
	void exitFuncDef(SysYParser.FuncDefContext ctx);
	/**
	 * Enter a parse tree produced by the {@code funcType_}
	 * labeled alternative in {@link SysYParser#funcType}.
	 * @param ctx the parse tree
	 */
	void enterFuncType_(SysYParser.FuncType_Context ctx);
	/**
	 * Exit a parse tree produced by the {@code funcType_}
	 * labeled alternative in {@link SysYParser#funcType}.
	 * @param ctx the parse tree
	 */
	void exitFuncType_(SysYParser.FuncType_Context ctx);
	/**
	 * Enter a parse tree produced by the {@code void}
	 * labeled alternative in {@link SysYParser#funcType}.
	 * @param ctx the parse tree
	 */
	void enterVoid(SysYParser.VoidContext ctx);
	/**
	 * Exit a parse tree produced by the {@code void}
	 * labeled alternative in {@link SysYParser#funcType}.
	 * @param ctx the parse tree
	 */
	void exitVoid(SysYParser.VoidContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#funcFParams}.
	 * @param ctx the parse tree
	 */
	void enterFuncFParams(SysYParser.FuncFParamsContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#funcFParams}.
	 * @param ctx the parse tree
	 */
	void exitFuncFParams(SysYParser.FuncFParamsContext ctx);
	/**
	 * Enter a parse tree produced by the {@code scalarParam}
	 * labeled alternative in {@link SysYParser#funcFParam}.
	 * @param ctx the parse tree
	 */
	void enterScalarParam(SysYParser.ScalarParamContext ctx);
	/**
	 * Exit a parse tree produced by the {@code scalarParam}
	 * labeled alternative in {@link SysYParser#funcFParam}.
	 * @param ctx the parse tree
	 */
	void exitScalarParam(SysYParser.ScalarParamContext ctx);
	/**
	 * Enter a parse tree produced by the {@code arrayParam}
	 * labeled alternative in {@link SysYParser#funcFParam}.
	 * @param ctx the parse tree
	 */
	void enterArrayParam(SysYParser.ArrayParamContext ctx);
	/**
	 * Exit a parse tree produced by the {@code arrayParam}
	 * labeled alternative in {@link SysYParser#funcFParam}.
	 * @param ctx the parse tree
	 */
	void exitArrayParam(SysYParser.ArrayParamContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(SysYParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(SysYParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#blockItem}.
	 * @param ctx the parse tree
	 */
	void enterBlockItem(SysYParser.BlockItemContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#blockItem}.
	 * @param ctx the parse tree
	 */
	void exitBlockItem(SysYParser.BlockItemContext ctx);
	/**
	 * Enter a parse tree produced by the {@code assign}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterAssign(SysYParser.AssignContext ctx);
	/**
	 * Exit a parse tree produced by the {@code assign}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitAssign(SysYParser.AssignContext ctx);
	/**
	 * Enter a parse tree produced by the {@code exprStmt}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterExprStmt(SysYParser.ExprStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code exprStmt}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitExprStmt(SysYParser.ExprStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code blockStmt}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterBlockStmt(SysYParser.BlockStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code blockStmt}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitBlockStmt(SysYParser.BlockStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ifElse}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterIfElse(SysYParser.IfElseContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ifElse}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitIfElse(SysYParser.IfElseContext ctx);
	/**
	 * Enter a parse tree produced by the {@code while}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterWhile(SysYParser.WhileContext ctx);
	/**
	 * Exit a parse tree produced by the {@code while}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitWhile(SysYParser.WhileContext ctx);
	/**
	 * Enter a parse tree produced by the {@code break}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterBreak(SysYParser.BreakContext ctx);
	/**
	 * Exit a parse tree produced by the {@code break}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitBreak(SysYParser.BreakContext ctx);
	/**
	 * Enter a parse tree produced by the {@code continue}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterContinue(SysYParser.ContinueContext ctx);
	/**
	 * Exit a parse tree produced by the {@code continue}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitContinue(SysYParser.ContinueContext ctx);
	/**
	 * Enter a parse tree produced by the {@code return}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterReturn(SysYParser.ReturnContext ctx);
	/**
	 * Exit a parse tree produced by the {@code return}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitReturn(SysYParser.ReturnContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void enterExp(SysYParser.ExpContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void exitExp(SysYParser.ExpContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void enterCond(SysYParser.CondContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void exitCond(SysYParser.CondContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#lVal}.
	 * @param ctx the parse tree
	 */
	void enterLVal(SysYParser.LValContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#lVal}.
	 * @param ctx the parse tree
	 */
	void exitLVal(SysYParser.LValContext ctx);
	/**
	 * Enter a parse tree produced by the {@code primaryExp_}
	 * labeled alternative in {@link SysYParser#primaryExp}.
	 * @param ctx the parse tree
	 */
	void enterPrimaryExp_(SysYParser.PrimaryExp_Context ctx);
	/**
	 * Exit a parse tree produced by the {@code primaryExp_}
	 * labeled alternative in {@link SysYParser#primaryExp}.
	 * @param ctx the parse tree
	 */
	void exitPrimaryExp_(SysYParser.PrimaryExp_Context ctx);
	/**
	 * Enter a parse tree produced by the {@code lValExpr}
	 * labeled alternative in {@link SysYParser#primaryExp}.
	 * @param ctx the parse tree
	 */
	void enterLValExpr(SysYParser.LValExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code lValExpr}
	 * labeled alternative in {@link SysYParser#primaryExp}.
	 * @param ctx the parse tree
	 */
	void exitLValExpr(SysYParser.LValExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code decIntConst}
	 * labeled alternative in {@link SysYParser#intConst}.
	 * @param ctx the parse tree
	 */
	void enterDecIntConst(SysYParser.DecIntConstContext ctx);
	/**
	 * Exit a parse tree produced by the {@code decIntConst}
	 * labeled alternative in {@link SysYParser#intConst}.
	 * @param ctx the parse tree
	 */
	void exitDecIntConst(SysYParser.DecIntConstContext ctx);
	/**
	 * Enter a parse tree produced by the {@code octIntConst}
	 * labeled alternative in {@link SysYParser#intConst}.
	 * @param ctx the parse tree
	 */
	void enterOctIntConst(SysYParser.OctIntConstContext ctx);
	/**
	 * Exit a parse tree produced by the {@code octIntConst}
	 * labeled alternative in {@link SysYParser#intConst}.
	 * @param ctx the parse tree
	 */
	void exitOctIntConst(SysYParser.OctIntConstContext ctx);
	/**
	 * Enter a parse tree produced by the {@code hexIntConst}
	 * labeled alternative in {@link SysYParser#intConst}.
	 * @param ctx the parse tree
	 */
	void enterHexIntConst(SysYParser.HexIntConstContext ctx);
	/**
	 * Exit a parse tree produced by the {@code hexIntConst}
	 * labeled alternative in {@link SysYParser#intConst}.
	 * @param ctx the parse tree
	 */
	void exitHexIntConst(SysYParser.HexIntConstContext ctx);
	/**
	 * Enter a parse tree produced by the {@code decFloatConst}
	 * labeled alternative in {@link SysYParser#floatConst}.
	 * @param ctx the parse tree
	 */
	void enterDecFloatConst(SysYParser.DecFloatConstContext ctx);
	/**
	 * Exit a parse tree produced by the {@code decFloatConst}
	 * labeled alternative in {@link SysYParser#floatConst}.
	 * @param ctx the parse tree
	 */
	void exitDecFloatConst(SysYParser.DecFloatConstContext ctx);
	/**
	 * Enter a parse tree produced by the {@code hexFloatConst}
	 * labeled alternative in {@link SysYParser#floatConst}.
	 * @param ctx the parse tree
	 */
	void enterHexFloatConst(SysYParser.HexFloatConstContext ctx);
	/**
	 * Exit a parse tree produced by the {@code hexFloatConst}
	 * labeled alternative in {@link SysYParser#floatConst}.
	 * @param ctx the parse tree
	 */
	void exitHexFloatConst(SysYParser.HexFloatConstContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#number}.
	 * @param ctx the parse tree
	 */
	void enterNumber(SysYParser.NumberContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#number}.
	 * @param ctx the parse tree
	 */
	void exitNumber(SysYParser.NumberContext ctx);
	/**
	 * Enter a parse tree produced by the {@code unaryExp_}
	 * labeled alternative in {@link SysYParser#unaryExp}.
	 * @param ctx the parse tree
	 */
	void enterUnaryExp_(SysYParser.UnaryExp_Context ctx);
	/**
	 * Exit a parse tree produced by the {@code unaryExp_}
	 * labeled alternative in {@link SysYParser#unaryExp}.
	 * @param ctx the parse tree
	 */
	void exitUnaryExp_(SysYParser.UnaryExp_Context ctx);
	/**
	 * Enter a parse tree produced by the {@code call}
	 * labeled alternative in {@link SysYParser#unaryExp}.
	 * @param ctx the parse tree
	 */
	void enterCall(SysYParser.CallContext ctx);
	/**
	 * Exit a parse tree produced by the {@code call}
	 * labeled alternative in {@link SysYParser#unaryExp}.
	 * @param ctx the parse tree
	 */
	void exitCall(SysYParser.CallContext ctx);
	/**
	 * Enter a parse tree produced by the {@code unaryAdd}
	 * labeled alternative in {@link SysYParser#unaryExp}.
	 * @param ctx the parse tree
	 */
	void enterUnaryAdd(SysYParser.UnaryAddContext ctx);
	/**
	 * Exit a parse tree produced by the {@code unaryAdd}
	 * labeled alternative in {@link SysYParser#unaryExp}.
	 * @param ctx the parse tree
	 */
	void exitUnaryAdd(SysYParser.UnaryAddContext ctx);
	/**
	 * Enter a parse tree produced by the {@code unarySub}
	 * labeled alternative in {@link SysYParser#unaryExp}.
	 * @param ctx the parse tree
	 */
	void enterUnarySub(SysYParser.UnarySubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code unarySub}
	 * labeled alternative in {@link SysYParser#unaryExp}.
	 * @param ctx the parse tree
	 */
	void exitUnarySub(SysYParser.UnarySubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code not}
	 * labeled alternative in {@link SysYParser#unaryExp}.
	 * @param ctx the parse tree
	 */
	void enterNot(SysYParser.NotContext ctx);
	/**
	 * Exit a parse tree produced by the {@code not}
	 * labeled alternative in {@link SysYParser#unaryExp}.
	 * @param ctx the parse tree
	 */
	void exitNot(SysYParser.NotContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#stringConst}.
	 * @param ctx the parse tree
	 */
	void enterStringConst(SysYParser.StringConstContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#stringConst}.
	 * @param ctx the parse tree
	 */
	void exitStringConst(SysYParser.StringConstContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#funcRParam}.
	 * @param ctx the parse tree
	 */
	void enterFuncRParam(SysYParser.FuncRParamContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#funcRParam}.
	 * @param ctx the parse tree
	 */
	void exitFuncRParam(SysYParser.FuncRParamContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#funcRParams}.
	 * @param ctx the parse tree
	 */
	void enterFuncRParams(SysYParser.FuncRParamsContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#funcRParams}.
	 * @param ctx the parse tree
	 */
	void exitFuncRParams(SysYParser.FuncRParamsContext ctx);
	/**
	 * Enter a parse tree produced by the {@code div}
	 * labeled alternative in {@link SysYParser#mulExp}.
	 * @param ctx the parse tree
	 */
	void enterDiv(SysYParser.DivContext ctx);
	/**
	 * Exit a parse tree produced by the {@code div}
	 * labeled alternative in {@link SysYParser#mulExp}.
	 * @param ctx the parse tree
	 */
	void exitDiv(SysYParser.DivContext ctx);
	/**
	 * Enter a parse tree produced by the {@code mod}
	 * labeled alternative in {@link SysYParser#mulExp}.
	 * @param ctx the parse tree
	 */
	void enterMod(SysYParser.ModContext ctx);
	/**
	 * Exit a parse tree produced by the {@code mod}
	 * labeled alternative in {@link SysYParser#mulExp}.
	 * @param ctx the parse tree
	 */
	void exitMod(SysYParser.ModContext ctx);
	/**
	 * Enter a parse tree produced by the {@code mul}
	 * labeled alternative in {@link SysYParser#mulExp}.
	 * @param ctx the parse tree
	 */
	void enterMul(SysYParser.MulContext ctx);
	/**
	 * Exit a parse tree produced by the {@code mul}
	 * labeled alternative in {@link SysYParser#mulExp}.
	 * @param ctx the parse tree
	 */
	void exitMul(SysYParser.MulContext ctx);
	/**
	 * Enter a parse tree produced by the {@code mulExp_}
	 * labeled alternative in {@link SysYParser#mulExp}.
	 * @param ctx the parse tree
	 */
	void enterMulExp_(SysYParser.MulExp_Context ctx);
	/**
	 * Exit a parse tree produced by the {@code mulExp_}
	 * labeled alternative in {@link SysYParser#mulExp}.
	 * @param ctx the parse tree
	 */
	void exitMulExp_(SysYParser.MulExp_Context ctx);
	/**
	 * Enter a parse tree produced by the {@code addExp_}
	 * labeled alternative in {@link SysYParser#addExp}.
	 * @param ctx the parse tree
	 */
	void enterAddExp_(SysYParser.AddExp_Context ctx);
	/**
	 * Exit a parse tree produced by the {@code addExp_}
	 * labeled alternative in {@link SysYParser#addExp}.
	 * @param ctx the parse tree
	 */
	void exitAddExp_(SysYParser.AddExp_Context ctx);
	/**
	 * Enter a parse tree produced by the {@code add}
	 * labeled alternative in {@link SysYParser#addExp}.
	 * @param ctx the parse tree
	 */
	void enterAdd(SysYParser.AddContext ctx);
	/**
	 * Exit a parse tree produced by the {@code add}
	 * labeled alternative in {@link SysYParser#addExp}.
	 * @param ctx the parse tree
	 */
	void exitAdd(SysYParser.AddContext ctx);
	/**
	 * Enter a parse tree produced by the {@code sub}
	 * labeled alternative in {@link SysYParser#addExp}.
	 * @param ctx the parse tree
	 */
	void enterSub(SysYParser.SubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code sub}
	 * labeled alternative in {@link SysYParser#addExp}.
	 * @param ctx the parse tree
	 */
	void exitSub(SysYParser.SubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code geq}
	 * labeled alternative in {@link SysYParser#relExp}.
	 * @param ctx the parse tree
	 */
	void enterGeq(SysYParser.GeqContext ctx);
	/**
	 * Exit a parse tree produced by the {@code geq}
	 * labeled alternative in {@link SysYParser#relExp}.
	 * @param ctx the parse tree
	 */
	void exitGeq(SysYParser.GeqContext ctx);
	/**
	 * Enter a parse tree produced by the {@code lt}
	 * labeled alternative in {@link SysYParser#relExp}.
	 * @param ctx the parse tree
	 */
	void enterLt(SysYParser.LtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code lt}
	 * labeled alternative in {@link SysYParser#relExp}.
	 * @param ctx the parse tree
	 */
	void exitLt(SysYParser.LtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code relExp_}
	 * labeled alternative in {@link SysYParser#relExp}.
	 * @param ctx the parse tree
	 */
	void enterRelExp_(SysYParser.RelExp_Context ctx);
	/**
	 * Exit a parse tree produced by the {@code relExp_}
	 * labeled alternative in {@link SysYParser#relExp}.
	 * @param ctx the parse tree
	 */
	void exitRelExp_(SysYParser.RelExp_Context ctx);
	/**
	 * Enter a parse tree produced by the {@code leq}
	 * labeled alternative in {@link SysYParser#relExp}.
	 * @param ctx the parse tree
	 */
	void enterLeq(SysYParser.LeqContext ctx);
	/**
	 * Exit a parse tree produced by the {@code leq}
	 * labeled alternative in {@link SysYParser#relExp}.
	 * @param ctx the parse tree
	 */
	void exitLeq(SysYParser.LeqContext ctx);
	/**
	 * Enter a parse tree produced by the {@code gt}
	 * labeled alternative in {@link SysYParser#relExp}.
	 * @param ctx the parse tree
	 */
	void enterGt(SysYParser.GtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code gt}
	 * labeled alternative in {@link SysYParser#relExp}.
	 * @param ctx the parse tree
	 */
	void exitGt(SysYParser.GtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code neq}
	 * labeled alternative in {@link SysYParser#eqExp}.
	 * @param ctx the parse tree
	 */
	void enterNeq(SysYParser.NeqContext ctx);
	/**
	 * Exit a parse tree produced by the {@code neq}
	 * labeled alternative in {@link SysYParser#eqExp}.
	 * @param ctx the parse tree
	 */
	void exitNeq(SysYParser.NeqContext ctx);
	/**
	 * Enter a parse tree produced by the {@code eq}
	 * labeled alternative in {@link SysYParser#eqExp}.
	 * @param ctx the parse tree
	 */
	void enterEq(SysYParser.EqContext ctx);
	/**
	 * Exit a parse tree produced by the {@code eq}
	 * labeled alternative in {@link SysYParser#eqExp}.
	 * @param ctx the parse tree
	 */
	void exitEq(SysYParser.EqContext ctx);
	/**
	 * Enter a parse tree produced by the {@code eqExp_}
	 * labeled alternative in {@link SysYParser#eqExp}.
	 * @param ctx the parse tree
	 */
	void enterEqExp_(SysYParser.EqExp_Context ctx);
	/**
	 * Exit a parse tree produced by the {@code eqExp_}
	 * labeled alternative in {@link SysYParser#eqExp}.
	 * @param ctx the parse tree
	 */
	void exitEqExp_(SysYParser.EqExp_Context ctx);
	/**
	 * Enter a parse tree produced by the {@code lAndExp_}
	 * labeled alternative in {@link SysYParser#lAndExp}.
	 * @param ctx the parse tree
	 */
	void enterLAndExp_(SysYParser.LAndExp_Context ctx);
	/**
	 * Exit a parse tree produced by the {@code lAndExp_}
	 * labeled alternative in {@link SysYParser#lAndExp}.
	 * @param ctx the parse tree
	 */
	void exitLAndExp_(SysYParser.LAndExp_Context ctx);
	/**
	 * Enter a parse tree produced by the {@code and}
	 * labeled alternative in {@link SysYParser#lAndExp}.
	 * @param ctx the parse tree
	 */
	void enterAnd(SysYParser.AndContext ctx);
	/**
	 * Exit a parse tree produced by the {@code and}
	 * labeled alternative in {@link SysYParser#lAndExp}.
	 * @param ctx the parse tree
	 */
	void exitAnd(SysYParser.AndContext ctx);
	/**
	 * Enter a parse tree produced by the {@code or}
	 * labeled alternative in {@link SysYParser#lOrExp}.
	 * @param ctx the parse tree
	 */
	void enterOr(SysYParser.OrContext ctx);
	/**
	 * Exit a parse tree produced by the {@code or}
	 * labeled alternative in {@link SysYParser#lOrExp}.
	 * @param ctx the parse tree
	 */
	void exitOr(SysYParser.OrContext ctx);
	/**
	 * Enter a parse tree produced by the {@code lOrExp_}
	 * labeled alternative in {@link SysYParser#lOrExp}.
	 * @param ctx the parse tree
	 */
	void enterLOrExp_(SysYParser.LOrExp_Context ctx);
	/**
	 * Exit a parse tree produced by the {@code lOrExp_}
	 * labeled alternative in {@link SysYParser#lOrExp}.
	 * @param ctx the parse tree
	 */
	void exitLOrExp_(SysYParser.LOrExp_Context ctx);
}