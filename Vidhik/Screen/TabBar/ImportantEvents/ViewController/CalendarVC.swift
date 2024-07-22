//
//  CalendarVC.swift
//  Vidhik
//
//  Created by NumeroEins on 12/02/24.
//

import UIKit
import EventKit

class CalendarVC: UIViewController, KVKCalendarSettings, KVKCalendarDataModel {
    
    //MARK: =========================== IBOutlet ===========================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var reminderTableView: UITableView!
    @IBOutlet weak var timeSlotTableView: UITableView!
    @IBOutlet weak var timeSlotTableHeight: NSLayoutConstraint!
    @IBOutlet weak var reminderTableHeight: NSLayoutConstraint!
    
    // MARK: - IBOutlets Properties CalenderView
    @IBOutlet weak var calendarContainerView: UIView!
    @IBOutlet weak var calenderBackWrodButton: UIButton!
    @IBOutlet weak var calenderForWrodButton: UIButton!
    @IBOutlet weak var showSelectedDateLabel: UILabel!
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var weekButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    @IBOutlet weak var todayView: UIView!
    @IBOutlet weak var weekView: UIView!
    @IBOutlet weak var monthView: UIView!
    
    // MARK: =========================== Created Calender Instance Properties ===========================
    var selectedType: SelectedCalendarType = .month
    var selctedMonthDate = Date()
    var todayDaySelection: String?
    
    // MARK: =========================== Events ===========================
    var events = [Event]() {
        didSet {
            calendarView.reloadData()
        }
    }
    
    var selectDate = Date()
    
    var style: Style {
        createCalendarStyle()
    }
    
    var eventViewer = EventViewer()
    private var calendarView: KVKCalendarView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        selectDate = defaultDate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: =========================== View Controller Life Cycle Methods ===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.setUpNaviagtionBar()
        timeSlotTableView.beginUpdates()
        timeSlotTableView.endUpdates()
        calenderLoadEventMethod()
        self.timeSlotTableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 37, height: 400)
        calendarView.reloadFrame(frame)
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Calendar"
    }
    
    // MARK: =========================== Private Method On Cell Nib Register ===========================
    private func setUpTableView() {
        self.reminderTableView.dataSource = self
        self.reminderTableView.delegate = self
        self.reminderTableView.register(UINib(nibName: "ReminderTableViewCell", bundle: nil), forCellReuseIdentifier: "ReminderTableViewCell")
        
        self.timeSlotTableView.dataSource = self
        self.timeSlotTableView.delegate = self
        self.timeSlotTableView.register(UINib(nibName: "TimeSlotTableViewCell", bundle: nil), forCellReuseIdentifier: "TimeSlotTableViewCell")
    }
    
    
    // MARK: =========================== KVKCalender Back And Forword Button IBAction Methods ===========================
    @IBAction func backwordButtonAction(_ sender: UIButton) {
        previousAndNextSelection(type: .back)
    }
    
    @IBAction func forwordButtonAction(_ sender: UIButton) {
        previousAndNextSelection(type: .forward)
    }
    
    //MARK: =========================== KVKCalender Type Button IBAction Methods ===========================
    @IBAction func todayButtonAction(_ sender: UIButton) {
        manageCalenderType(type: .today)
    }
    
    @IBAction func weekButtonAction(_ sender: UIButton) {
        manageCalenderType(type: .week)
    }
    
    @IBAction func monthButtonAction(_ sender: UIButton) {
        manageCalenderType(type: .month)
    }
    
    //MARK: =========================== IBAction Methods ===========================
    @IBAction func btnAddEventAction(_ sender: UIButton) {
        let addEventVC = UIStoryboard(name: "ImportantEvents", bundle: nil) .instantiateViewController(identifier: "AddEventVC") as! AddEventVC
        self.navigationController?.pushViewController(addEventVC, animated: true)
    }
    
    @IBAction func btnAddAvailabilityAction(_ sender: UIButton) {
        let addAvailabilityVC = UIStoryboard(name: "ImportantEvents", bundle: nil) .instantiateViewController(identifier: "AddAvailabilityVC") as! AddAvailabilityVC
        self.navigationController?.pushViewController(addAvailabilityVC, animated: true)
    }
    
}

