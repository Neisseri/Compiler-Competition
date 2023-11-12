
// void CFG::build() {
//   for (auto &bb : func->bbs) {
//     bb->succ = {};
//     bb->prev = {};
//   }
//   for (auto &bb : func->bbs) {
//     if (bb->insns.empty())
//       continue;
//     auto &ins = bb->insns.back();
//     ir::insns::Jump *jmp = dynamic_cast<ir::insns::Jump *>(ins.get());
//     ir::insns::Branch *brh = dynamic_cast<ir::insns::Branch *>(ins.get());
//     ir::insns::Return *ret = dynamic_cast<ir::insns::Return *>(ins.get());
//     ir::insns::Switch *swi = dynamic_cast<ir::insns::Switch *>(ins.get());
//     auto &next = bb->succ;
//     if (jmp) {
//       next.insert(jmp->target);
//       jmp->target->prev.insert(bb.get());
//     } else if (brh) {
//       next.insert(brh->true_target);
//       next.insert(brh->false_target);
//       brh->true_target->prev.insert(bb.get());
//       brh->false_target->prev.insert(bb.get());
//     } else if (ret) {
//     } else if (swi) {
//       for (auto each : swi->targets) {
//         next.insert(each.second);
//         each.second->prev.insert(bb.get());
//       }
//       next.insert(swi->default_target);
//       swi->default_target->prev.insert(bb.get());
//     } else {
//       assert(false);
//     }
//   }
// }


// void CFG::remove_unreachable_bb() {
//   auto entry = func->bbs.front().get();
//   func->clear_visit();
//   vector<ir::BasicBlock *> stack;
//   stack.push_back(entry);
//   while (stack.size()) {
//     ir::BasicBlock *bb = stack.back();
//     stack.pop_back();
//     if (bb->visit) {
//       continue;
//     }
//     bb->visit = true;
//     for (auto suc : bb->succ) {
//       if (!suc->visit) {
//         stack.push_back(suc);
//       }
//     }
//   }
//   for (auto iter = func->bbs.begin(); iter != func->bbs.end();) {
//     if (iter->get()->visit) {
//       iter++;
//     } else {
//       auto bb = iter->get();
//       for (auto &inst : bb->insns) {
//         inst->remove_use_def();
//       }
//       for (auto suc : bb->succ) {
//         suc->prev.erase(bb);
//         for (auto &inst : suc->insns) {
//           TypeCase(phi, ir::insns::Phi *, inst.get()) {
//             if (phi->incoming.count(bb)) {
//               phi->remove_prev(bb);
//             }
//           }
//           else {
//             break;
//           }
//         }
//       }
//       for (auto pre : bb->prev) {
//         pre->succ.erase(bb);
//       }
//       iter = func->bbs.erase(iter);
//     }
//   }
// }
