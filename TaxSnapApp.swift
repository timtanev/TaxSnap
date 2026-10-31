
import SwiftUI
import Charts

struct BankAccount: Identifiable {
    let id = UUID()
    let name: String
    let balance: Double
    let color: Color
    let lastSync: String
}

struct Transaction: Identifiable {
    let id = UUID()
    let date: String
    let description: String
    let amount: Double
    var explained: Bool
    var category: String
}

struct Invoice: Identifiable {
    let id = UUID()
    let number: String
    let client: String
    let amount: Double
    let status: String
    let dueDate: String
}

struct TaxSnapApp: View {
    @State private var selectedTab = 0
    @State private var showConnectBank = false
    @State private var showCreateInvoice = false
    
    let bankAccounts = [
        BankAccount(name: "Monzo Business", balance: 7450.00, color: .orange, lastSync: "Today 8:42 AM"),
        BankAccount(name: "Starling Bank", balance: 3200.00, color: .purple, lastSync: "Today 8:42 AM"),
        BankAccount(name: "NatWest", balance: 1800.00, color: .red, lastSync: "Yesterday")
    ]
    
    let transactions = [
        Transaction(date: "30 Oct", description: "Stripe Payout - Client Project", amount: 1200.00, explained: false, category: "Sales"),
        Transaction(date: "29 Oct", description: "Adobe Creative Cloud", amount: -52.99, explained: true, category: "Software"),
        Transaction(date: "28 Oct", description: "GoCardless - Invoice #1042", amount: 850.00, explained: false, category: "Sales"),
        Transaction(date: "27 Oct", description: "Trainline - London Meeting", amount: -34.20, explained: true, category: "Travel")
    ]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // OVERVIEW TAB
            NavigationView {
                ScrollView {
                    VStack(spacing: 16) {
                        // Cashflow Card
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Cashflow Forecast").font(.headline)
                                Spacer()
                                Image(systemName: "chart.line.uptrend.xyaxis").foregroundColor(.green)
                            }
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("£12,450").font(.title2).bold()
                                    Text("Current balance").font(.caption).foregroundColor(.secondary)
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("+ £2,100").font(.subheadline).bold().foregroundColor(.green)
                                    Text("Next 30 days").font(.caption).foregroundColor(.secondary)
                                }
                            }
                            // Simple bar representation
                            HStack(spacing: 4) {
                                ForEach(0..<12) { i in
                                    RoundedRectangle(cornerRadius: 2)
                                        .fill(i < 8 ? Color.green.opacity(0.7) : Color.gray.opacity(0.3))
                                        .frame(height: CGFloat(20 + i*3))
                                }
                            }.frame(height: 60)
                        }
                        .padding().background(Color(.systemBackground)).cornerRadius(16).shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
                        
                        // Bank Consent Warning - FreeAgent style
                        HStack(spacing: 12) {
                            Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.orange)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Bank consent expires in 12 days").font(.subheadline).bold()
                                Text("Re-authenticate Monzo to keep auto-importing").font(.caption).foregroundColor(.secondary)
                            }
                            Spacer()
                            Button("Fix") { }.font(.caption).bold().padding(.horizontal, 12).padding(.vertical, 6).background(Color.orange).foregroundColor(.white).cornerRadius(8)
                        }
                        .padding().background(Color.orange.opacity(0.1)).cornerRadius(12)
                        
                        // Quick Actions
                        HStack(spacing: 12) {
                            QuickActionButton(title: "Invoice", icon: "doc.text.fill", color: .blue) { showCreateInvoice = true }
                            QuickActionButton(title: "Expense", icon: "receipt.fill", color: .green) { }
                            QuickActionButton(title: "Bank", icon: "building.columns.fill", color: .purple) { showConnectBank = true }
                        }
                        
                        // Overdue
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Needs Attention").font(.headline)
                            ForEach(0..<2) { _ in
                                HStack {
                                    Circle().fill(Color.red).frame(width: 8, height: 8)
                                    Text("Invoice #1041 - £850 overdue by 5 days").font(.subheadline)
                                    Spacer()
                                    Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
                                }.padding(.vertical, 4)
                            }
                        }.padding().background(Color(.systemBackground)).cornerRadius(16)
                    }.padding()
                }
                .navigationTitle("TaxSnap")
                .background(Color(.systemGroupedBackground))
            }
            .tabItem { Label("Overview", systemImage: "chart.bar.fill") }.tag(0)
            
            // BANKING TAB
            NavigationView {
                List {
                    Section(header: Text("Connected via Open Banking")) {
                        ForEach(bankAccounts) { account in
                            HStack {
                                Circle().fill(account.color).frame(width: 40, height: 40).overlay(Text(account.name.prefix(1)).foregroundColor(.white).bold())
                                VStack(alignment: .leading) {
                                    Text(account.name).font(.subheadline).bold()
                                    Text("Last sync: \(account.lastSync)").font(.caption).foregroundColor(.secondary)
                                }
                                Spacer()
                                Text("£\(String(format: "%.2f", account.balance))").bold()
                            }
                        }
                    }
                    Section(header: HStack { Text("Transactions"); Spacer(); Text("Auto-imports daily").font(.caption2) }) {
                        ForEach(transactions) { tx in
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(tx.description).font(.subheadline).lineLimit(1)
                                    Text(tx.date).font(.caption).foregroundColor(.secondary)
                                }
                                Spacer()
                                VStack(alignment: .trailing, spacing: 4) {
                                    Text(tx.amount > 0 ? "+£\(String(format: "%.2f", tx.amount))" : "-£\(String(format: "%.2f", abs(tx.amount)))")
                                        .font(.subheadline).bold().foregroundColor(tx.amount > 0 ? .green : .primary)
                                    if tx.explained {
                                        Text(tx.category).font(.caption2).padding(.horizontal, 6).padding(.vertical, 2).background(Color.green.opacity(0.2)).cornerRadius(4)
                                    } else {
                                        Button("Explain") { }.font(.caption2).bold().padding(.horizontal, 8).padding(.vertical, 4).background(Color.blue).foregroundColor(.white).cornerRadius(6)
                                    }
                                }
                            }.padding(.vertical, 4)
                        }
                    }
                }
                .navigationTitle("Banking")
                .toolbar { Button(action: { showConnectBank = true }) { Label("Connect", systemImage: "plus") } }
            }
            .tabItem { Label("Banking", systemImage: "building.columns") }.tag(1)
            
            // INVOICES TAB
            NavigationView {
                List {
                    Section(header: Text("Needs Action (2)")) {
                        ForEach(0..<2) { i in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Invoice #104\(i+1)").bold().font(.subheadline)
                                    Text("Client Co Ltd - Due 28 Oct").font(.caption).foregroundColor(.secondary)
                                }
                                Spacer()
                                Text("£850.00").bold()
                                Circle().fill(Color.red).frame(width: 10, height: 10)
                            }
                        }
                    }
                    Section(header: Text("All Invoices")) {
                        ForEach(0..<5) { i in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("INV-2025-\(100+i)").font(.subheadline)
                                    Text(["Paid","Sent","Draft"][i%3]).font(.caption).foregroundColor(.secondary)
                                }
                                Spacer()
                                Text("£\(450 + i*120)").font(.subheadline)
                            }
                        }
                    }
                }
                .navigationTitle("Invoicing")
                .toolbar { Button("New Invoice") { showCreateInvoice = true } }
            }
            .tabItem { Label("Invoices", systemImage: "doc.text") }.tag(2)
            
            // EXPENSES TAB
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(0..<4) { i in
                            VStack(spacing: 8) {
                                RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2)).frame(height: 100).overlay(Image(systemName: "doc.richtext").font(.title))
                                Text("Receipt \(i+1)").font(.caption).bold()
                                Text("£\(12.5 * Double(i+1))").font(.caption2)
                            }.padding(8).background(Color(.systemBackground)).cornerRadius(12)
                        }
                    }.padding()
                }.navigationTitle("Expenses").background(Color(.systemGroupedBackground))
            }
            .tabItem { Label("Expenses", systemImage: "receipt") }.tag(3)
            
            // TAXES TAB
            NavigationView {
                List {
                    Section(header: Text("TaxSnap Calculator (Current)")) {
                        NavigationLink(destination: Text("Your 1099 Calculator WebView here")) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("1099 Tax Estimator").bold()
                                Text("Federal + SE 15.3% + State").font(.caption).foregroundColor(.secondary)
                            }
                        }
                    }
                    Section(header: Text("UK MTD - New like FreeAgent")) {
                        HStack {
                            Image(systemName: "checkmark.shield.fill").foregroundColor(.green)
                            VStack(alignment: .leading) {
                                Text("VAT Return").font(.subheadline).bold()
                                Text("Q3 ready to file to HMRC").font(.caption).foregroundColor(.secondary)
                            }
                            Spacer()
                            Button("File") { }.buttonStyle(.borderedProminent).controlSize(.small)
                        }
                        HStack {
                            Image(systemName: "calendar").foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text("Self Assessment").font(.subheadline).bold()
                                Text("Due 31 Jan 2026 - £1,240 estimated").font(.caption).foregroundColor(.secondary)
                            }
                        }
                    }
                }.navigationTitle("Taxes")
            }
            .tabItem { Label("Taxes", systemImage: "sterlingsign.circle") }.tag(4)
        }
        .sheet(isPresented: $showConnectBank) {
            VStack(spacing: 20) {
                Image(systemName: "building.columns.fill").font(.largeTitle).foregroundColor(.blue)
                Text("Connect Bank via Open Banking").font(.title2).bold()
                Text("TaxSnap uses TrueLayer (FCA regulated) to securely connect to your bank. We never see your login.").multilineTextAlignment(.center).font(.subheadline).foregroundColor(.secondary).padding(.horizontal)
                VStack(alignment: .leading, spacing: 12) {
                    Label("Direct secure connection to bank", systemImage: "lock.shield")
                    Label("Auto-imports transactions daily", systemImage: "arrow.down.circle")
                    Label("90-day consent - you stay in control", systemImage: "clock")
                }.font(.subheadline).padding()
                Button("Continue to Bank") { showConnectBank = false }.buttonStyle(.borderedProminent).controlSize(.large)
                Button("Cancel", role: .cancel) { showConnectBank = false }.font(.subheadline)
            }.padding()
        }
        .sheet(isPresented: $showCreateInvoice) {
            VStack(spacing: 16) {
                Text("New Invoice - FreeAgent Style").font(.headline)
                TextField("Client Name", text: .constant("")).textFieldStyle(.roundedBorder)
                TextField("Amount £", text: .constant("")).textFieldStyle(.roundedBorder)
                Button("Create & Send") { showCreateInvoice = false }.buttonStyle(.borderedProminent)
            }.padding()
        }
    }
}

struct QuickActionButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon).font(.title3).foregroundColor(color)
                Text(title).font(.caption).bold()
            }.frame(maxWidth: .infinity).padding(.vertical, 16).background(Color(.systemBackground)).cornerRadius(12).shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    TaxSnapApp()
}