//MARK: =========================== UITableViewDelegate, UITableViewDataSource ===========================
extension CalendarVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == reminderTableView {
            return 5
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == reminderTableView {
            let cell = self.reminderTableView.dequeueReusableCell(withIdentifier: "ReminderTableViewCell", for: indexPath) as! ReminderTableViewCell
            reminderTableHeight.constant = reminderTableView.contentSize.height
            return cell
        } else {
            let cell = self.timeSlotTableView.dequeueReusableCell(withIdentifier: "TimeSlotTableViewCell", for: indexPath) as! TimeSlotTableViewCell
            DispatchQueue.main.async {
                self.timeSlotTableHeight.constant = self.timeSlotTableView.contentSize.height
            }
            cell.frame = timeSlotTableView.bounds
            cell.layoutIfNeeded()
            cell.slotCollectionView.reloadData()
            cell.collectionHeight.constant = cell.slotCollectionView.contentSize.height
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == reminderTableView {
            let addEventVC = UIStoryboard(name: "ImportantEvents", bundle: nil) .instantiateViewController(identifier: "AddEventVC") as! AddEventVC
            navigationController?.pushViewController(addEventVC, animated: true)
        }
    }
}

//MARK: =========================== Extension NavigationBar Delegate Methods ===========================
extension CalendarVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() {
        let vc = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC")as!NotificationVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigationSearchAction() {
        let vc = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchVC")as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func naviagtionProfileAction() {
        let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC")as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



// MARK: =========================== KVKCalendar DataSource Methods ===========================
extension CalendarVC: CalendarDataSource {
    func willSelectDate(_ date: Date, type: CalendarType) {
        print(date, type)
    }
    
    func eventsForCalendar(systemEvents: [EKEvent]) -> [Event] {
        // if you want to get a system events, you need to set style.systemCalendars = ["test"]
        handleEvents(systemEvents: systemEvents)
    }
    
    func willDisplayEventView(_ event: Event, frame: CGRect, date: Date?) -> EventViewGeneral? {
        handleCustomEventView(event: event, style: style, frame: frame)
    }
    
    func willDisplayEventViewer(date: Date, frame: CGRect) -> UIView? {
        eventViewer.frame = frame
        return eventViewer
    }
    
    func sizeForCell(_ date: Date?, type: CalendarType) -> CGSize? {
        handleSizeCell(type: type, stye: calendarView.style, view: view)
    }
}

// MARK: =========================== KVKCalendar Delegate Methods ===========================
extension CalendarVC: CalendarDelegate {
    func didChangeEvent(_ event: Event, start: Date?, end: Date?) {
        if let result = handleChangingEvent(event, start: start, end: end) {
            events.replaceSubrange(result.range, with: result.events)
        }
    }
    
    func didSelectDates(_ dates: [Date], type: CalendarType, frame: CGRect?) {
        selectDate = dates.first ?? Date()
        setupDateFormate(date: selectDate)
        calendarView.reloadData()
    }
    
    func didSelectEvent(_ event: Event, type: CalendarType, frame: CGRect?) {
        print(type, event)
        switch type {
        case .day:
            eventViewer.text = event.title.timeline
        default:
            break
        }
    }
    
    func didDeselectEvent(_ event: Event, animated: Bool) {
        print(event)
    }
    
    func didSelectMore(_ date: Date, frame: CGRect?) {
        print(date)
    }
    
    func didChangeViewerFrame(_ frame: CGRect) {
        eventViewer.reloadFrame(frame: frame)
    }
    
    func didAddNewEvent(_ event: Event, _ date: Date?) {
        if let newEvent = handleNewEvent(event, date: date) {
            events.append(newEvent)
        }
    }
}

// MARK: =========================== Created Extenion on Calender Suported Methods ===========================
extension CalendarVC {
    // MARK: - Private Method Calender Load Event
    private func calenderLoadEventMethod() {
        DispatchQueue.main.async {
            self.manageCalenderType(type: .month)
        }
        setupDateFormate(date: selectDate)
        loadEvents(dateFormat: style.timeSystem.format) { (events) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                self?.events = events
            }
        }
        setupCalender()
    }
    
    // MARK: =========================== Private Method Setup Calender ===========================
    private func setupCalender() {
        if let calendarView {
            calendarView.removeFromSuperview()
        }
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 37, height: 400)
        let calendar = KVKCalendarView(frame: frame, date: selectDate, style: style)
        calendar.delegate = self
        calendar.dataSource = self
        self.calendarView = calendar
        self.calendarContainerView.backgroundColor = .systemBackground
        self.calendarContainerView.addSubview(calendarView)
        calendarView.delegate = self
        calendarView.dataSource = self
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        // to track changing windows and theme of device
        loadEvents(dateFormat: style.timeSystem.format) { [weak self] (events) in
            if let style = self?.style {
                self?.calendarView.updateStyle(style)
            }
            self?.events = events
        }
    }
    
    // MARK: =========================== Private Instnace Method Cretaed Of RelaodCalenderStyle ===========================
    private func reloadCalendarStyle() {
        var updatedStyle = calendarView.style
        updatedStyle.timeSystem = calendarView.style.timeSystem == .twentyFour ? .twelve : .twentyFour
        calendarView.updateStyle(updatedStyle)
        calendarView.reloadData()
    }
    
    // MARK: =========================== Created Manage ArrowButton Method ===========================
    private func previousAndNextSelection(type: PreviousAndNext) {
        
        switch type {
        case .back:
            
            switch selectedType {
            case .today:
                calendarView.dayView.previousDate()
                calendarView.dayView.timelinePage.changePage(.previous)
                calendarView.reloadData()
                setupDateFormate(date: calendarView.dayView.dayViewPreviousDate ?? Date())
                
            case .week:
                calendarView.weekView.previousDate()
                calendarView.weekView.timelinePage.changePage(.previous)
                calendarView.reloadData()
                setupDateFormate(date: calendarView.weekView.weekViewPreviousDate ?? Date())
                
            case .month:
                selctedMonthDate = Calendar.current.date(byAdding: .month, value: -1, to: selctedMonthDate) ?? Date()
                self.calendarView.monthView.setDate(selctedMonthDate, animated: true)
                calendarView.style.month.isPagingEnabled = true
                setupDateFormate(date: selctedMonthDate)
                reloadCalendarStyle()
                calendarView.reloadData()
            }
            
        case .forward:
            
            switch selectedType {
                
            case .today:
                calendarView.dayView.nextDate()
                calendarView.dayView.timelinePage.changePage(.next)
                calendarView.reloadData()
                setupDateFormate(date: calendarView.dayView.dayViewNextDate ?? Date())
                
            case .week:
                calendarView.weekView.nextDate()
                calendarView.weekView.timelinePage.changePage(.next)
                calendarView.reloadData()
                setupDateFormate(date: calendarView.weekView.weekViewNextDate ?? Date())
                
            case .month:
                selctedMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: selctedMonthDate) ?? Date()
                self.calendarView.monthView.setDate(selctedMonthDate, animated: true)
                calendarView.style.month.isPagingEnabled = true
                reloadCalendarStyle()
                setupDateFormate(date: selctedMonthDate)
                calendarView.reloadData()
            }
        }
    }
    
    // MARK: =========================== Private Method DidSelect on Event Type like today, week and Month ===========================
    private func didSelect(eventType: SelectedCalendarType) {
        // Reset state
        [todayButton, weekButton, monthButton].forEach { button in
            button?.setTitleColor(.gray, for: .normal)
        }
        
        [todayView, weekView, monthView].forEach { eventView in
            eventView.backgroundColor = .clear
        }
        
        switch eventType {
        case .today:
            todayButton.setTitleColor(.blue, for: .normal)
            todayView.backgroundColor = .blue
            
        case .month:
            monthButton.setTitleColor(.blue, for: .normal)
            monthView.backgroundColor = .blue
            
        case .week:
            weekButton.setTitleColor(.blue, for: .normal)
            weekView.backgroundColor = .blue
        }
    }
    
    
    // MARK: =========================== KVKCalender Created Manged CalenderType Method ===========================
    private func manageCalenderType(type: SelectedCalendarType) {
        
        self.selectedType = type
        
        switch type {
        case .today:
            didSelect(eventType: .today)
            setupCalender()
            self.calendarView.set(type: .day, date: self.selectDate)
            calendarView.scrollTo(selectDate, animated: true)
            todayAllEvents()
            setupDateFormate(date: selectDate)
            calendarView.reloadData()
            
        case .week:
            didSelect(eventType: .week)
            setupCalender()
            setupDateFormate(date: selectDate)
            self.calendarView.set(type: .week, date: self.selectDate)
            self.calendarView.reloadData()
            
        case .month:
            didSelect(eventType: .month)
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                self.calendarView.reloadData()
            })
            setupCalender()
            self.calendarView.set(type: .month, date: self.selectDate)
            self.calendarView.scrollTo(self.selectDate, animated: true)
            reloadCalendarStyle()
            setupDateFormate(date: selectDate)
        }
    }
    
    // MARK: =========================== Private Method on Setup Date Formated ===========================
    private func setupDateFormate(date: Date) {
        let  formattedDateStr = "\(date)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        guard let formattedDate  =  dateFormatter.date(from: formattedDateStr) else { return }
        dateFormatter.dateFormat = "dd MMM, yyyy"
        let selectedDate =  dateFormatter.string(from: formattedDate)
        showSelectedDateLabel.text = selectedDate
    }
    
    // MARK:  =========================== Today Selction Method ===========================
    private func todayAllEvents() {
        selectDate = Date()
        calendarView.scrollTo(selectDate, animated: true)
        let  formattedDateStr = "\(selectDate)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        guard let formattedDate  =  dateFormatter.date(from: formattedDateStr) else { return }
        dateFormatter.dateFormat = "EEEE"
        let dateString12  =  dateFormatter.string(from: formattedDate)
        todayDaySelection = dateString12
        calendarView.reloadData()
    }
    
    // MARK: =========================== KVKCalender Created CalenderStyle Method ===========================
    func createCalendarStyle() -> Style {
        var style = Style()
        style.timeline.isHiddenStubEvent = false
        style.startWeekDay = .monday
        style.systemCalendars = ["Calendar1", "Calendar2", "Calendar3"]
        
        style.event.iconFile = UIImage(systemName: "paperclip")
        style.timeline.scrollLineHourMode = .onlyOnInitForDate(defaultDate)
        style.timeline.showLineHourMode = .always
        style.month.autoSelectionDateWhenScrolling = true
        style.timeline.useDefaultCorderHeader = true
        style.timeline.timeColor = .blue
        style.timeline.timeDividerColor = .green
        //Show current time line
        style.timeline.currentLineHourColor = .cyan
        style.timeline.showLineHourMode = .never
        style.headerScroll.colorBackgroundCurrentDate = .blue
        style.headerScroll.colorWeekendDate = .black
        style.headerScroll.colorBackground = .clear
        style.headerScroll.fontNameDay = UIFont(name: "Poppins-Regular", size: 12.0) ?? UIFont()
        style.headerScroll.fontDate =  UIFont(name: "Poppins-Medium", size: 12.0) ?? UIFont()
        
        switch selectedType {
        case .today:
            style.headerScroll.heightHeaderWeek = 0
            style.headerScroll.heightSubviewHeader = 40
            
        case .week:
            style.headerScroll.heightHeaderWeek = 70
            style.headerScroll.heightSubviewHeader = 0
            
        case .month:
            style.headerScroll.heightHeaderWeek = 0
            style.headerScroll.heightSubviewHeader = 0
        }
        
        style.month.heightHeaderWeek = 30
        style.month.isHiddenTitleHeader = false
        style.month.isHiddenSectionHeader = true
        style.month.colorBackgroundCurrentDate = .blue
        style.month.colorWeekendDate = .black
        // style.month.scrollDirection = .horizontal
        style.month.fontNameDate = UIFont(name: "Poppins-Regular", size: 15.0) ?? UIFont()
        return style
    }
    
}

